#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = bloque y variables de instancia 
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#

a_closure = lambda { 
  @instance_variable << " closure!";
  puts "In #{self} object of class #{self.class}, @instance_variable = #{@instance_variable}"
}

class AClass
  def a_method(a_c)
    @instance_variable = "An instace variable in a method of AClass"
    puts "  [In AClass.a_method]"
    puts "in #{self} object of class #{self.class}, @instance_variable = #{@instance_variable}"
    puts "  [In AClass.a_method] when block is invoked"
    a_c.call
  end
end

an_object = AClass.new
an_object.a_method(a_closure)

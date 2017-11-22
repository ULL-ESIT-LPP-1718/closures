#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = bloque y variables de instancia 
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#

a_closure = lambda { @instance_variable << " closure!"; puts @instance_variable}
#a_closure = ->() { @instance_variable << " closure!"; puts @instance_variable }   

def a_method (a_closure)
  @instance_variable = "An instace variable in a method"
  a_closure.call
end

a_method(a_closure)
a_closure.call
#a_closure.()
#a_closure[]

#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = bloque e iteradores
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#
# Uno de lo usos más importantes de los bloques en Ruby es para proporcionar
# iteradores sobre los cuales poder pasar rangos y listas. 
# Si se sigue la filosofía de la Orientación a objetos es mejor que los objetos
# contengan sus propios iteradores.
# A continuación se extiende a la clase array con varios iteradores 
class Vector < Array
  def initialize (anArray)
    super(anArray)
  end

  def repetir( numero_veces )
    numero_veces.times do |indice|             # block 1
      self.each do |elemento|                  # block 2
        yield "[#{indice}] :: '#{elemento}'"
      end                                      # block 2
    end                                        # block 1
  end

  
  def iterar!
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  end 

  def recorrer!(&code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end 

  def repasar!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end 

  def encontrar
    self.each_with_index do |n, i|
      value = self[i]
      return value if yield(n) 
    end
    return nil
  end 

  def buscar
    0.upto(size-1) do |i|
      value = self[i]
      return value if yield(value) 
    end
    return nil
  end 

  def to_s
    s = ""
    0.upto(size) do |i|
      s << self[i].to_s + " "
    end
    return s 
  end

end

v = Vector.new([1,2,3])
v.repetir(1) {|i| puts i }

puts "\n ----------- \n"

v.repetir(2) {|i| puts i }

puts "\n ----------- \n"

puts v.to_s 
v.iterar!{|n| n**2 }
puts "-- o --"
puts v.to_s 

puts "\n ----------- \n"
puts v.to_s 
k = v.encontrar{|e| e*e > 10}
puts k

puts "\n ----------- \n"
puts v.to_s 
k = v.buscar{|e| e*e < 80 }
puts k

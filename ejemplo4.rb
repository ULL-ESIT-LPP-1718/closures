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

# A continuación se definen
#  - un iterador simple que ejecuta un bloque el número de veces especificado
#  - un iterador sobre un array

def repetir( numero_veces )
  for i in 1..numero_veces do
    yield i
  end
end

repetir(3) {|i| puts "[#{i}] LPP " }

puts "\n ------------------ \n"

def repetir_sobre( vector )
  vector.each do |elemento|
    yield elemento
  end
end

repetir_sobre(["elemento_1", "elemento_2", "elemento_3"]) { |e| puts e }

#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = precedencia
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#
# Los bloque entre llaves tienen mayor precedencia que los bloques entre *do* y *end*

def a_method (b)
  puts("--- in a_method ---")
  a = 'a_method'
  if block_given?
    puts "Block passed to a_method"
    yield a
  else
    puts "No Block passed to a_method"
  end
  puts "in a_method, arg b = #{b}"
  return "returned by #{a}"
end

def un_metodo
  puts("--- en un_metodo ---")
  a = 'un_metodo'
  if block_given?
    puts "Se paso un bloque a un_metodo"
    yield a
  else
    puts "No se pasó ningún bloque a un_metodo"
  end
  return "devuelto por #{a}"
end


a_method un_metodo do |s| puts s end  # 1. do..end  block
# a_method( un_metodo ) do |s| 
#  puts s 
# end

puts "\n ------------------ \n"

a_method un_metodo {|s| puts s}       # 2. {...} block

#a_method( un_metodo {|s| puts s})

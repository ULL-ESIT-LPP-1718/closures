#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = Paso de parámetros con proc (procedures)
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#
# == Bloques y yield
#
# Se ha visto:
# - como pasar bloque a procedimientos de forma anónima (el bloque se ejecuta cuando se encuenta un *yield*)
# - como pasar procs y lambda a procedimientos como argumentos (el bloque se ejecuta cuando se invoca un *call*)
#
# === Ejemplos
#
# Con estos ejemplos se pretende estudiar otra forma de pasar un bloque:
# * Cuando el último argumento de la lista de parámetros está precedida por un & se considerará que sun objeto Proc.
#

def a_method( a, b, c)
  a.call
  b.call
  c.call
  yield
end

a = lambda {puts "one" }
b = lambda {puts "two" }
c = proc { puts "three" }
a_method(a,b,c){puts "four"}

puts "\n=============\n"

def a_method_2( &d)
  d.call
end

a_method_2{puts "one"}

# a_method_2(10) # wrong number of arguments (1 for 0) (ArgumentError)

puts "\n=============\n"

def a_method_3( a, b, c, &d)
  a.call
  b.call
  c.call
  d.call         # 1. call to block &d
  # yield        # 2. call to block &d
end

a_p = Proc.new {puts "four"}
a_method_3(a,b,c, &a_p)
puts "--o--"
a_method_3(a,b,c) {puts "four"}
# a_method_3(a,b,c, &a_p){puts "five"} # both block arg and actual block given

puts "\n=============\n"

def a_method_4
  a = 1
  b = 2
  c = 3
  yield( a, b, c )
end

a_method_4 { |x,y,z| puts (x+y+z) }
puts "--o--"
puts a, b, c

puts "++++++       --o--         +++++"
a_method_4 { |a,b,c| puts (a+b+c) }
puts "--o--"
puts a, b, c
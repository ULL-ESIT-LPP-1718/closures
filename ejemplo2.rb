#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = Ambientes con los bloques
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#
# == Tener mucho cuidado al definir los nombres de variables si hay bloques

a = "hello world"

def method
  yield 100
end

puts a

method {|a| puts a}

puts a
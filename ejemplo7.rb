#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = devolviendo bloques desde métodos
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#

def calcTax (taxRate)
  # return lambda { |subtotal| subtotal * taxRate}
  l = ->(subtotal) { subtotal * taxRate}     # 1.9
end

salesTax = calcTax(0.10)
vat = calcTax(0.175)

print "Tax due on book = "
# print salesTax.call(10)
print salesTax.(10)                      #1.9


print "\nVat due on DVD = "
# print vat.call(10)
print vat[10]                            #1.9
puts

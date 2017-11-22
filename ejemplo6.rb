#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
# = bloque e iteradores
#
# Autor::   Coromoto Leon
# Web::     http://github.com/coromoto/closures
#
# Array múltiples

matriz = 
[ ['one', 'two', 'three', 'four'],
  [1,     2,     3,       4     ],
  [:a,    :b,    :c,      :d    ]
]

matriz[0].length.times do |i|
  puts matriz[0][i], matriz[1][i]
end

puts "\n ------------------ \n"

matriz.each do |vector|
  matriz[0].length.times do |i|
    puts vector[i]
  end
end

puts "\n ------------------ \n"

matriz[0].length.times do |i|
  matriz.each do |vector|
    puts vector[i]
  end
end


@m = [ [1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]]

s = ""
0.upto(@m.length-1) do |i|
  0.upto(@m[0].length-1) do |j|
    s << ((@m[i])[j]).to_s + " "
  end
  s << "\n"
end
puts s 

def buscar
  0.upto(@m.length-1) do |i|
    0.upto(@m[0].length-1) do |j|
      value = @m[i][j]
      return [i,j] if yield(value)
    end
  end
  return nil
end

k, h = buscar{|e| e*e >= 81}
puts "i=#{k} j=#{h}" 

k, h = buscar{|e| e*e >= 25}
puts "i=#{k} j=#{h}" 

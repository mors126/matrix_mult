#!/usr/bin/ruby
# coding: utf-8
require "mathn"
require "matrix"

print "razmer 1 matrici:\n"
print "kolichestvo strok: "
str1 = gets.chomp.to_i
print "kolichestvo stolbcov: "
st1 = gets.chomp.to_i
print "razmer 2 matrici:\n"
print "kolichestvo strok: "
str2 = gets.chomp.to_i
print "kolichestvo stolbcov: "
st2 = gets.chomp.to_i
puts "Matrix a: [#{str1},#{st1}] ==\n"
a = Matrix.build(str1, st1) { rand(6) }.to_a
#puts "#{a}"
puts a.to_a.to_s.split(/],/)
puts "Matrix b: [#{str2},#{st2}] ==\n"
b = Matrix.build(str2, st2) { rand(6) }.to_a
puts b.to_a.to_s.split(/],/)
@cnt = 0

def matrix_sub(m1, m2)
  if m1[0].size != m2.size
    print "WRONG MATRIX SIZE"
  else
    #puts "#{m1.size}"  #kolichestvo strok matrici 1
    #puts "#{m1[0].size}"  #kolichestvo stolbcov matrici 1
    Array.new(m1.size) do |i|
      Array.new(m2[0].size) do |j|
	m2.size.times.inject(0) { |acc, k| acc + m1[i][k] * m2[k][j]; @cnt += 2 }
        @cnt -= 1
        # times, который возвращает нумератор, перебирающий значения от нуля до числа (не включая само число)
        #метод inject который выполняет вычисление элементов новой матрицы (изначально равен 0)
      end
    end
  end
end
m = matrix_sub(a, b)
puts "\nCount operation = #{@cnt}"
puts "\nRESULT Matrix: [#{str1},#{st2}] ==\n"
puts Matrix[*m].to_a.to_s.split(/],/)


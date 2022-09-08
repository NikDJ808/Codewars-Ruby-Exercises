# Exercise no. 12 - DNA to RNA Conversion


# Deoxyribonucleic acid, DNA is the primary information storage molecule in biological systems.
# It is composed of four nucleic acid bases Guanine ('G'), Cytosine ('C'), Adenine ('A'), and Thymine ('T').
# Ribonucleic acid, RNA, is the primary messenger molecule in cells.
# RNA differs slightly from DNA its chemical structure and contains no Thymine.
# In RNA Thymine is replaced by another nucleic acid Uracil ('U').

# Create a function which translates a given DNA string into RNA.

# For example:

# "GCAT"  =>  "GCAU"

# The input string can be of arbitrary length - in particular, it may be empty.
# All input is guaranteed to be valid, i.e. each input string will only ever consist of 'G', 'C', 'A' and/or 'T'.

def dna_to_rna(dna)
  unless dna.include?("T")
    p dna
  else
    array = dna.split("")
    array.each_with_index do |acid, i|
      if acid == "T"
        array[i] = "U"
      end
    end
    p array.join
  end
end

#--------------------------------------------------------------------------------------------------------------------------

# Exercise no. 13 - Calculate BMI


# Write a function bmi that calculates body mass index (bmi = weight / height2).

# if bmi <= 18.5 return "Underweight"
# if bmi <= 25.0 return "Normal"
# if bmi <= 30.0 return "Overweight"
# if bmi > 30 return "Obese"

def bmi(weight, height)
  bmi = weight / (height ** 2)

  case
  when bmi <= 18.5
    return 'Underweight'
  when bmi <= 25.0
    return 'Normal'
  when bmi <= 30.0
    return 'Overweight'
  when bmi > 30
    return 'Obese'
  end
end

#---------------------------------------------------------------------------------------------------------------------------

# Exercise no. 14 - Complementary DNA


# Deoxyribonucleic acid (DNA) is a chemical found in the nucleus of cells and
# carries the "instructions" for the development and functioning of living organisms.

# In DNA strings, symbols "A" and "T" are complements of each other, as "C" and "G".
# Your function receives one side of the DNA(string); you need to return the other complementary side.
# DNA strand is never empty or there is no DNA at all.

# Example: (input --> output)

# "ATTGC" --> "TAACG"
# "GTAT" --> "CATA"

def dna_strand(dna)
  string_to_array = dna.split("")
  solution = string_to_array.each_with_index do |x, i|
    if x == "G"
      string_to_array[i] = "C"
    elsif x == "C"
      string_to_array[i] = "G"
    elsif x == "A"
      string_to_array[i] = "T"
    elsif x == "T"
      string_to_array[i] = "A"
    end
  end
  solution.join
end

#----------------------------------------------------------------------------------------------------------------------------

# Exercise no. 15 - Find The Next Perfect Square


# You might know some pretty large perfect squares. But what about the NEXT one?
# Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter.
# Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.
# If the parameter is itself not a perfect square then -1 should be returned. You may assume the parameter is non-negative.

# Examples:(Input --> Output)

# 121 --> 144
# 625 --> 676
# 114 --> -1 since 114 is not a perfect square

def find_next_square(sq)
  if Math.sqrt(sq) % 1 == 0
    flag = true
    while flag
      sq += 1
      if Math.sqrt(sq) % 1 == 0
        flag = false
      end
    end
    return sq
  else
    return -1
  end
end

#---------------------------------------------------------------------------------------------------------------------------

# Exercise no. 16 - Friend or Foe?


# Make a program that filters a list of strings and returns a list with only your friends name in it.
# If a name has exactly 4 letters in it, you can be sure that it has to be a friend of yours!
# Otherwise, you can be sure he's not...

# Ex: Input = ["Ryan", "Kieran", "Jason", "Yous"], Output = ["Ryan", "Yous"]

# i.e.

# friend ["Ryan", "Kieran", "Mark"] `shouldBe` ["Ryan", "Mark"]

# Note: keep the original order of the names in the output.

def friend(friends)
  array = []
  friends.each_with_index do |x|
    if x.length == 4
      array << x
    end
  end
  return array
end

#--------------------------------------------------------------------------------------------------------------------------

# Exercise no. 17 - Remove the Minimum


# Given an array of integers, remove the smallest value.
# Do not mutate the original array/list. If there are multiple elements with the same value,
# remove the one with a lower index. If you get an empty array/list, return an empty array/list.

# Don't change the order of the elements that are left.

# Examples
# Input: [1,2,3,4,5], output= [2,3,4,5]
# Input: [5,3,2,1,4], output = [5,3,2,4]
# Input: [2,2,1,2,1], output = [2,2,2,1]

def remove_smallest(numbers)
  if numbers.empty?
    return []
  else
    duplicate = numbers.dup
    index = duplicate.index(duplicate.min)
    duplicate.delete_at(index)
    duplicate
  end
end

#-------------------------------------------------------------------------------------------------------------------------

# Exercise no. 18 - Categorize New Member


# The Western Suburbs Croquet Club has two categories of membership, Senior and Open.
# They would like your help with an application form that will tell prospective members which category they will be placed.
# To be a senior, a member must be at least 55 years old and have a handicap greater than 7.
# In this croquet club, handicaps range from -2 to +26; the better the player the lower the handicap.

# Input

# Input will consist of a list of pairs. Each pair contains information for a single potential member.
# Information consists of an integer for the person's age and an integer for the person's handicap.

# Output

# Output will consist of a list of string values stating whether the respective member is to be placed
# in the senior or open category.

# Example

# input =  [[18, 20], [45, 2], [61, 12], [37, 6], [21, 21], [78, 9]]
# output = ["Open", "Open", "Senior", "Open", "Open", "Senior"]

def open_or_senior(data)
  array = []
  data.each do |element|
    if element[0] >= 55 && element[1] > 7
      array << "Senior"
   else
      array << "Open"
    end
  end
  return array
end

#-------------------------------------------------------------------------------------------------------------------------

# Exercise no. 19 - Sum of the First Nth Term of Series


# Your task is to write a function which returns the sum of following series upto nth term(parameter).

# Series: 1 + 1/4 + 1/7 + 1/10 + 1/13 + 1/16 +...

# You need to round the answer to 2 decimal places and return it as String.
# If the given value is 0 then it should return 0.00
# You will only be given Natural Numbers as arguments.

# Examples:(Input --> Output)
# 1 --> 1 --> "1.00"
# 2 --> 1 + 1/4 --> "1.25"
# 5 --> 1 + 1/4 + 1/7 + 1/10 + 1/13 --> "1.57"

def series_sum(n)
  case n
  when 0
    return "0.00"
  when 1
    return "1.00"
  else
    sum = 1
    i = 1
    (n-1).times do
      sum += 1/(3*i+1).to_f
      i += 1
    end
    rounded_sum = sum.round(2)
    return sprintf("%.2f", rounded_sum)
  end
end

#-----------------------------------------------------------------------------------------------------------------------

# Exercise no. 20 - Count of Positives/Sum of Negatives


# Given an array of integers.
# Return an array, where the first element is the count of positives numbers and the second element
# is sum of negative numbers. 0 is neither positive nor negative.
# If the input is an empty array or is null, return an empty array.

# Example
# For input [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15], you should return [10, -65].

def count_positives_sum_negatives(lst)
  array = []
  if lst.empty?
    return []
  else
    first_element = 0
    second_element = 0
    lst.each do |num|
      if num > 0
        first_element += 1
      elsif num < 0
        second_element += num
      end
    end
    array << first_element
    array << second_element
  end
  return array
end

#----------------------------------------------------------------------------------------------------------------------

# Exercise no. 21 - Traffic Lights


# You're writing code to control your town's traffic lights.
# You need a function to handle each change from green, to yellow, to red, and then to green again.
# Complete the function that takes a string as an argument representing the current state of the light
# and returns a string representing the state the light should change to.
# For example, when the input is green, output should be yellow.

def update_light(current)
  case current
  when 'green'
    return 'yellow'
  when 'yellow'
    return 'red'
  when 'red'
    return 'green'
  end
end

#---------------------------------------------------------------------------------------------------------------------

# Exercise no. 22 - Abbreviate a Two Word Name


# Write a function to convert a name into initials. This kata strictly takes two words with one space in between them.
# The output should be two capital letters with a dot separating them.

# It should look like this:
# Sam Harris => S.H
# patrick feeney => P.F

def abbrev_name(name)
  array = name.split(" ")
  first_initial = array[0][0].upcase
  second_initial = array[1][0].upcase
  return first_initial + "." + second_initial
end

#--------------------------------------------------------------------------------------------------------------------

# Exercise no. 23 - Removing Elements


# Take an array and remove every second element from the array.
# Always keep the first element and start removing with the next element.

# Example:
# ["Keep", "Remove", "Keep", "Remove", "Keep", ...] --> ["Keep", "Keep", "Keep", ...]

# None of the arrays will be empty, so you don't have to worry about that!

def remove_every_other(arr)
  new_array = []
  arr.each_with_index do |element, index|
    if index == 0
      new_array << element
    elsif index.even?
      new_array << element
    end
  end
  return new_array
end

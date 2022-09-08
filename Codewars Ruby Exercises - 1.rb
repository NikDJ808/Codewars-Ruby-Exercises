# Exercise no. 1 - Bit Counting


# Write a function that takes an integer as input, and returns the number of
# bits that are equal to one in the binary representation of that number.

# You can guarantee that input is non-negative.

# Example: The binary representation of 1234 is 10011010010,
# so the function should return 5 in this case

def count_bits(n)
  counter = 0
  while n > 0
    if n % 2 == 1
      counter += 1
    end
    n = n / 2
  end
  return counter
end

# Exercise no. 2 - Detect Pangram


# A pangram is a sentence that contains every single letter of the alphabet
# at least once.

# For example, the sentence "The quick brown fox jumps over the lazy dog" is a
# pangram, because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is,
# False if not. Ignore numbers and punctuation.

def pangram?(string)
  range = "a".."z"
  sample = range.to_a
  modified_string = string.downcase.split("").sort&sample
  if modified_string == sample
    true
  else
    false
  end
end

# Exercise no. 3 - Array.diff


# Your goal in this kata is to implement a difference function,
# which subtracts one list from another and returns the result.

# It should remove all values from list a, which are present in list b
# keeping their order.

def array_diff(a, b)
  array_diff = []
  a.each do |num|
    unless b.include?(num)
      array_diff << num
    end
  end
  array_diff
end

# Exercise no. 4 - Unique In Order


# Implement the function unique_in_order which takes as argument a sequence
# and returns a list of items without any elements with the same value next
# to each other and preserving the original order of elements.

# For example:
# unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# unique_in_order([1,2,2,3,3])       == [1,2,3]

def unique_in_order(iterable)
  result = []
  unless iterable.is_a?(Array)
    iterable.split("").each_with_index do |char, index|
      unless char == iterable[index+1]
        result << char
      end
    end
  else
    iterable.each_with_index do |char, index|
      unless char == iterable[index+1]
        result << char
      end
    end
  end
  result
end

# Exercise no. 5 - Find The Odd Int


# Given an array of integers, find the one that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.

# Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

def find_it(array)
  array.each do |num|
    if array.count(num).odd?
      return num
    end
  end
end

# Exercise no. 6 - Who Likes It?


# You probably know the "like" system from Facebook and other pages. People can
# "like" blog posts, pictures or other items. We want to create the text that
# should be displayed next to such an item.

# Implement the function which takes an array containing the names of people
# that like an item. It must return the display text as shown in the examples:

# []                                -->  "no one likes this"
# ["Peter"]                         -->  "Peter likes this"
# ["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
# ["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
# ["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"

# Note: For 4 or more names, the number in "and 2 others" simply increases.

def likes(names)
  case names.count()
   when 0
     return "no one likes this"
   when 1
     return "#{names[0]} likes this"
   when 2
     return "#{names[0]} and #{names[1]} like this"
   when 3
     return "#{names[0]}, #{names[1]} and #{names[2]} like this"
   else
     return "#{names[0]}, #{names[1]} and #{names.count-2} others like this"
   end
end

# Exercise no. 7 - Counting Duplicates


# Count the number of Duplicates

# Write a function that will return the count of distinct case-insensitive
# alphabetic characters and numeric digits that occur more than once in the
# input string. The input string can be assumed to contain only alphabets
# (both uppercase and lowercase) and numeric digits.

# Example
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice

def duplicate_count(text)
  array = []
  text.downcase.each_char do |char|
    if text.downcase.count(char) > 1
      array << char
    end
  end
  return array.uniq.count
end

# Exercise no. 8 - Duplicate Encoder


# The goal of this exercise is to convert a string to a new string where
# each character in the new string is "(" if that character appears only once
# in the original string, or ")" if that character appears more than once in
# the original string. Ignore capitalization when determining if a character is
# a duplicate.

# Examples
# "din"      =>  "((("
# "recede"   =>  "()()()"
# "Success"  =>  ")())())"
# "(( @"     =>  "))(("

def duplicate_encode(word)
  array = []
  word.downcase.each_char do |char|
    if word.downcase.count(char) > 1
      char = ")"
    else
      char = "("
    end
    array << char
  end
  return array.join
end

# Exercise no. 9 - Write Number in Expanded Form


# You will be given a number and you will need to return it as a string in
# Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'

# NOTE: All numbers will be whole numbers greater than 0.

def expanded_form(num)
  array = num.to_s.split("").map { |e| e.to_i  }
  i = 1
  new_array = []
  array.each do |element|
    expanded = element * 10**(array.length-i)
    i += 1
    next if expanded == 0
    new_array << expanded
  end
  return new_array.join(" + ")
end

# Exercise no. 10 - Hashed String


# Return a hash where keys will represent
# the words in the string and the values will
# represent how many times that key occurs.

def word_count(string)
  collection = {}
  array = string.split(" ")
  array.each do |word|
    value = array.count(word)
    collection[word] = value
  end
  p collection
end

# Exercise no. 11 - Longest Concatenated String


# You are given an array of strings.
# Concatenate consecutive strings and return the FIRST longest one.

def longest_concat_string(strarr)
  new_array = []
  i = 0
  j = 1
  (strarr.length-1).times do
    new_element = strarr[i] + strarr[j]
    new_array << new_element
    i += 1
    j += 1
  end
  longest_word_size = new_array.sort_by {|element| element.length}.pop.size
  new_array.each do |element|
    if element.size == longest_word_size
      return element
      break
    end
  end
end

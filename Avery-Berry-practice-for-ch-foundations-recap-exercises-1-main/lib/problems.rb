# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  new_arr = []

  words.each_with_index do |word1, i|
    words.each_with_index do |word2, a|
      if (i < a) && (word1 + word2).include?("a") && (word1 + word2).include?("e") && (word1 + word2).include?("i") && (word1 + word2).include?("u") && (word1 + word2).include?("u")
        new_arr << (word1 + " " + word2)
      end
    end
  end
  new_arr
end


# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
  (2...num).each {|el| return true if num % el == 0 }
  return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  new_str = []
  bigrams.each {|el| new_str << el if str.include?(el)}
  return new_str
end


# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
# hash_1 = {x: 7, y: 1, z: 8}
# hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# hash_2.my_select                            # => {4=>4}
class Hash

  def my_select(&prc)

    hash = Hash.new()

    if prc == nil 
      self.each do |k,v|
        if k == v
          hash[k] = v
        end
      end

    else
      self.each do |k,v|
        hash[k] = v if prc.call(k,v)
      end
    end
    return hash
  end

end


# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#
# Examples:
#
# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]
class String

  def substrings(length = nil)
    new_arr = []
    new_string = []

    #all sub strings
    self.each_char.with_index do |char1, i|
      new_str = char1
      self.each_char.with_index do |char2, a|
        if i < a 
          new_arr << new_str
          new_str += char2
        end
      end
      new_arr << new_str
    end

    if length != nil
      new_arr.each do |el|
        new_string << el if el.length == length
      end
      return new_string
    end

    return new_arr
  end

end


# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"
class String
  def caesar_cipher(num)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    arr = self.split("")

    arr.each_with_index do |char, i|
      char_index = (alpha.index(char) + num) % 26
      arr[i] = alpha[char_index]
    end

    return arr.join("")
  end
end
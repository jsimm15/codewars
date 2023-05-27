# Return the number (count) of vowels in the given string.
# We will consider a, e, i, o, u as vowels for this Kata (but not y).
# The input string will only consist of lower case letters and/or spaces.

def get_count(string)
  vowels = %w(a e i o u)
  count = 0
  string.each_char do |c|
    if vowels.include?(c) then count += 1 end
  end
  puts count
end

get_count("hello, there, you apple tie guy")
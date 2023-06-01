=begin 
Complete the method/function so that it converts dash/underscore delimited words into camel casing. The first word within the output should be capitalized only if the original word was capitalized (known as Upper Camel Case, also often referred to as Pascal case). The next words should be always capitalized.

Examples
"the-stealth-warrior" gets converted to "theStealthWarrior"

"The_Stealth_Warrior" gets converted to "TheStealthWarrior"

"The_Stealth-Warrior" gets converted to "TheStealthWarrior"
=end

def to_camel_case(str)
  cap = false
  camel = ""
  str.each_char do |c|
    if  ["-","_"].any?(c)
      cap = true
    else 
      if cap == true
        c.upcase!
        cap = false
      end
      camel += c
    end
  end
  return camel
end

=begin 
top answer

str.gsub(/[_-](.)/) {"#{$1.upcase}"}

## the most important part in that regex, (.), is the parentheses though, which captures the . ("any character except newline") and feeds it into $1
##The string interpolation is unnecessary. You can just do $1.upcase

other solutions
def to_camel_case(str)
  
  phrase = str.include?('_') ? str.split('_') : str.split('-')
  
  phrase.map.with_index do |word, index|
    index == 0 ? word : word.capitalize
  end.join('')

end
#This solution splits the og string into an array delimited by the character [_-]. All "words" that aren't at the start of the string are capitalized and
joined back together.



def to_camel_case(str)
  head, *tail = str.split(/[-_]/)
  head.to_s + tail.map(&:capitalize).join
end

#Here, *tail utilizes parallel assignment to create a head consisting of the first string element that results from the split command, while *tail creates a variable number
of tail arrays that are joined together before being concatenated with the head string.

=end
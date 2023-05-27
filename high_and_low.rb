=begin 
In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.

Examples
high_and_low("1 2 3 4 5")  # return "5 1"
high_and_low("1 2 -3 4 5") # return "5 -3"
high_and_low("1 9 3 4 -5") # return "9 -5"
Notes
All numbers are valid Int32, no need to validate them.
There will always be at least one number in the input string.
Output string must be two numbers separated by a single space, and highest number is first.
=end

def high_and_low(numbers)
  #your code here
  nums = numbers
  current = ""
  high, low = nil
  nums.each_char do |c|
    if c == " "
      if (high.nil? || current.to_i >= high.to_i)
        high = current
      end
      if (low.nil? || current.to_i <= low.to_i)
        low = current
      end
      current = ""
    elsif c == nums[-1]
      current = current + c
      if (high.nil? || current.to_i >= high.to_i)
        high = current
      end
      if (low.nil? || current.to_i <= low.to_i)
        low = current
      end
    else
      current = current + c
    end
    puts "current:#{current} high:#{high} low:#{low}"
  end
  return "#{high} #{low}"
end

high_and_low("1 2 3 4")
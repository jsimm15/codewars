=begin 
Write a function that takes an array of numbers (integers for the tests) and a target number. 
It should find two different items in the array that, when added together, give the target value.
The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers;
   target will always be the sum of two different items from that array).
=end

def two_sum(numbers, target)
  numbers.each_with_index do |num, i|
    puts "num:#{num}, i:#{i}"
    #return false if i == (numbers.length-1)
    second_array = numbers.clone
    second_array.delete_at(i)
    second_array.each do |num2|
      puts "second_array: #{second_array}"
      puts "num2: #{num2}"
      if num + num2 == target && i != numbers.index(num2)
        puts "solution: [#{i}, #{numbers.index(num2)}]"
      end
    end
  end
end


two_sum([1,2,3,4,5], 9)
two_sum([2,2,3], 4)

=begin
def twoSum(numbers, target)
  numbers.each_with_index do |n1, i1|
    numbers.each_with_index do |n2, i2|
      return [i1, i2] if (n1 + n2) == target && i1 != i2
    end
  end
end
=end
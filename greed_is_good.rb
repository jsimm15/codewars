=begin   
Greed is a dice game played with five six-sided dice. Your mission, should you choose to accept it, is to score a throw according to these rules. You will always be given an array with five six-sided dice values.

 Three 1's => 1000 points
 Three 6's =>  600 points
 Three 5's =>  500 points
 Three 4's =>  400 points
 Three 3's =>  300 points
 Three 2's =>  200 points
 One   1   =>  100 points
 One   5   =>   50 point
A single die can only be counted once in each roll. For example, a given "5" can only count as part of a triplet (contributing to the 500 points) or as a single 50 points, but not both in the same roll.

Example scoring

 Throw       Score
 ---------   ------------------
 5 1 3 4 1   250:  50 (for the 5) + 2 * 100 (for the 1s)
 1 1 1 3 1   1100: 1000 (for three 1s) + 100 (for the other 1)
 2 4 4 5 4   450:  400 (for three 4s) + 50 (for the 5)
In some languages, it is possible to mutate the input to the function. This is something that you should never do. If you mutate the input, you will not be able to pass all the tests.
=end

def score(dice)
  count = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0}
  score = 0
  dice.each do |single|
    count.each_key do |key|
      if single == key
        count[key] += 1
      end
    end
  end
  count.each do |key,value|
    if count[key] >= 3 && key == 1
      score += 1000
      count[key] -= 3
      redo
    elsif count[key] >= 3
      score += (key*100)
      count[key] -= 3
      redo
    elsif key == 1
      score += (100*count[key])
    elsif key == 5
      score += (50*count[key])
    end
  end
  return score
end


score([1,1,3,4,4])
score([2,3,4,6,2])

=begin
top answer
SCORE_MAP = {
  1 => [0, 100, 200, 1000, 1100, 1200, 2000],
  2 => [0, 0, 0, 200, 200, 200, 400],
  3 => [0, 0, 0, 300, 300, 300, 600],
  4 => [0, 0, 0, 400, 400, 400, 800],
  5 => [0, 50, 100, 500, 550, 600, 1000],
  6 => [0, 0, 0, 600, 600, 600, 1200]
}

def score( dice )
  (1..6).inject(0) do |score, die|
    score += SCORE_MAP[die][dice.count(die)]
  end
end
=end
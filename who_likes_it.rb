def likes(names)
  list = names
  count = list.length

  case count 
  when 0 
    "no one likes this"
  when 1
    "#{list.first} likes this"
  when 2
    "#{list.first} and #{list.last} like this"
  when 3
    "#{list.first}, #{list[1]} and #{list.last} like this" 
  else
    "#{list.first}, #{list[1]} and #{count - 2} others like this"
  end
end

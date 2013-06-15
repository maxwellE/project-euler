def palindromic n
  count = 0
  revsum = n + n.to_s.reverse.to_i
  while count < 50
    if revsum.to_s.reverse == revsum.to_s
      return true
    end
    revsum = revsum + revsum.to_s.reverse.to_i
    count +=1
  end
  false
end

puts (0...10000).select{|x| !palindromic(x)}.length

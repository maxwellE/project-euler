digits = []
(1..(10**1000000)).inject(".") do |str,x|
  str << x.to_s
  if str[1]
    digits << str[1].to_i
  elsif str[10]
    digits << str[10].to_i
  elsif str[100]
    digits << str[100].to_i
  elsif str[1000]
    digits << str[1000].to_i
  elsif str[10000]
    digits << str[10000].to_i
  elsif str[100000]
    digits << str[100000].to_i
  elsif str[1000000]
    digits << str[1000000].to_i
    break
  end
end
puts digits.inspect

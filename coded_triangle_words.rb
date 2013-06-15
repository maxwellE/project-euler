ALPHA = ('A'..'Z').to_a
def main
  counter = 0
  File.read('coded_triangle_words.txt').split(",").each do |word|
    if is_triangle_word(word)
      counter+=1
    end
  end
  puts counter
end

def is_triangle_word(w)
  word = w[1..-2] 
  ints = word.chars.map{|x| ALPHA.index(x)+1}
  summed_word = ints.reduce(:+)
  trival = (Math.sqrt(8*summed_word+1) -1)/2.0
  trival.ceil == trival.floor
end

if $0 == __FILE__
  main
end

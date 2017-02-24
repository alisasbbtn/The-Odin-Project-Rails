class Dictionary
  def initialize
    @dictionary = File.readlines('public/5desk.txt').select { |word| word if word.length > 5 && word.length < 12 }
  end

  def random_word
    @dictionary[rand(@dictionary.size-1)][/\w+/].chomp.downcase
  end
end

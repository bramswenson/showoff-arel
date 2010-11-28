def random_chars(count=10, lower = true, upper = true)
  chars = []
  chars += ('a'..'z').to_a if lower
  chars += ('A'..'Z').to_a if upper
  count.to_i.times.map { chars[rand(chars.length)] }.join
end

def random_numbers(count=10)
  count.to_i.times.map { rand(8)+1 }.join
end

def random_title(word_count=nil)
  word_count = random_numbers(1) unless word_count
  Lorem::Base.new(:words, word_count)
end

def random_body(paragraph_count=nil)
  paragraph_count = random_numbers(1) unless paragraph_count
  Lorem::Base.new(:words, paragraph_count)
end

Factory.sequence(:email) { random_chars( true, false ) + '@matrix.com' }
Factory.sequence(:title) { random_title }
Factory.sequence(:body)  { random_body }

def random_chars(count=10, lower = true, upper = true)
  chars = []
  chars += ('a'..'z').to_a if lower
  chars += ('A'..'Z').to_a if upper
  count.to_i.times.map { chars[rand(chars.length)] }.join
end

def random_numbers(count=10)
  count.to_i.times.map { rand(8)+1 }.join
end

def random_body(paragraph_count=nil)
  paragraph_count = random_numbers(1) unless paragraph_count
  Lorem::Base.new(:words, paragraph_count)
end

DICT = File.readlines('/usr/share/dict/words').delete_if { |l| l.blank? }

def random_name( words = 2, allow_specials = false, downcase = false )
  (1..words).map do
    w = DICT[rand(DICT.length)]
    w = w.downcase if downcase
    w = w.gsub(/[^0-9a-zA-Z@\.]/, '') unless allow_specials
    w.chop
  end.join(' ')
end

def random_email 
  domains = %w{ craniumisajar.com starwars.com matrix.com }
  [ random_name(1, false, true), '@', domains[rand(domains.size)] ].join
end

Factory.sequence(:name)    { random_name }
Factory.sequence(:email)   { random_email }
Factory.sequence(:title)   { random_name(rand(8)+1, true, false) }
Factory.sequence(:body)    { random_body }
Factory.sequence(:comment) { random_body(1) }

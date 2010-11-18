# encoding: UTF-8

# Users
diogo_almeida = User.new
diogo_almeida.name     = 'Diogo Almeida'
diogo_almeida.email    = 'diogo.almeida@gnomeslab.com'
diogo_almeida.password = 'gnomes1234'
diogo_almeida.save!
diogo_almeida.reload
diogo_almeida.encrypted_password  = '$2a$10$g0swLQhDbxiARNNwP7rWteYlA48QNOEIkBfmkUkzEFr/sWIhCTDJG'
diogo_almeida.password_salt       = '$2a$10$g0swLQhDbxiARNNwP7rWte'
diogo_almeida.save!

pedro_coutinho = User.new
pedro_coutinho.name = 'Pedro Coutinho'
pedro_coutinho.email = 'pedro.coutinho@gnomeslab.com'
pedro_coutinho.password = '123456'
pedro_coutinho.save!

miguel_teixeira          = User.new
miguel_teixeira.name     = 'Miguel Teixeira'
miguel_teixeira.email    = 'miguel.teixeira@gnomeslab.com'
miguel_teixeira.password = '123456'
miguel_teixeira.save!

# Development seed
if Rails.env == "development"
  # Blog posts
  Factory.create(:published_post)
  Factory.create(:post)
  
  # Comments
  5.times do
    Post.all.each { |p| Factory.create(:comment, :post => p) }
  end

  # HumanDetector Questions
  5.times { |i| HumanDetector::Question.create(:title => "How much is #{i} + #{i * 2}?", :answer => "#{i + i * 2}") }
  5.times { |i| HumanDetector::Question.create(:title => "Complete the sequence: #{i}, #{i+1}, #{i+2}, __ ?",
                                               :answer => "#{i+3}") }
  5.times { |i| HumanDetector::Question.create(:title => "Complete the sequence: #{i}, __, #{i+2}, #{i+3} ?",
                                               :answer => "#{i+1}") }
  { 0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten" }.each { |k,v| HumanDetector::Question.create(:title=> "#{k} in English (e.g. #{v})?", :answer=> v) }

  10.times do |i|
    HumanDetector::Question.create(:title => "Which year corresponds to 2010 minus #{i} (e.g. #{2010 - i})",
                                   :answer => (2010-i).to_s)
  end

  100.times do |i|
    HumanDetector::Question.create(:title => "Is #{i} and even number (e.g. #{i.even? ? 'yes' : 'no'})?",
                                   :answer => i.even? ? "yes" : "no")
    HumanDetector::Question.create(:title => "Is #{i} an odd number (e.g. #{i.even? ? 'no' : 'yes'})?",
                                   :answer => i.even? ? 'no' : 'yes')
  end

  HumanDetector::Question.create(:title => 'Are you a bot (e.g. yes)?', :answer => 'no')
  HumanDetector::Question.create(:title => 'Are you a sure? (e.g. no)?', :answer => 'yes')
  HumanDetector::Question.create(:title => 'Are you alive? (e.g. no)?', :answer => 'yes')
  HumanDetector::Question.create(:title => 'Are you human? (e.g. no)?', :answer => 'yes')
  HumanDetector::Question.create(:title => 'Do you live on earth (e.g. yes)?', :answer => 'yes')
  HumanDetector::Question.create(:title => 'Are you spamming (e.g. no)?', :answer => 'no')
  HumanDetector::Question.create(:title => 'Are you a spam bot (e.g. yes)?', :answer => 'no')
end

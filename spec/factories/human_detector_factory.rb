# encoding: UTF-8

Factory.define(:question, :class => HumanDetector::Question) do |q|
  q.title "How much is 1 + 1?"
  q.answer "2"
end
Given /^There (?:are|is) (\d+) (.+)$/ do |n, name|
  n.to_i.times do |i|
    Factory(name.gsub(/\s/, '_').singularize.to_sym)
  end
end

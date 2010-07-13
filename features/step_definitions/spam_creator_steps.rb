Given /^there are (\d+) (.+)$/ do |n, model_str|
  model_str = model_str.gsub(/\s/, '_').singularize
  model_sym = model_str.to_sym
  klass = model_str.camelize.constantize
  klass.transaction do
    n.to_i.times do |i|
      Factory(model_sym)
    end
  end
end
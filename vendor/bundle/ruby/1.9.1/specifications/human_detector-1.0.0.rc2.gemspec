# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{human_detector}
  s.version = "1.0.0.rc2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gnomeslab, Lda."]
  s.date = %q{2010-11-18}
  s.description = %q{HumanDetector is a friendly logic captcha for Rails the doesn't require any external system dependency (e.g. external captcha API connections). It uses a simple question that any 7 or more years old human can understand, but that a spambot will not be able to answer. This Gem supports Ruby v1.9.2 and Rails 3.0.x.}
  s.email = ["mail@gnomeslab.com"]
  s.files = ["lib/generators/human_detector/human_detector_generator.rb", "lib/generators/human_detector/templates/create_human_detector_questions.rb", "lib/human_detector/cipher.rb", "lib/human_detector/question.rb", "lib/human_detector/rails_ext/action_controller/spam_detected.rb", "lib/human_detector/rails_ext/action_controller.rb", "lib/human_detector/rails_ext/action_view/helper.rb", "lib/human_detector/rails_ext/action_view.rb", "lib/human_detector/renderers/default.rb", "lib/human_detector/renderers.rb", "lib/human_detector.rb", "MIT-LICENSE", "README.md"]
  s.homepage = %q{http://gnomeslab.com/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A logic user friendly captcha for Rails (e.g. How much is 5 + 3?)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<activerecord_random>, ["~> 1.0.0"])
      s.add_development_dependency(%q<fuubar>, ["~> 0.0"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
    else
      s.add_dependency(%q<actionpack>, ["~> 3.0.0"])
      s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_dependency(%q<activerecord_random>, ["~> 1.0.0"])
      s.add_dependency(%q<fuubar>, ["~> 0.0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionpack>, ["~> 3.0.0"])
    s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
    s.add_dependency(%q<activerecord_random>, ["~> 1.0.0"])
    s.add_dependency(%q<fuubar>, ["~> 0.0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
  end
end

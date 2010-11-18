# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activerecord_random}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gnomeslab, Lda."]
  s.date = %q{2010-11-17}
  s.description = %q{ActiveRecord Random is a Ruby Gem that empowers your ActiveRecord Models with the ability to return a random record without using SQL RAND().}
  s.email = ["mail@gnomeslab.com"]
  s.files = ["lib/activerecord_random.rb", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.md", "spec/db/models.rb", "spec/db/schema.rb", "spec/factories/questions_factory.rb", "spec/lib/activerecord_random_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/GnomesLab/activerecord_random/}
  s.require_paths = ["lib", "lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Returns a random instance of an ActiveRecord Model}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_development_dependency(%q<fuubar>, ["~> 0.0"])
      s.add_development_dependency(%q<mysql2>, ["~> 2.0"])
      s.add_development_dependency(%q<ruby-debug19>, ["~> 0.11.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<factory_girl_rails>, ["~> 1.0.0"])
      s.add_development_dependency(%q<database_cleaner>, ["~> 0.6.0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_dependency(%q<fuubar>, ["~> 0.0"])
      s.add_dependency(%q<mysql2>, ["~> 2.0"])
      s.add_dependency(%q<ruby-debug19>, ["~> 0.11.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<factory_girl_rails>, ["~> 1.0.0"])
      s.add_dependency(%q<database_cleaner>, ["~> 0.6.0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
    s.add_dependency(%q<fuubar>, ["~> 0.0"])
    s.add_dependency(%q<mysql2>, ["~> 2.0"])
    s.add_dependency(%q<ruby-debug19>, ["~> 0.11.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<factory_girl_rails>, ["~> 1.0.0"])
    s.add_dependency(%q<database_cleaner>, ["~> 0.6.0"])
  end
end

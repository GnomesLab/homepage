# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{archive_tree}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7") if s.respond_to? :required_rubygems_version=
  s.authors = ["Diogo Almeida", "Miguel Teixeira"]
  s.date = %q{2010-11-17}
  s.description = %q{ArchiveTree is a Ruby Gem that makes it easy for you to create beautiful chronological archive trees of your models. For instance, you can create a tree for your blog posts.}
  s.email = ["mail@gnomeslab.com"]
  s.files = ["lib/archive_tree/action_view_extensions.rb", "lib/archive_tree/core.rb", "lib/archive_tree.rb", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.md", "spec/db/models.rb", "spec/db/schema.rb", "spec/factories/posts_factory.rb", "spec/lib/action_view_extensions/action_view_extensions_spec.rb", "spec/lib/archive_node_spec.rb", "spec/lib/archive_tree_core_spec.rb", "spec/lib/archive_tree_spec.rb", "spec/lib/archived_months_spec.rb", "spec/lib/archived_years_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/GnomesLab/archive_tree/}
  s.require_paths = ["lib", "lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Creates chronological trees of your models based on column of your choice.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.0.0"])
      s.add_development_dependency(%q<fuubar>, ["~> 0.0"])
      s.add_development_dependency(%q<mysql>, ["~> 2.8.0"])
      s.add_development_dependency(%q<ruby-debug19>, ["~> 0.11.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_development_dependency(%q<factory_girl_rails>, ["~> 1.0.0"])
      s.add_development_dependency(%q<database_cleaner>, ["~> 0.6.0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_dependency(%q<actionpack>, ["~> 3.0.0"])
      s.add_dependency(%q<fuubar>, ["~> 0.0"])
      s.add_dependency(%q<mysql>, ["~> 2.8.0"])
      s.add_dependency(%q<ruby-debug19>, ["~> 0.11.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_dependency(%q<factory_girl_rails>, ["~> 1.0.0"])
      s.add_dependency(%q<database_cleaner>, ["~> 0.6.0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
    s.add_dependency(%q<actionpack>, ["~> 3.0.0"])
    s.add_dependency(%q<fuubar>, ["~> 0.0"])
    s.add_dependency(%q<mysql>, ["~> 2.8.0"])
    s.add_dependency(%q<ruby-debug19>, ["~> 0.11.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    s.add_dependency(%q<factory_girl_rails>, ["~> 1.0.0"])
    s.add_dependency(%q<database_cleaner>, ["~> 0.6.0"])
  end
end

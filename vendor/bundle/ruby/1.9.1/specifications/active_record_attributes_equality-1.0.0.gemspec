# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{active_record_attributes_equality}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7") if s.respond_to? :required_rubygems_version=
  s.authors = ["Diogo Almeida"]
  s.date = %q{2010-07-31}
  s.description = %q{Active Record Attributes Equality is a very simple rails plugin / gem that forces ActiveRecord to compare the model's attributes in the presence of two new records. Otherwise, it compares their IDs, just like ActiveRecord::Base#==.}
  s.email = ["diogo.almeida@gnomeslab.com"]
  s.files = ["lib/active_record_attributes_equality.rb", "MIT-LICENSE", "README.md"]
  s.homepage = %q{http://github.com/GnomesLab/active_record_attributes_equality/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Forces ActiveRecord::Base equality to look into the attributes hash.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0.rc"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0.rc"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0.rc"])
  end
end

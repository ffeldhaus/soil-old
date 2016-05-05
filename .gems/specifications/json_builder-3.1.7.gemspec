# -*- encoding: utf-8 -*-
# stub: json_builder 3.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "json_builder"
  s.version = "3.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Garrett Bjerkhoel"]
  s.date = "2012-09-03"
  s.description = "Rails provides an excellent XML Builder by default to build RSS and ATOM feeds, but nothing to help you build complex and custom JSON data structures. The standard to_json works well, but can get very verbose when you need full control of what is generated. JSON Builder hopes to solve that problem."
  s.email = ["me@garrettbjerkhoel.com"]
  s.rubygems_version = "2.5.1"
  s.summary = "Rails provides an excellent XML Builder by default to build RSS and ATOM feeds, but nothing to help you build complex and custom JSON data structures. The standard to_json works well, but can get very verbose when you need full control of what is generated. JSON Builder hopes to solve that problem."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<tzinfo>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.0.0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<tzinfo>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.0.0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<tzinfo>, [">= 0"])
  end
end

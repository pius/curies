# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{curies}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pius Uzamere"]
  s.date = %q{2009-01-08}
  s.description = %q{Curies implements the CURIE syntax for expressing Compact URIs.  See http://www.w3.org/TR/curie/ for more information.}
  s.email = ["pi&#117;&#115;+&#99;&#117;&#114;&#105;&#101;&#64;uyio&#115;&#97;.c&#111;&#109;"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/curies.rb", "lib/curies/curie.rb", "lib/curies/version.rb", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "spec/curies_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake"]
  s.homepage = %q{http://curies.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{curies}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Curies implements the CURIE syntax for expressing Compact URIs.  See http://www.w3.org/TR/curie/ for more information.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end

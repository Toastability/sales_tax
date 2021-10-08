# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'sales_tax/version'

Gem::Specification.new do |s|
  s.name        = 'sales_tax'
  s.version     = SalesTax::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Dirk Gadsden']
  s.email       = ['dirk@esherido.com']
  s.homepage    = 'https://github.com/dirk/sales_tax'
  s.summary     = 'Look up sales tax rates by zip code.'
  s.description = s.summary
  s.license     = 'MIT'

  s.files         = `git ls-files`.split "\n"
  s.test_files    = `git ls-files -- {test}/*`.split "\n"
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 2.2.22'
  s.add_development_dependency 'rake', '~> 13.0.6'
  s.add_development_dependency 'rspec', '~> 3.10.0'
  s.add_development_dependency 'ruby-prof', '~> 1.4.3'
end

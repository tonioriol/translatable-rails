# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'translatable/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'translatable'
  s.version     = Translatable::VERSION
  s.authors     = ['Toni Oriol']
  s.email       = ['tonioriol@gmail.com']
  s.homepage    = 'https://translatable-rails.tonioriol.com'
  s.summary     = 'Makes rails models translatables.'
  s.description = 'Add translatable capabilities to rails models through json based database fields.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.6'

  s.add_development_dependency 'pg'
end

 Gem::Specification.new do |s|
   s.name          = 'jewel'
   s.version       = '0.0.1'
   s.date          = '2016-12-12'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Tara McParland']
   s.email         = 'tara.mcparland.com'
   s.files         = ['lib/jewel.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/jewel'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
 end
# -*- encoding: utf-8 -*-

=begin
#OpenFGA

#A high performance and flexible authorization/permission engine built for developers and inspired by Google Zanzibar.

The version of the OpenAPI document: 1.x
Contact: community@openfga.dev
Generated by: https://openapi-generator.tech
Generator version: 7.8.0

=end

$:.push File.expand_path("../lib", __FILE__)
require "openfga_client/version"

Gem::Specification.new do |s|
  s.name        = "openfga_client"
  s.version     = OpenfgaClient::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["OpenAPI-Generator"]
  s.email       = ["community@openfga.dev"]
  s.homepage    = "https://openapi-generator.tech"
  s.summary     = "OpenFGA Ruby Gem"
  s.description = "A high performance and flexible authorization/permission engine built for developers and inspired by Google Zanzibar."
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 2.6"
  s.metadata    = {}

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end

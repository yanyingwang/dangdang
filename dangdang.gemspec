# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'dangdang'
  spec.version       = '0.1.0'
  spec.authors       = ['yanyingwang']
  spec.email         = ['yanyingwangwang@gmail.com']
  spec.summary       = 'Ruby SDK for open.dangdang.com'
  spec.description   = 'Ruby SDK for open.dangdang.com'
  spec.homepage      = 'https://github.com/yanyingwang/dangdang'
  spec.license       = 'MIT'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'digest'
  spec.add_dependency 'eat'
end

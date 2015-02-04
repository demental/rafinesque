require_relative "lib/rafinesque/version"

Gem::Specification.new do |s|
  s.name        = "rafinesque"
  s.version     = Rafinesque::VERSION
  s.date        = "2015-02-03"
  s.summary     = "Customize your application semantics."
  s.description = <<-DESC.gsub(/^\s+/, '')
    This is an I18n extension that preprocesses replaces custom
    placeholders with static, configuration values
    when strings are memoized, allowing to customize your application semantics.
  DESC
  s.authors     = ["Arnaud Sellenet"]
  s.email       = "arnodmental@gmail.com"
  s.files       = ["lib/rafinesque.rb", "lib/rafinesque/i18n_backend.rb"]
  s.homepage    = "https://github.com/demental/rafinesque"
  s.license     = "MIT"

  s.add_dependency 'i18n'
end

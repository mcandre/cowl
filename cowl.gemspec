require './lib/version'

Gem::Specification.new { |s|
    s.name = 'cowl'
    s.summary = 'column width linter'
    s.description = 'See README.md for example usage'
    s.license = 'FreeBSD'

    s.version = Cowl::VERSION

    s.authors = ['Andrew Pennebaker']
    s.email = 'andrew.pennebaker@gmail.com'

    s.executables = ['cowl']

    s.files = Dir['lib/*.rb'] + Dir['*.md']
    s.homepage = 'https://github.com/mcandre/cowl'

    s.required_ruby_version = '>= 2.7'

    s.add_dependency 'ptools', '~> 1.2'
    s.add_dependency 'dotsmack', '~> 0.3'

    s.add_development_dependency 'rake', '~> 12.3.3'
    s.add_development_dependency 'reek', '~> 1.3'
    s.add_development_dependency 'flay', '~> 2.5'
    s.add_development_dependency 'flog', '~> 4.3'
    s.add_development_dependency 'roodi', '~> 4.0'
    s.add_development_dependency 'churn', '~> 1.0'
    s.add_development_dependency 'cane', '~> 2.6'
    s.add_development_dependency 'excellent', '~> 2.1'
    s.add_development_dependency 'rubocop', '~> 0.49'
    s.add_development_dependency 'tailor', '~> 1.4'
    s.add_development_dependency 'rspec', '~> 3.0'
    s.add_development_dependency 'cucumber', '~> 1.3'
}

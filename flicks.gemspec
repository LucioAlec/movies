Gem::Specification.new do |s|
  s.name        = 'flicks_alec'
  s.version     = '1.0.3'
  s.summary     = 'Plays and reviews movies'

  readme = %w[README.md README].find { |f| File.exist?(File.join(__dir__, f)) }
  s.description = readme ? File.read(File.join(__dir__, readme)) : 'Flicks gem'
  s.licenses    = ['MIT']

  s.authors     = ['LucioAlec']
  s.email       = 'lucioalec@gmail.com'
  # s.homepage  = 'https://seu-site-ou-github' # opcional; pode remover se não tiver

  s.files       = Dir['bin/*', 'lib/**/*'] + %w[LICENSE README README.md].select { |f| File.exist?(File.join(__dir__, f)) }
  s.bindir      = 'bin'
  s.executables = ['flicks']

  s.required_ruby_version = '>= 2.5'
  s.add_development_dependency 'rspec', '~> 3'
end

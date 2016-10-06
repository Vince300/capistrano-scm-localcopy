# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "capistrano-scm-localcopy"
  s.version     = "0.1.0"
  s.licenses    = ["MIT"]
  s.authors     = ["Vincent Tavernier"]
  s.email       = ["vince.tavernier@gmail.com"]
  s.homepage    = "https://github.com/Vince300/capistrano-scm-localcopy"
  s.summary     = %q{Copy strategy for capistrano 3.x}
  s.description = %q{Copy strategy for capistrano 3.x}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency "capistrano", "~> 3.0"
end

require File.dirname(__FILE__) + "/lib/apk/version"

Gem::Specification.new do |s|
  s.name             = "apk"
  s.version          = APK::VERSION
  s.date             = Date.today.to_s
  s.authors          = ["Cedric Fung"]
  s.email            = ["wolfplanet@gmail.com"]
  s.summary          = "A simple Android APK parser"
  s.description      = "Get Android APK's label, features, api, icon, and other information"
  s.homepage         = "http://github.com/abitno/ruby-apk"
  s.extra_rdoc_files = ["README.md"]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "autotest"
end

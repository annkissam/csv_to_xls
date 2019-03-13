lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "csv_to_xls/version"

Gem::Specification.new do |spec|
  spec.name          = "csv_to_xls"
  spec.version       = CsvToXls::VERSION
  spec.authors       = ["Eric Sullivan", "Sean Björnsson"]
  spec.email         = ["eric.sullivan@annkissam.com", "sean.bjornsson@annkissam.com"]

  spec.summary       = %q{Simple CSV to XML CLI}
  spec.description   = %q{A CLI wrapper around the 'spreadsheet' gem to convert a CSV input file into an XLS output file.}
  spec.homepage      = "https://github.com/annkissam/csv_to_xls"
  spec.license       = "GPL-3.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = ["csv_to_xls"]
  spec.require_paths = ["lib"]

  spec.add_dependency "main"
  spec.add_dependency "spreadsheet"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

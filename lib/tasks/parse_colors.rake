require 'parsers/osmo_parser'

namespace :data do
  desc 'Parses colors from osmo website and puts them in yaml file'
  task :parse_osmo_color do
    colors = OsmoParser.parse
    File.open(File.join(Dir.pwd, 'db/default/colors.yml'), 'w+') {|f| f.write colors.to_yaml }
  end
end



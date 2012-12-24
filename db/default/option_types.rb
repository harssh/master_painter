# encoding = utf-8
def download_attachment(uri)
  begin
    io = open(URI.parse(uri))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
  rescue Timeout::Error
    nil
  rescue OpenURI::Error
    nil
  end
end

puts "Loading size option with values"
size_option = Spree::OptionType.where(:name => 'size', :presentation => 'Размер').first_or_create
[ 0.5, 0.75 ,0.9, 2.5, 2.7, 5, 9 ].each do |size_value|
  Spree::OptionValue.where(:name => size_value.to_s, :presentation => "#{size_value} л", :option_type_id => size_option.id).first_or_create
end

puts "Loading color option with values"
colors = YAML::load File.open(File.join(Dir.pwd, "db/data/colors.yml"))
color_option = Spree::OptionType.where(:name => 'color', :presentation => 'Цвет').first_or_create
colors.each do |color|
  option_value = Spree::OptionValue.where(:name => color[:value], :presentation => color[:presentation], :option_type_id => color_option.id).first_or_create
  option_value.image = download_attachment(color[:image]) if option_value.image.to_s.include?('missing')
  if option_value.save
    puts "Loaded #{color[:presentation]} successfully"
  else
    puts "Cannot load #{color[:presentation]}"
  end
end

puts "Loading prototype for masla"
masla_prototype = Spree::Prototype.where(:name => 'Масла').first_or_create
masla_prototype.option_types << size_option
masla_prototype.option_types << color_option



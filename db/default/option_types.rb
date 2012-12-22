# encoding = utf-8
size_option = Spree::OptionType.where(:name => 'size', :presentation => 'Размер').first_or_create
[ 0.5, 0.75 ,0.9, 2.5, 2.7, 5, 9 ].each do |size_value|
  Spree::OptionValue.where(:name => size_value.to_s, :presentation => "#{size_value} л", :option_type_id => size_option.id).first_or_create
end

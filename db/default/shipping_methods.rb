# encoding = utf-8
puts 'Create zone Russia'
zone = Spree::Zone.where(name: 'Россия', description: 'Россия').first_or_create
zone.kind = :country
zone.save!

russia_id = 168
unless zone.zone_members.where(zoneable_id: russia_id).first
  puts 'Attach zone member russian federation'
  zone_member = zone.zone_members.build zoneable_id: russia_id, zoneable_type: 'Spree::Country'
  zone_member.save!
end

puts 'Create shipping method for self collection'
collect_shipping = Spree::ShippingMethod.where(name: 'Забрать из магазина').first_or_create
collect_shipping.zone = zone
collect_shipping.calculator = Spree::Calculator.where(type: 'Spree::Calculator::FlatRate').first
collect_shipping.calculator.preferred_amount = 0
collect_shipping.save!

delivery_shipping = Spree::ShippingMethod.where(name: 'Доставка').first_or_create
delivery_shipping.zone = zone
delivery_shipping.calculator = Spree::Calculator.where(type: 'Spree::Calculator::PriceSack').first
delivery_shipping.calculator.preferred_minimal_amount = 5000
delivery_shipping.calculator.preferred_normal_amount = 700
delivery_shipping.calculator.preferred_discount_amount = 700
delivery_shipping.save!

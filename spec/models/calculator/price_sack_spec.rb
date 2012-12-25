require 'spec_helper'
describe Spree::Calculator::PriceSack do
  let(:calculator) do
    calculator = Spree::Calculator::PriceSack.new
    calculator.preferred_minimal_amount = 5
    calculator.preferred_normal_amount = 10
    calculator.preferred_discount_amount = 1
    calculator
  end

  let(:order) { stub_model(Spree::Order) }
  let(:shipment) { stub_model(Spree::Shipment) }

  it "is not available if sum is less than minimal amount" do
    calculator.available?(2).should == false
  end
  it "is available if sum exact minimal amount" do
    calculator.available?(5).should == true
  end
  it "is available if sum is higher than minimal amount" do
    calculator.available?(7).should == true
  end
end


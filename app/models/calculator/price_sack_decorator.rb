Spree::Calculator::PriceSack.class_eval do
  def available?(object)
    if object.is_a?(Array)
      base = object.map { |o| o.respond_to?(:amount) ? o.amount : BigDecimal(o.to_s) }.sum
    else
      base = object.respond_to?(:amount) ? object.amount : BigDecimal(object.to_s)
    end

    base >= self.preferred_minimal_amount
  end
end
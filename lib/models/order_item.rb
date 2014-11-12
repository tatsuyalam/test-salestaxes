class OrderItem

  # Properties
  attr_accessor :good, :quantity

  def initialize good, quantity
    @good = good
    @quantity = quantity
  end

end
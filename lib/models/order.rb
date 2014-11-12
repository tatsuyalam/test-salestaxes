class Order

  # Properties
  attr_accessor :order_no, :items

  def initialize items
    @order_no = SecureRandom.hex
    @items = items
  end

end
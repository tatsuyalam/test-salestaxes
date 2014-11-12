class Order

  # Properties
  attr_accessor :order_no, :items

  def initialize items
    @order_no = SecureRandom.hex
    @items = items
  end

  # Calculate total value and sale taxes of order
  # Return: {:taxes, :total}
  def values
    total = 0
    taxes = 0
    @items.each do |item|
      total += item.good.price_after_tax * item.quantity
      taxes += item.good.tax * item.quantity
    end

    return { :taxes => taxes, :total => total }
  end

end
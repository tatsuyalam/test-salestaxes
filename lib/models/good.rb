class Good

  # Properties
  attr_accessor :code, :name, :category, :price, :tax

  def initialize code, name, category, price
    @code = code
    @name = name
    @category = category
    @price = price
    @tax = TaxService.apply_for(self)
  end

end
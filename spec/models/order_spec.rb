require './spec_helper'

describe Order do

  before :all do
    # Good for Lie
    @book = Good.new "BOK", "book", "book", 12.49
    @music_cd = Good.new "MCD", "music cd", "good", 14.99
    @chocolate_bar = Good.new "CHO", "chocolate bar", "food", 0.85

    @order_of_lie = Order.new([
        OrderItem.new(@book, 1),
        OrderItem.new(@music_cd, 1),
        OrderItem.new(@chocolate_bar, 1),
      ])

    # Good for Lan
    @imported_chocolate = Good.new "ICH", "imported box of chocolates", "food", 10.0
    @imported_perfume = Good.new "IPE", "imported bottle of perfume", "good", 47.5

    @order_of_lan = Order.new([
        OrderItem.new(@imported_chocolate, 1),
        OrderItem.new(@imported_perfume, 1)
      ])
  end

  describe "Order of Lie" do
    it "have 3 items" do
      expect(@order_of_lie).to have_exactly(3).items
    end

    it "sales taxes is 1.5" do
      expect(@order_of_lie.values[:taxes]).to eq(1.5)
    end

    it "total value is 29.83" do
      expect(@order_of_lie.values[:total]).to eq(29.83)
    end
  end

  describe "Order of Lan" do
    it "have 2 items" do
      expect(@order_of_lan).to have_exactly(2).items
    end

    it "sales taxes is 7.63" do
      expect(@order_of_lan.values[:taxes]).to eq(7.63)
    end

    it "total value is 65.13" do
      expect(@order_of_lan.values[:total]).to eq(65.13)
    end
  end

end
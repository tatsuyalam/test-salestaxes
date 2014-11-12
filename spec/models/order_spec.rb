require './spec_helper'

describe Order do

  before :all do
    @book = Good.new "BOK", "book", "book", 12.49
    @music_cd = Good.new "MCD", "music cd", "good", 14.99
    @chocolate_bar = Good.new "CHO", "chocolate bar", "food", 0.85

    @order_of_lie = Order.new([
        OrderItem.new(@book, 1),
        OrderItem.new(@music_cd, 1),
        OrderItem.new(@chocolate_bar, 1),
      ])
  end

  describe "Order of Lie" do
    it "Lie order 3 items" do
      expect(@order_of_lie).to have_exactly(3).items
    end
  end

end
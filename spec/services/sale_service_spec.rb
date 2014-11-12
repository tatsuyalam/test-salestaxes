require './spec_helper'

describe SaleService do

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

    # Get generated receipt of Lie's order
    @receipt = SaleService.generate_receipt(@order_of_lie)
    @receipt_csv = CSV.parse(@receipt)
  end

  describe "Generate Receipt (CSV)" do
    it "have at least 5 lines" do
      expect(@receipt_csv.length).to be >= 5
    end

    it "first row is header" do
      expect(@receipt_csv[0][1]).to eq("Product")
    end

    it "Book has the same price (not apply tax)" do
      expect(@receipt_csv[1][2]).to eq("12.49")
    end

    it "Sales Taxes: 1.50" do
      expect(@receipt_csv[5][0]).to eq("Sales Taxes: 1.50")
    end

    it "Total: 29.83" do
      expect(@receipt_csv[6][0]).to eq("Total: 29.83")
    end
  end

end
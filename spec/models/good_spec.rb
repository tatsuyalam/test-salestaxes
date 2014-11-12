require './spec_helper'

describe Good do

  before :all do
    @book = Good.new "BOK", "book", "book", 12.49
    @music_cd = Good.new "MCD", "music cd", "good", 14.99
  end

  describe "initialize" do
    it "@book must be an instance of Good" do
      expect(@book).to be_an_instance_of(Good)
    end

    it "@book name is book" do
      expect(@book.name).to eq("book")
    end
  end

  describe "sales taxes" do
    it "@book not apply basic tax" do
      expect(@book.tax).to eq(0)
    end

    it "@music_cd has a basic tax" do
      expect(@music_cd.tax).to eq(1.5)
    end
  end

end
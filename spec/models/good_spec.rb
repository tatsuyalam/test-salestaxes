require './spec_helper'

describe Good do

  before :each do
    @book = Good.new "BOK", "book", 12.49
  end

  describe "initialize" do
    it "book must be an instance of Good" do
      expect(@book).to be_an_instance_of(Good)
    end
  end

end
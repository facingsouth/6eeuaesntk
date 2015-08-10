require 'rails_helper'

describe Shoe do
  
  let(:shoe) { build(:shoe) }

  context "Validations" do

    it "is invalid without a email" do
      shoe.brand = nil
      expect(shoe).not_to be_valid
    end

    it "is invalid without a password" do
      shoe.model = nil
      expect(shoe).not_to be_valid
    end

    it "is invalid without a password" do
      shoe.year = nil
      expect(shoe).not_to be_valid
    end

    it "is invalid without a password" do
      shoe.purchase_date = nil
      expect(shoe).not_to be_valid
    end

  end

end
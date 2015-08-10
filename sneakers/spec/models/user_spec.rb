require 'rails_helper'

describe User do
  
  let(:user) { build(:user) }

  context "Validations" do

    it "should have length no less than 6" do
        user.username = "a" * 5
        expect(user).not_to be_valid
      end

      it "should have length no more than 20" do
        user.username = "a" * 21
        expect(user).not_to be_valid
      end

      it "should have length more than or equal to 6" do
        user.username = "a" * 6
        expect(user).to be_valid
      end

      it "should have length less than or equal to 20" do
        user.username = "a" * 20
        expect(user).to be_valid
      end

  end
end

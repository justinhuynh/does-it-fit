require 'rails_helper'

describe User do
  describe "validations" do
    it { should have_many(:reviews) }
    it { should validate_uniqueness_of(:email) }
  end

  let(:admin_user) { FactoryGirl.create(:admin) }
  let(:member_user) { FactoryGirl.create(:user) }

  describe "admin check" do
    it "checks whether the user is an admin" do
      expect(admin_user.admin?).to eq(true)
      expect(member_user.admin?).to eq(false)
    end
  end
end

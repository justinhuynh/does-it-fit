require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe ".new" do
    it "only requires a name to be valid" do
      name = "Gap"
      brand = Brand.new(name: name)
      expect(brand.valid?).to be true
    end
  end
end

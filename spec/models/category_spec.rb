require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "#Category" do
    it "does the category model have the name attribute?" do
      category = Category.create!(name: 'Johnson')
      expect(category[:name]).to eq('Johnson')
    end
  end
end

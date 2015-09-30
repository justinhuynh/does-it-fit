require 'rails_helper'

describe Product do
  describe "validations" do
    it { should have_many(:reviews) }
    it { should belong_to(:brand) }
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:brand) }
    it { should validate_numericality_of(:brand_id).only_integer }
    it { should validate_presence_of(:category) }
    it { should validate_numericality_of(:category_id).only_integer }
    it { should validate_presence_of(:user) }
    it { should validate_numericality_of(:user_id).only_integer }
    it { should validate_presence_of(:average_fit) }
  end

  describe "calculate average fit" do
    let!(:product) { FactoryGirl.create(:product) }

    it "should update average rating with review creation" do
      FactoryGirl.create(:review, product_fit: 3, product: product)
      FactoryGirl.create(:review, product_fit: 4, product: product)
      FactoryGirl.create(:review, product_fit: 6, product: product)
      product.reload
      FactoryGirl.create(:review, product_fit: 7, product: product)

      expect(product.average_fit).to eq(5)

      product.reload
      FactoryGirl.create(:review, product_fit: 10, product: product)
      product.reload

      expect(product.average_fit).to eq(6)
    end
  end
end

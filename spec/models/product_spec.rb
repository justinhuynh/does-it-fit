require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should belong_to(:brand) }
  it { should belong_to(:category) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:brand_id) }
  it { should validate_numericality_of(:brand_id).only_integer }
  it { should validate_presence_of(:category_id) }
  it { should validate_numericality_of(:category_id).only_integer }
  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id).only_integer }
  it { should validate_presence_of(:average_fit) }
end

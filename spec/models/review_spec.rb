require 'rails_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:product) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:product_fit) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:product_id) }
end

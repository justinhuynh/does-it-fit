require 'rails_helper'

describe User do
  it { should have_many(:reviews) }
  it { should validate_uniqueness_of(:email) }
end

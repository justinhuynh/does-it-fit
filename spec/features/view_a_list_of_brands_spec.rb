require 'rails_helper'

feature 'user views brands', %{
  As a user
  I want to view a list of brands
  So that I can see if any are applicable to me

  Acceptance Criteria:
  - [√] When I navigate to the brands index, I see
  all the brands from the database displayed on the page

} do
  scenario 'user navigates to brands page' do
    brand_1 = FactoryGirl.create(:brand)
    brand_2 = FactoryGirl.create(:brand)
    visit brands_path
    expect(page).to have_content(brand_1.name)
    expect(page).to have_content(brand_2.name)
  end
end

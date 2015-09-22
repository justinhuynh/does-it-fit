require 'rails_helper'

feature 'user views brands', %{
  As a user
  I want to view a list of brands
  So that I can see if any are applicable to me

  Acceptance Criteria:
  - [√] When I navigate to the brands index, I see
  all the brands from the database displayed on the page

} do
  scenario 'specify valid credentials' do
    brand = Brand.create(name: 'Levi\'s')
    brand2 = Brand.create(name: 'Carhart')
    visit '/brands'
    expect(page).to have_content(brand.name)
  end
end

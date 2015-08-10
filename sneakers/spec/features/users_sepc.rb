require 'rails_helper'

feature 'User accounts' do
  before do
    visit root_path
  end
  let!(:user) { create(:user) }
  let!(:shoe) { create(:shoe) }

  scenario "Sign in to an existing account and go to user_path" do
    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_button "Sign In"

    expect(page).to have_content("#{user.username}'s shoe closet")
  end

  scenario "User creates a new pair of shoes and go to user_path" do
    visit user_path(user)
    shoe.user_id = user.id
    shoe.save!

    fill_in "brand", with: shoe.brand
    fill_in "model", with: shoe.model
    fill_in "year", with: shoe.year
    fill_in "purchase_date", with: shoe.purchase_date

    click_button "Create Shoe"

    expect(page).to have_content("#{user.username}'s shoe closet")
    expect(page).to have_content("#{shoe.brand}")
    expect(page).to have_content("#{user.model}")
    expect(page).to have_content("#{user.year}")
  end

end
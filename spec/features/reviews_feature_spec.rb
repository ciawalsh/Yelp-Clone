require 'rails_helper'

feature 'reviewing' do
  
  before {Restaurant.create name: 'KFC'}

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'doesn\'t allow a user to edit a review that it didn\'t create' do
    visit '/restaurants'
    expect(page).to have_content('KFC')
    expect(page).not_to have_link('Edit KFC')
  end

end
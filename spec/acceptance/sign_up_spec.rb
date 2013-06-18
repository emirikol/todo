require 'acceptance/acceptance_helper'

feature 'Sign up', %q{
  In order to write todos
  As a User
  I want identify myself
} do

  scenario 'new user' do
    visit new_user_path
    fill_in 'user[email]', with: 'a@b.com'
    click_button 'Sign In'
    page.should have_content('My Todos')
  end

  scenario 'exsiting user' do
    user = FactoryGirl.create(:user)
    visit new_user_path
    fill_in 'user[email]', with: user.email
    click_button 'Sign In'
    page.should have_content('My Todos')
    User.count.should == 1
  end

  scenario 'invalid user' do
    visit new_user_path
    click_button 'Sign In'
    page.should have_css('form#new_user')
    User.count.should == 0
  end

  scenario 'already signed in' do
    sign_in
    visit new_user_path
    page.should have_content('My Todos')
  end



end

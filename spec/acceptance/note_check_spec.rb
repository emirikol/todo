require 'acceptance/acceptance_helper'

feature 'Note check', %q{
  In order to know what I already did
  As a user
  I want to check-off todos
} do

  scenario 'Check off', :js do
    user = FactoryGirl.create(:user)
    sign_in(user.email)
    note = FactoryGirl.create(:note, user: user)
    visit '/'
    expect {
      page.find('.note input').click
      page.should have_css('.done') #wait for ajax to complete
      note.reload
    }.to change(note, :done).from(nil).to(true)

  end

end

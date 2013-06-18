module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.

  def sign_in(email = 'a@b.com')
    visit new_user_path
    fill_in 'user[email]', with: email
    click_button 'Sign In'
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
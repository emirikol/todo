require 'acceptance/acceptance_helper'

feature 'Note create', %q{
  In order to track my todos
  As a User
  I want to create a new todo
} do

  before do
    sign_in
  end

  scenario 'create todo' do
    fill_in 'note[title]', with: 'shop'
    fill_in 'note[description]', with: 'until I drop'
    fill_in 'note[due]', with: '03/03/2013'
    click_button 'Save'
    Note.count.should == 1
    todo = Note.first
    todo.title.should == 'shop'
    todo.description.should == 'until I drop'
    todo[:due].should == Date.parse('03/03/2013')
  end

  scenario 'title required' do
    page.should have_css '[name="note[title]"][required]'
  end

  scenario 'ajax update of page', :js do
    fill_in 'note[title]', with: 'shop'
    fill_in 'note[description]', with: 'until I drop'
    fill_in 'note[due]', with: '03/03/2013'
    click_button 'Save'
    page.should have_content('shop')
    page.should have_content('until I drop')
    page.should have_content('03/03/13')
  end

end

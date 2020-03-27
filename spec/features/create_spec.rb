require 'rails_helper'
RSpec.feature "post", :type => :feature do
  scenario "Create a new post" do
    visit "/posts/new"
    fill_in "Title", :with => "ruby"
    fill_in "Body", :with => "ruby on rails"
    click_button "Create Post"
    expect(page).to have_text("ruby")
    expect(page).to have_text("ruby on rails")
  end
end
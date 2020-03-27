require 'rails_helper'
RSpec.feature "post", :type => :feature do
  scenario "Create a new post" do
   expect(FactoryBot.build(:post)).to be_valid
    visit "/posts/new"
    fill_in "Title", :with => "ruby"
    fill_in "Body", :with => "ruby on rails"
    click_button "Create Post"
   expect(build(:post)).to be_valid
  end
end
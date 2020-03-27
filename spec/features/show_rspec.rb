require 'rails_helper'
RSpec.feature "post", :type => :feature do
    let!(:post) { create :post, title: 'show the post' }
    scenario "show post" do
    visit posts_path
    click_on 'Show'
    expect(page).to have_content('show the post')
  end
end

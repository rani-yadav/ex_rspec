require 'rails_helper'
require 'spec_helper'

RSpec.feature "post", :type => :feature do
 describe "should render posts" do
    let!(:post) { create :post, title: 'if you want to show the post' }
    scenario "show the post" do
    visit "posts/show"
    click_on 'Show'
    expect(page).to have_content('show the post')
  end
end
end
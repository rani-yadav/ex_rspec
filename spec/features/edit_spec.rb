require 'rails_helper'
require 'spec_helper'

RSpec.feature "post", :type => :feature do
	  before(:each) do
	  let(:post) { create :post, title: 'hello'}
	  end
		it 'redirects_to edit post path' do
	    visit edit_post_path(post)
	    expect(page).not_to have_content('Edit post')
	    expect(page).to have_content('Title')
	  end
  	context 'with invalid attributes' do
	    it 'shows errors' do
		    visit edit_post_path(post)
		    fill_in 'Title', with: ''
		    click_on 'Update Post'
		    expect(page).to have_content("Title can not be blank")
		    fill_in 'body', with: ''
		    click_on 'Update Post'
		    expect(page).to have_content ('body can not be blank')
    	end
  	end
  	context 'with valid attributes' do
    it'updates the post' do
      visit edit_post_path(post)
      fill_in 'Title', with: 'good morning'
      click_on 'Update Post'
      expect(page).to have_content('goodmorning')
      expect(page).not_to have_content('hello')
    end
  end
end
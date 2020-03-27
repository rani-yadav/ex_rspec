require 'rails_helper'
require 'spec_helper'

RSpec.feature "post", :type => :feature do
	  let!(:post) { create :post, title: 'hello'}
	  describe 'Update post' do
		scenario 'with valid input' do
	    visit edit_post_path(post)
	    fill_in 'Title', with: 'good morning'
	    click_on 'Update Post'
	    expect(page).to have_content('good morning')
	    expect(page).not_to have_content('hello')
    end
  	scenario 'with invalid input' do
		  visit edit_post_path(post)
			fill_in 'Title', with: ''
			click_on 'Update Post'
			expect(page).to have_content('Title can not be blank')
    end
  end
  end
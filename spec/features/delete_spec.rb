require 'rails_helper'
require 'spec_helper'

RSpec.feature "post", :type => :feature do
	describe 'Destroy post' do
		let!(:post) { create :post, title: 'post to be Destroyed' }
		it 'confirmation are you sure?' do
			visit posts_path
			click_on 'Destroy'
			expect(page).not_to have_content('post to be Destroyed')
    end
  end 
end


require 'rails_helper'
require 'spec_helper'

RSpec.feature "post", :type => :feature do
	describe 'index posts' do
		let!(:post1) { create :post, title: 'first' }
		let!(:post2) {create :post, title: 'second'}
		let!(:post3) {create :post, title: 'Third'}
		scenario 'shows all posts' do
			visit posts_path
			expect(page).to have_content('first')
			expect(page).to have_content('second')
			expect(page).to have_content('Third')
		end
	end
end
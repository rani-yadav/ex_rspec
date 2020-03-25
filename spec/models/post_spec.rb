require 'rails_helper'
require 'spec_helper'

RSpec.describe Post, type: :model do

	it "has a valid factory" do
   expect(FactoryBot.build(:post)).to be_valid
  end

	describe 'create new post' do
	  it 'with invalid attributes' do
	    it 'shows errors' do
	      visit new_post_path
	      fill_in 'title', with: Faker::Lorem.paragraph
	      click_on 'Create Post'
	      expect(page).to have_content("Title can not blank")
	      fill_in 'body', with: ''
	      click_on 'Create Post'
	      expect(page).to have_content ('body can no be blank')
	    end
	  end
	end

  describe 'with valid attributes' do
    it 'create the new post' do
      visit new_post_path
      fill_in 'Title', with: 'hello'
      fill_in 'Body', with: 'ruby on rails.'
      click_on 'Create Post'
      expect(page).to have_content('hello')
      expect(page).to have_content('ruby on rails')
    end
  end

  describe 'index posts' do
		let!(:post1) {create :post, title: 'first' }
		let!(:post2) {create :post, title: 'second'}
		let!(:post3) {create :post, title: 'third'}
		it "show list of all posts" do
		visit posts_path
		expect(page).to have_content('first')
		expect(page).to have_content('second')
		expect(page).to have_content('third')
		end
	end

  describe "should render posts #show template" do
    let!(:post) { create :post, title: 'if you want to show the post' }
    visit posts_path
    click_on 'Show'
    expect(page).to have_content('show the post')
  end

  describe 'Post' do
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

	describe 'Destroy post' do
	visit posts_path
	click_on 'Destroy'
	expect(page).not_to have_content('post Destroyed')
	end
end
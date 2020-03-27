require 'rails_helper'
RSpec.feature "post", :type => :feature do
    describe 'Destroy post' do
        let!(:post) { create :post, title: 'post to be Destroyed' }
        scenario 'confirmation are you sure?' do
        visit posts_path
        click_on 'Destroy'
        expect(page).not_to have_content('post to be Destroyed')
        end
        scenario 'if pressed yes' do
        visit posts_path
        click_on 'Destroy'
        expect(page).to have_content('are you sure')
        click_on 'Ok'
        expect(page).to have_content('post was successfully destroyed')
        end

        scenario 'if pressed No' do
        visit posts_path
        click_on 'Destroy'
        expect(page).to have_content('are you sure')
        click_on 'cancle'
        expect(page).to have_content('post to be Destroyed')
        end
    end
end 

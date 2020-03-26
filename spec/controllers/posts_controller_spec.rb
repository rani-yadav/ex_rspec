require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
      it "create new contact" do
        post :create, post: attributes_for(:post)
        expect(Post.count).to eq(1)
      end
    end
  end
 describe "GET #index" do
    it 'show list of all posts' do
     get :index
     expect(response).to render_template("index")
    end
  end 
  describe "GET #new" do
    it 'when we want to create a new post' do 
     get :new
     expect(response).to render_template("new")
    end
  end
end 


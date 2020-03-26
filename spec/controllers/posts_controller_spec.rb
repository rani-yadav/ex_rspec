require 'rails_helper'
require 'spec_helper'


RSpec.describe PostsController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
      it "create new contact" do
        post :create, contact: attributes_for(:contact)
        expect(Contact.count).to eq(1)
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

   describe "POST #create post" do
    it "create a new post when valid attribute" do
  
     expect(response).to redirect_to(posts_path)
    end
    it "create a new post when invalid attribute" do
     
     expect(response).to raise_error("invalid attributes")
    end 
  end 

  describe "DELETE #destroy post" do 
    it "deletes the post" do
      expect{ 
        delete :destroy, id: :@post, post: {title: "@post.title", body: "@post.body"}
     }.to change(Post, :count).by(-1)
    end 
    it "successfull destroyed the post"do
    expect(response).to redirect_to(posts_path)
  	end	
	end
end
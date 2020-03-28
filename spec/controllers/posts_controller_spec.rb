require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
      it "create new post" do
        expect(FactoryBot.build(:post)).to be_valid
        expect(build(:post)).to be_valid
      end
    end
  end
end



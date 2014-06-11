require 'spec_helper'

describe UsersController do 
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "successful user sign up" do

      let(:alice) { Fabricate.attributes_for(:user) }

      it "redirects to the sign-in page" do
        post :create, user: alice
        expect(response).to redirect_to root_path
      end
    end
  end
end
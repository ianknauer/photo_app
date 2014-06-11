require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to the home page for authenticated users" do
      set_current_user
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do

    let(:current_user) { Fabricate(:user) }

    context "with valid credentials" do
      it "puts the signed in user in the session" do
        post :create, email: current_user.email, password: current_user.password
        expect(session[:user_id]).to eq(current_user.id)
      end
      it "redirects to the home path" do
        post :create, email: current_user.email, password: current_user.password
        expect(response).to redirect_to home_path
      end
      it "sets the notice" do
        post :create, email: current_user.email, password: current_user.password
        expect(flash[:notice]).not_to be_blank
      end
    end

    context "with invalid credentials" do
      it "doesn't put the signed in user into the session" do
        post :create, email: current_user.email, password: current_user.email + "abcde"
        expect(session[:user_id]).to be_nil
      end
      it "redirects to the sign in page" do
        post :create, email: current_user.email, password: current_user.email + "abcde"
        expect(response).to redirect_to sign_in_path
      end
      it "sets the error message" do
        post :create, email: current_user.email, password: current_user.email + "abcde"
        expect(flash[:error]).not_to be_blank
      end
    end
  end

  describe "GET destroy" do
    before do
      set_current_user
    end

    it "clears the session for the user" do
      get :destroy
      expect(session[:user_id]).to be_nil
    end
    it "redirects to the root path" do
      get :destroy
      expect(response).to redirect_to root_path
    end
    it "sets the goodbye notice" do
      get :destroy
      expect(flash[:notice]).not_to be_blank
    end
  end
end
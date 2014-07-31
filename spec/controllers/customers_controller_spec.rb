require 'spec_helper'

describe CustomersController do
  describe "GET new" do
    it "sets @customer" do
      get :new
      expect(assigns(:customer)).to be_instance_of(Customer)
    end
  end

  describe "POST create" do
    context "successful customer creation" do
      
      let(:bob) { Fabricate.attributes_for(:customer) }
      let(:anne) { Fabricate :user }

      before { set_current_user(anne) }

      it "redirects to the sign-in page" do
        post :create, customer: bob
        expect(response).to redirect_to root_path
      end

      it "it assigns customer to current user" do 
        post :create, customer: bob
        expect(Customer.first.user).to eq(anne)
      end
    end
  end
end
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

      it "redirects to the sign-in page" do
        post :create, customer: bob
        expect(response).to redirect_to root_path
      end

    end
  end
end
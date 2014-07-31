require 'spec_helper'

describe PicturesController do 
  describe "GET new" do 
    it "sets @picture" do 
      get :new
      expect(assigns(:picture)).to be_instance_of(Picture)
    end
  end
end

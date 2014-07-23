require 'spec_helper'

describe AlbumsController do
  describe "GET new" do
    it "sets @album" do
      get :new
      expect(assigns(:album)).to be_instance_of(Album)
    end
  end
end
require 'spec_helper'

describe ProductsController do
  let(:user) { Factory(:user) }
  let(:product) { mock_model(Product, :id => 1) }

  context "standard users" do
    before do
      sign_in(:user, user)
    end

    { :new => :get,
      :create => :post,
      :edit => :get,
      :update => :put,
      :destroy => :delete }.each do |action, method|
        it "cannot access the #{action} action" do
          sign_in(:user, user)
          send(method, action, :id => product.id)
          response.should redirect_to('/')
          flash[:alert].should == "You must be an admin to do that."
        end
      end

    it "displays an error for a missing product" do
      get :show, :id => "not-here"
      response.should redirect_to products_path
      message = "A product with name or id 'not-here' could not be found."
      flash[:alert].should == message
    end
  end
end

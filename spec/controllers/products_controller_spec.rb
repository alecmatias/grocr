require 'spec_helper'
describe ProductsController do
  it "displays an error for a missing product" do
    get :show, :id => "not-here"
    response.should redirect_to products_path
    message = "The product you were looking for could not be found."
    flash[:alert].should == message
  end
end

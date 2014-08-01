class CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  def show
  end

  def index 
  end

  def new
    @customer = Customer.new
    @customer.albums.build
  end

  def create
    @customer = Customer.new(customer_params.merge!(user_id: User.first.id))
    if @customer.save
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :phone, :name, albums_attributes:[:name])
  end

  def set_customer
     @customer = Customer.find_by(slug: params[:id])
  end  

end
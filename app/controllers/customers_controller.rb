class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params.merge!(user_id: current_user.id))
    if @customer.save
      flash[:notice] = "welcome to the party!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :phone, :name)
  end

end
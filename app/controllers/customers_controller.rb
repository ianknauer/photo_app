class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @customer = Customer.update(@customer, customer_params)
    redirect_to customer_path(@customer)
  end

  def index 
    @customers = Customer.order(updated_at: :desc).limit(5)
  end

  def new
    @customer = Customer.new
  end

  def search
    @customers = Customer.search_by_email(params[:search_term])
  end

  def create
    @customer = Customer.new(customer_params.merge!(user_id: User.first.id))
    if @customer.save
      redirect_to customer_path(@customer)
    else
      flash[:error] = "Please Add the info that is highlighted in red"
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :phone, :name, albums_attributes:[:name])
  end

  def set_customer
     @customer = Customer.find_by slug: params[:id]
  end  

end
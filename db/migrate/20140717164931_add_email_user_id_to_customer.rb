class AddEmailUserIdToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :email, :string
    add_column :customers, :user_id, :integer
  end
end

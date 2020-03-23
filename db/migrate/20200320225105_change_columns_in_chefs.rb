class ChangeColumnsInChefs < ActiveRecord::Migration[6.0]
  def change
  	rename_column :chefs, :chefname, :name
  	rename_column :chefs, :chefemail, :email
  end
end

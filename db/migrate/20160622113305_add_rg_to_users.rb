class AddRgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rg, :string
  end
end

class AddNumeroToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number, :string
  end
end

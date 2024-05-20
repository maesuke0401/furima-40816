class AddNextFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :next_first_name, :string
  end
end

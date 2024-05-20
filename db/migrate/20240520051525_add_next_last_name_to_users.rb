class AddNextLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :next_last_name, :string
  end
end

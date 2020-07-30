class AddNativeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :native, :string
  end
end

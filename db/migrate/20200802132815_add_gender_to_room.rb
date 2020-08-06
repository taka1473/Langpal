class AddGenderToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :gender, :string
  end
end

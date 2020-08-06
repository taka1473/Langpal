class AddHostIdToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :host_id, :integer
  end
end

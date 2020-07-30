class AddStudyToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :study, :string
  end
end

class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    # 変更内容
  def up
    change_column :users, :name, :string, null: false
    change_column :users, :image, :string
  end

  # 変更前の状態
  def down
    change_column :users, :name
    change_column :users, :image, :string, default: 'default.png'
  end
  end
end

class AddIsDeleteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_delete, :bool, default: false
  end
end

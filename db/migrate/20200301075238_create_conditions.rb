class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.integer "progress", default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end

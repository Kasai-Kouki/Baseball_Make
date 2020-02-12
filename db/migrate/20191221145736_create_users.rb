class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :teamname
      t.integer :area_id
      t.integer :category_id
      t.string :password_digest

      t.timestamps
    end
  end
end

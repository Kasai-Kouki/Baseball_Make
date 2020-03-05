class CreateRecruitments < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitments do |t|
      t.integer :game_id
      t.integer :enemy_id
      t.timestamps
    end
  end
end

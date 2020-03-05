class AddEnemyIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :enemy_id, :integer
  end
end

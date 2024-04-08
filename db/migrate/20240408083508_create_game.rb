class CreateGame < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :player_1
      t.string :player_2
      t.integer :status
      t.string :winner
      t.string :current_player
      t.string :options, array: true, default: ['', '', '', '', '', '', '', '', '']
      
      t.timestamps
    end
  end
end

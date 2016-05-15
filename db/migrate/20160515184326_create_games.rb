class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, default: "MVP Game"
      t.boolean :x, default: false
      t.boolean :o, default: false
      t.string :current_player, default: "x"
      t.string :board, array: true, default: [["empty", "empty", "empty"],
                                              ["empty", "empty", "empty"],
                                              ["empty", "empty", "empty"]]

      t.timestamps null: false
    end
  end
end

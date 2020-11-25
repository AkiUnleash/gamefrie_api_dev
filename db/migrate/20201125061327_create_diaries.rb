class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.references :account, foreign_key: true
      t.string :body, null: false
      t.string :played_game
      t.string :posted_image

      t.timestamps
    end
  end
end

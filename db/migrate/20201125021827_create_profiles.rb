class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :account, foreign_key: true
      t.string :nickname
      t.string :self_introduction
      t.references :gender, foreign_key: true
      t.string :game_playing
      t.string :time_period_playing
      t.string :profile_image
      t.string :cover_image

      t.timestamps
    end
  end
end

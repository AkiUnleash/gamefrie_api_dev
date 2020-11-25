class CreateGenders < ActiveRecord::Migration[6.0]
  def change
    create_table :genders do |t|
      t.string :gender_name, null: false
      t.string :display_order, null: false

      t.timestamps
    end
  end
end

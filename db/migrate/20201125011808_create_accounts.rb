class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :email, null: false                          # メールアドレス
      t.string :hashed_password                             # パスワード
      t.datetime :tmp_authenication_date, null: false       # 仮認証日時
      t.datetime :official_authenication_date               # 本認証日時

      t.timestamps
    end

    add_index :accounts, "LOWER(email)", unique: true       # メールアドレスにインデックス付与
  end
end

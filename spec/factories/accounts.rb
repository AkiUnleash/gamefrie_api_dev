FactoryBot.define do
    factory :account do
          email { 'hogehoge@email.com' }
          hashed_password { 'password123' }
          tmp_authenication_date { '2020/11/25 22:12:42' }
    end
  end
  
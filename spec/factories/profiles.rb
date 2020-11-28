FactoryBot.define do
    factory :profile do
            account_id { 4 } 
            nickname { "akakak" } 
            self_introduction { "Nice to meet you!!" } 
            gender_id { 1 } 
            time_period_playing { "Tetris99" }
    end
  end
FactoryBot.define do
    factory :diary do
          account_id { 4 }
          body { 'Yeah!!!' }
          played_game { 'Tetris' }
    end
  end
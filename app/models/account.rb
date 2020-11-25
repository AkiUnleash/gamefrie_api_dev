class Account < ApplicationRecord
    has_one :profile
    has_many :diaries
end

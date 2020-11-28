class Profile < ApplicationRecord
    belongs_to :account
    belongs_to :gender

    # Validation
    validates :account_id, presence: true, :numericality => { :only_interger => true }
    validates :nickname, presence: true 
    validates :gender_id, presence: true, :numericality => { :less_than_or_equal_to => 3 }
end

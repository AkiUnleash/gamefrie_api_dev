class Diary < ApplicationRecord
    belongs_to :account

    # Validation
    validates :account_id, presence: true, :numericality => { :only_interger => true }
    validates :body, presence: true

end

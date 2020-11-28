class Account < ApplicationRecord
    has_one :profile
    has_many :diaries

    # Validation
    validates :email, presence: true, "valid_email_2/email": true, uniqueness: true
    validates :hashed_password, presence: true
    validates :tmp_authenication_date, presence: true

end

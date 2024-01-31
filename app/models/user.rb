class User < ApplicationRecord
    has_secure_password

    # Add additional password validation rules if needed
    validates :password, presence: true, length: { minimum: 8 }, if: -> { password.present? }
end

class User < ApplicationRecord
    has_many :conditions
    has_many :conditioned_medications, through: :conditions, source: :medication
    has_many :medications
    has_many :categories, through: :medications

    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

    def self.from_google_omniauth(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |user|
            user.username = auth[:info][:name]
            user.password = SecureRandom.hex
        end
    end
end

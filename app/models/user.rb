class User < ApplicationRecord
    has_many :conditions
    has_many :conditioned_medications, through: :conditions, source: :medication
    has_many :medications
    has_many :categories, through: :medications

    has_secure_password

    validates :username, uniqueness: true, presence: true
    validates :email, presence: true
end

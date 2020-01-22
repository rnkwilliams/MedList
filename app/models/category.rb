class Category < ApplicationRecord
    has_many :medications
    has_many :users, through: :medications

    validates :name, presence: true, uniqueness: true

    def self.alpha
        order(:medication)
    end
end

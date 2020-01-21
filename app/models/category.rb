class Category < ApplicationRecord
    has_many :medications
    has_many :users, through: :medications

    def self.alpha
        order(:medication)
    end
end

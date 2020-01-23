class Category < ApplicationRecord
    has_many :medications
    has_many :users, through: :medications

    validates :name, presence: true, uniqueness: true

    scope :alpha -> {order(:name)}
end

class User < ApplicationRecord
    has_many :conditions
    has_many :conditioned_medications, through: :conditions, source: :medication
    has_many :medications
    has_many :categories, through: :medications
end

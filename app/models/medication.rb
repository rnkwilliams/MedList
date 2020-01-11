class Medication < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :conditions
  has_many :users, through: :conditions
end

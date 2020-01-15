class Medication < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :conditions
  has_many :users, through: :conditions

  accepts_nested_attributes_for :category
end

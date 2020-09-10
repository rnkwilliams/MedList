class Condition < ApplicationRecord
  belongs_to :user
  belongs_to :medication
  has_many :symptoms

  validates :name, presence: true
  validates :notes, presence: true
end

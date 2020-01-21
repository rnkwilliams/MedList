class Condition < ApplicationRecord
  belongs_to :user
  belongs_to :medication

  validates :name, presence: true
  
end

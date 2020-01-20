class Medication < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :conditions
  has_many :users, through: :conditions

  validates :name, presence: true
  validates :dosage, presence: true
  validates :units, presence: true
  validates :frequency, presence: true
  validates :times_per_day, presence: true
  validates :start_date, presence: true
  validate :not_a_duplicate

  accepts_nested_attributes_for :category

  def not_a_duplicate
    if Medication.find_by(name: name, category_id: category_id)
      errors.add(:name, "has already been added for that category")
    end
  end
  
end

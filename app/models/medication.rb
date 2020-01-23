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

  def category_attributes=(attributes)
    self.category = Category.find_or_create_by(attributes) if !attributes['name'].empty?
    self.category
  end

  def not_a_duplicate
    if Medication.find_by(name: name, category_id: category_id)
      errors.add(:name, "has already been added for that category")
    end
  end

  def name_and_category
    "#{name} - #{category.name}"
  end

  def self.alpha
    order(:medication)
  end

end

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

  scope :alpha, -> {order(:name)}

  # def self.filter(params)
  #   where("category_id = ?", params)
  # end
  
  def self.search(params)
    joins(:category).where("LOWER(medications.name) LIKE :term OR LOWER(categories.name) LIKE :term", term: "%#{params}%")
  end
 
  def category_attributes=(attributes)
    self.category = Category.find_or_create_by(attributes) if !attributes['name'].empty?
    self.category
  end

  def not_a_duplicate
    medication = Medication.find_by(name: name, category_id: category_id)
    if !!medication && medication != self
      errors.add(:name, "has already been added for that category")
    end
  end

  def name_and_category
    "#{name} - #{category.name}"
  end

end

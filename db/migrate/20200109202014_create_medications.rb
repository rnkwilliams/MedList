class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.integer :dosage
      t.string :units
      t.string :frequency
      t.integer :times_per_day
      t.date :start_date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

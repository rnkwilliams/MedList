class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :notes
      t.belongs_to :user, foreign_key: true
      t.belongs_to :medication, foreign_key: true

      t.timestamps
    end
  end
end

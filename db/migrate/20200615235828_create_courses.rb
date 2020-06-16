class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.belongs_to :expert, null: false, foreign_key: true
      t.belongs_to :newbie, null: false, foreign_key: true

      t.timestamps
    end
  end
end

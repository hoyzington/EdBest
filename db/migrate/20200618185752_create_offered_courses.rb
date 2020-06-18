class CreateOfferedCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :offered_courses do |t|
      t.string :name
      t.string :description
      t.integer :expert_id

      t.timestamps
    end
  end
end

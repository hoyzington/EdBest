class CreateExperts < ActiveRecord::Migration[6.0]
  def change
    create_table :experts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :bio

      t.timestamps
    end
  end
end

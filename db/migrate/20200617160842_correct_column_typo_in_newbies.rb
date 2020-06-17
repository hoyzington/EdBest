class CorrectColumnTypoInNewbies < ActiveRecord::Migration[6.0]
  def change
    add_column :newbies, :password_digest, :string
    remove_column :newbies, :passwrd_digest, :string
  end
end

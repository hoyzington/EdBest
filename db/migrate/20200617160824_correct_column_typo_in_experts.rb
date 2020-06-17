class CorrectColumnTypoInExperts < ActiveRecord::Migration[6.0]
  def change
    add_column :experts, :password_digest, :string
    remove_column :experts, :passwrd_digest, :string
  end
end

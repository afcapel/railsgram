class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    enable_extension("citext")

    create_table :profiles do |t|
      t.citext :username, null: false
      t.string :name
      t.citext :email, null: false
      t.string :password_digest
      t.timestamps(null: false)
    end

    add_belongs_to :posts, :profile, index: true, foreign_key: true, null: false
  end
end

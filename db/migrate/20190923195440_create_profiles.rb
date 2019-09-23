class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :nick_name
      t.text :bio
      t.binary :picture

      t.timestamps
    end
  end
end

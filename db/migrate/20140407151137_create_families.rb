class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :familyname
      t.string :address
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :alt_phone
      t.string :email
      t.string :alt_email

      t.timestamps
    end
  end
end

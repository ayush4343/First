class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :personal_email
      t.integer :aadhar_no
      t.integer :contact_no
      t.integer :pincode
      t.string :city
      t.string :state
      t.string :country
      t.string :address

      t.timestamps
    end
  end
end

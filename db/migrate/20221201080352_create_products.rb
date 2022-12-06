class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
     
      t.string :mfg_date
      t.string :exp_date
      t.string :soap_type

      t.timestamps
    end
  end
end

class AddStatusToSellers < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :status, :integer , default: 0
  end
end

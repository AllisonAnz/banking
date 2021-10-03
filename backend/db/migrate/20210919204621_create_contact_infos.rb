class CreateContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_infos do |t|
      t.string :street_address 
      t.string :state 
      t.string :zip 
      t.string :email 
      t.string :phone
    end
  end
end

class AddClientIdToContactInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :contact_infos, :client_id, :integer
  end
end

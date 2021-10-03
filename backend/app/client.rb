class Client < ActiveRecord::Base 
    has_one :contact_info
    has_many :saving_accounts
    has_many :checking_accounts
    has_many :transactions, through: :checking_accounts

   def render_format
            {
              id: self.id,
              first_name: self.firstName,
              last_name: self.lastName
            }
    end
end
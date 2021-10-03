class Transaction < ActiveRecord::Base 
    belongs_to :checking_account
end
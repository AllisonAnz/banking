require 'faker'
Client.destroy_all
ContactInfo.destroy_all
require 'pry'
20.times do 
    Client.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
    )
end

30.times do 
    ContactInfo.create(
        street_address: Faker::Address.street_address, 
        state: Faker::Address.state, 
        zip: Faker::Address.zip, 
        email: Faker::Internet.email, 
        phone: Faker::PhoneNumber.cell_phone,
        client_id: Client.all.sample.id
    )
end

20.times do 
    SavingAccount.create(
        account_number: Faker::Bank.account_number,
        balance: Faker::Number.between(from: 0.0, to: 100000.0).round(2),
        client_id: Client.all.sample.id
    )
end

20.times do 
    CheckingAccount.create(
        account_number: Faker::Bank.account_number,
        balance: Faker::Number.between(from: 0.0, to: 100000.0).round(2),
        client_id: Client.all.sample.id
    )
end

100.times do
    Transaction.create(
        date: Faker::Date.in_date_period(month: 2),
        description: Faker::Commerce.vendor,
        amount: Faker::Number.between(from: 0.0, to: 1000.0).round(2),
        checking_account_id: CheckingAccount.all.sample.id
    )
end



    


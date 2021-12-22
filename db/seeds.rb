

puts "Creating companies..."
Company.create(name: "Google", founding_year: 1998)
Company.create(name: "Facebook", founding_year: 2004)
Company.create(name: "Enron", founding_year: 1995)
Company.create(name: "Dunder Mifflin", founding_year: 2002)


puts "Creating devs..."
Dev.create(name: "Rick")
Dev.create(name: "Morty")
Dev.create(name: "Mr. Meseeks")
Dev.create(name: "Gazorpazop")

puts "Creating freebies..."

# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************
# Create freebies Here
adam = Dev.create(name: 'Adam')
emiley = Dev.create(name: 'Emiley')

Freebie.create(
        dev: emiley,
        company_id: Company.first,
        item_name: 'road bike',
        value: 1000
    )
Freebie.create(
    dev: adam,
    company_id: Company.first,
    item_name: 'road bike',
    value: 1000
)

10.times do
    Freebie.create(
        dev_id: Dev.all.sample.id,
        company_id: Company.all.sample.id,
        item_name: Faker::Vehicle.make,
        value: (rand * 100000).to_i
    )
end

puts "Seeding done!"

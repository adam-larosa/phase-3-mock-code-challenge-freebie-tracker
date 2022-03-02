puts "Creating companies..."
Company.create(name: "Google", founding_year: 1998)
Company.create(name: "Facebook", founding_year: 2004)
Company.create(name: "Dunder Mifflin", founding_year: 2002)
Company.create(name: "Enron", founding_year: 1995)

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

items = [
    {name: "Rolex", price: 10000},
    {name: "Sticker", price: 2},
    {name: "Lambo", price: 175000},
    {name: "Battery Bank", price: 100}
]

7.times {
    the_gift = items.sample
    Freebie.create(
        item_name: the_gift[:name], 
        value: the_gift[:price], 
        dev_id: Dev.pluck(:id).sample,
        company_id: Company.all.sample.id
    )
}


puts "Seeding done!"

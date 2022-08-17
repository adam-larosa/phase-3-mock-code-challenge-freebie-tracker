class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    
    # takes a dev (an instance of the Dev class), an item_name 
    # (string), and a value as arguments, and creates a new 
    # Freebie instance associated with this company and the given 
    # dev
    def give_freebie(dev_given, item_name_given, value_given)
        Freebie.create(
            dev_id: dev_given.id,
            item_name: item_name_given,
            value: value_given,
            company_id: self.id
        )
    end


    # returns the Company instance with the earliest founding year
    def self.oldest_company
        self.order( :founding_year ).first
    end


end

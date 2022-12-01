class Company < ActiveRecord::Base
    has_many :freebies 
    has_many :devs, through: :freebies 

    def give_freebie( dev_instance, new_item_name, value_given ) 
        # takes a dev (an instance of the Dev class), an item_name (string), 
        # and a value (integer) as arguments, and creates a new Freebie instance 
        # associated with this company and the given dev
        Freebie.create( 
            item_name: new_item_name, 
            value: value_given, 
            dev_id: dev_instance.id,
            company_id: self.id
        )
    end

    def self.oldest_company
        # returns the Company instance with the earliest founding year

        # self.all.min_by {|c| c.founding_year }
        self.order( :founding_year ).first
    end
end

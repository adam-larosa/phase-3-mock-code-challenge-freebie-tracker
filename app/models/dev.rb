class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies


    # accepts an item_name (string) and returns true if any of the 
    # freebies associated with the dev has that item_name, 
    # otherwise returns false
    def received_one?(item_name_given)
        self.freebies.where(item_name: item_name_given).exists?
    end

    # accepts a Dev instance and a Freebie instance, changes the 
    # freebie's dev to be the given dev; your code should only 
    # make the change if the freebie belongs to the dev who's 
    # giving it away
    def give_away(dev_given, freebie)
        if self.id == freebie.dev.id  
            return freebie.update( dev: dev_given)
        else
            return "DO NOT GIVE WHAT IS NOT YOURS"
        end
    end

end

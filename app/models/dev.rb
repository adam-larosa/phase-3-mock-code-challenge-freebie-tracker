class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        # accepts an item_name (string) and returns true if any of the 
        # freebies associated with the dev has that item_name, otherwise 
        # returns false

        # self.freebies.each do |freebie|
        #     if item_name == freebie.item_name
        #         return true
        #     end
        # end
        # return false
        
        # !!self.freebies.find_by( item_name: item_name )

        self.freebies.find_by(item_name: item_name) ? true : false
    end

    def give_away(dev_to_get_freebie, freebie)
        # accepts a Dev instance and a Freebie instance, changes the freebie's 
        # dev to be the given dev; your code should only make the change if 
        # the freebie belongs to the dev who's giving it away
        if self.id == freebie.dev.id
            freebie.update( dev_id: dev_to_get_freebie.id )
        else
            puts 'DO NOT GIVE WHAT IS NOT YOURS!'
        end
    end

end

class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        #!!self.freebies.find_by(item_name: item_name)
        self.freebies.any? {|f| f.item_name == item_name}
    end

    def give_away(dev_param, freebie)
        if self == freebie.dev
            freebie.dev = dev_param
            freebie.save
        else
            "#{freebie.item_name} IS NOT YOURS TO GIVE!!!"
        end
    end
    
end

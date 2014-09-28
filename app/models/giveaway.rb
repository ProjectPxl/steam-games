class Giveaway < ActiveRecord::Base
  belongs_to :steamuser

  def self.participants_empty?(instance)
    instance.participants == nil    
  end
end

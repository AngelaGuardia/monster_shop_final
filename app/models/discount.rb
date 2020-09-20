class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name,
                        :percentage,
                        :minimum_quantity
                        
  validates_numericality_of :percentage,
                            :minimum_quantity
end

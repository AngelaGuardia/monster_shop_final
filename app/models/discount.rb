class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name,
                        :percentage,
                        :minimum_quantity

  validates_numericality_of :percentage, greater_than: 0, less_than: 1
  validates_numericality_of :minimum_quantity, greater_than: 0
end

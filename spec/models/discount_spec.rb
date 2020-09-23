require 'rails_helper'

describe Discount do
  describe 'Relationships' do
    it { should belong_to :merchant }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :percentage }
    it { should validate_numericality_of(:percentage).is_greater_than(0) }
    it { should validate_numericality_of(:percentage).is_less_than(1) }
    it { should validate_presence_of :minimum_quantity }
    it { should validate_numericality_of(:minimum_quantity).is_greater_than(0) }
  end
end

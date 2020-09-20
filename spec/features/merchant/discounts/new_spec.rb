require 'rails_helper'

describe 'As a merchant' do
  before(:each) do
    @merchant_store = create(:merchant)
    @merchant_employee = create(:merchant_user, merchant_id: @merchant_store.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_employee)
  end

  it 'I can make a new discount' do
    visit merchant_discounts_path

    click_on 'New Discount'

    expect(current_path).to eq(new_merchant_discount_path)

    fill_in :discount_name, with: "My new disocunt"
    fill_in :discount_percentage, with: 0.15
    fill_in :discount_minimum_quantity, with: 15

    click_on 'Create Discount'

    expect(current_path).to eq(merchant_discounts_path)

    discount = Discount.last

    within("#discount-#{discount.id}") do
      expect(page).to have_content(discount.name)
      expect(page).to have_content((discount.percentage*10).round(2))
      expect(page).to have_content(discount.minimum_quantity)
    end
  end
end

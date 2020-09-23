require 'rails_helper'

describe 'As a merchant' do
  before(:each) do
    @merchant_store = create(:merchant)
    @merchant_employee = create(:merchant_user, merchant_id: @merchant_store.id)
    @discount = create(:discount, merchant_id: @merchant_store.id)

    visit login_path

    fill_in :email, with: @merchant_employee.email
    fill_in :password, with: @merchant_employee.password

    click_button "Log In"
  end

  it 'I can delete a discount' do
    visit merchant_discounts_path

    within("#discount-#{@discount.id}") do
      click_on 'Delete Discount'
    end

    expect(current_path).to eq(merchant_discounts_path)
    expect(page).not_to have_css("#discount-#{@discount.id}")
  end
end

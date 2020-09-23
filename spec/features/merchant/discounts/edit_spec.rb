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

  it 'I can edit a discount' do
    visit merchant_discounts_path

    within("#discount-#{@discount.id}") do
      click_on 'Edit Discount'
    end

    expect(current_path).to eq("/merchant/discounts/#{@discount.id}/edit")
    expect(find_field(:discount_name).value).to eq(@discount.name)
    # QUESTION: How do I change the display format when form_for prefills a field?
    expect(find_field(:discount_percentage).value).to eq(@discount.percentage.to_s)
    expect(find_field(:discount_minimum_quantity).value).to eq(@discount.minimum_quantity.to_s)

    new_name = "My new discount name"
    new_percentage = 0.6475
    new_min_qty = 33

    fill_in :discount_name, with: new_name
    fill_in :discount_percentage, with: new_percentage
    fill_in :discount_minimum_quantity, with: new_min_qty

    click_on 'Update Discount'

    expect(current_path).to eq(merchant_discounts_path)
    expect(page).to have_content('Your discount has been updated.')
    # QUESTION: This is test is not passing yet evrywhere I look it has been updated (localhost, db, pry, params--> ANS need to log in instead of stub)
    within("#discount-#{@discount.id}") do
      expect(page).to have_content(new_name)
      expect(page).to have_content((new_percentage*100).round(2))
      expect(page).to have_content(new_min_qty)
    end
  end

  it 'I cannot edit a discount with missing information' do
    visit merchant_discounts_path

    within("#discount-#{@discount.id}") do
      click_on 'Edit Discount'
    end

    expect(current_path).to eq("/merchant/discounts/#{@discount.id}/edit")
    expect(find_field(:discount_name).value).to eq(@discount.name)
    # QUESTION: How do I change the display format when form_for prefills a field?
    expect(find_field(:discount_percentage).value).to eq(@discount.percentage.to_s)
    expect(find_field(:discount_minimum_quantity).value).to eq(@discount.minimum_quantity.to_s)

    new_name = ""
    new_percentage = 1
    new_min_qty = 0

    fill_in :discount_name, with: new_name
    fill_in :discount_percentage, with: new_percentage
    fill_in :discount_minimum_quantity, with: new_min_qty

    click_on 'Update Discount'

    expect(current_path).to eq("/merchant/discounts/#{@discount.id}/edit")
    expect(page).to have_content("Name can't be blank, Percentage must be less than 1, and Minimum quantity must be greater than 0")

    within("#edit_discount_#{@discount.id}") do
      expect(find_field(:discount_name).value).to eq(@discount.name)
      # QUESTION: How do I change the display format when form_for prefills a field?
      expect(find_field(:discount_percentage).value).to eq(@discount.percentage.to_s)
      expect(find_field(:discount_minimum_quantity).value).to eq(@discount.minimum_quantity.to_s)
    end
  end
end

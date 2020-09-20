require 'rails_helper'

describe 'As a merchant' do
  describe 'on my dashboard' do
    before(:each) do
      @merchant_store = create(:merchant)
      @merchant_employee = create(:merchant_user, merchant_id: @merchant_store.id)

      @discount1 = create(:discount, merchant_id: @merchant_store.id)
      @discount2 = create(:discount, merchant_id: @merchant_store.id)
      @discount3 = create(:discount, merchant_id: @merchant_store.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_employee)
    end

    it 'I see a link to my discounts' do
      visit merchant_dashboard_path

      click_on "My Discounts"

      expect(current_path).to eq(merchant_discounts_path)
    end

    it 'I click the discount link and I see all my discounts' do
      visit merchant_dashboard_path

      click_on "My Discounts"

      @merchant_store.discounts.each do |discount|
        within("#discount-#{discount.id}") do
          expect(page).to have_content(discount.name)
          expect(page).to have_content((discount.percentage*10).round(2))
          expect(page).to have_content(discount.minimum_quantity)
        end
      end
    end
  end
end

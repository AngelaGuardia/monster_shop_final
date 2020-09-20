require 'rails_helper'

describe 'As a merchant' do
  describe 'on my dashboard' do
    it 'I see a link to my discounts' do
      merchant_store = create(:merchant)
      merchant_employee = create(:merchant_user, merchant_id: merchant_store.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merchant_employee)

      visit merchant_dashboard_path

      click_on "My Discounts"

      expect(current_path).to eq(merchant_discounts_path)
    end
  end
end

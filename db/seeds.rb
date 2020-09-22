require 'factory_bot_rails'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderItem.destroy_all
Item.destroy_all
Order.destroy_all
User.destroy_all
Merchant.destroy_all


5.times do
  shop = FactoryBot.create(:merchant)
  user = FactoryBot.create(:user)
  admin = FactoryBot.create(:user)
  merchant_user = FactoryBot.create(:user, merchant_id: shop.id)
  FactoryBot.create(:merchant_user, merchant_id: shop.id)
  3.times do
    item = FactoryBot.create(:item, merchant_id: shop.id)
    order = FactoryBot.create(:order, user: user)
    FactoryBot.create(:order_item, order_id: order.id, item_id: item.id, price: item.price)
  end
end

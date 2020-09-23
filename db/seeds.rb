include FactoryBot::Syntax::Methods
# require 'faker'
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
Discount.destroy_all
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
  2.times do
    discount = FactoryBot.create(:discount, merchant_id: shop.id )
  end
end

# @shop1 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
# @user1 = User.create!(name: 'User', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'user1@example.com', password: 'password')
# @merchant_user1 = User.create!(name: 'Merchant', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'merchant1@example.com', password: 'password', role: 1, merchant: @shop1)
# @admin_user1 = User.create!(name: 'Admin', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'admin1@example.com', password: 'password', role: 2)
# @item1_shop1 = @shop1.items.create!(name: 'Ogre1', description: "I'm an Ogre!", price: 20.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
# @item1_shop2 = @shop1.items.create!(name: 'Ogre2', description: "I'm an Ogre!", price: 120.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 15 )
# @item1_shop3 = @shop1.items.create!(name: 'Ogre3', description: "I'm an Ogre!", price: 220.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 25 )
#
# @shop2 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
# @user2 = User.create!(name: 'User', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'user2@example.com', password: 'password')
# @merchant_user2 = User.create!(name: 'Merchant', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'merchant2@example.com', password: 'password', role: 1, merchant: @shop2)
# @admin_user1 = User.create!(name: 'Admin', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'admin2@example.com', password: 'password', role: 2)
# @item1_shop1 = @shop2.items.create!(name: 'Giant1', description: "I'm an Ogre!", price: 120.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 15 )
# @item1_shop2 = @shop2.items.create!(name: 'Giant2', description: "I'm an Giant!", price: 420.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 25 )
# @item1_shop3 = @shop2.items.create!(name: 'Giant3', description: "I'm an Giant!", price: 620.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 55 )

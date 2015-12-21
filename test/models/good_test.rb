require 'test_helper'

class GoodTest < ActiveSupport::TestCase
	def setup()
		@shop = Shop.create(shopname: "HiHi Shop", address: "98 Tang Nhon Phu, F.TNP B, Q.9, Tp.HCM", phone: "0933 454 919", email: "0712210@gmail.com")
		@good = @shop.goods.build(name: "Vay ngan", price: 100, summary: "Day la vay ngan danh cho nguoi cao 1.5m den 1.6m", description:"Mua 10 cai tang 1 cai")
	end

	test "Good should be valid" do 
		assert @good.valid?
	end

	test "Name should be present" do 
		@good.name = " "
		assert_not @good.valid?
	end	

	test "Name should not be long" do 
		@good.name = "a" * 101
		assert_not @good.valid?
	end	

	test "Name should not be short" do 
		@good.name = "aaa"
		assert_not @good.valid?
	end	

	test "Price should not greater than zero" do 
		@good.price = -1
		assert_not @good.valid?
	end	

	test "Price should not less than 1M" do 
		@good.price = 1000001
		assert_not @good.valid?
	end	

	test "Shop ID should be present" do 
		@good.shop_id = nil
		assert_not @good.valid?
	end	
end

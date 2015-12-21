require 'test_helper'

class ShopTest < ActiveSupport::TestCase
	def setup()
		@shop = Shop.new(shopname: "HiHi Shop", address: "98 Tang Nhon Phu, F.TNP B, Q.9, Tp.HCM", phone: "0933 454 919", email: "0712209@gmail.com")
	end

	test "Shop should be valid" do 
		assert @shop.valid?
	end

	test "Shopname should be present" do 
		@shop.shopname = " "
		assert_not @shop.valid?
	end	

	test "Shopname should not be long" do 
		@shop.shopname = "a" * 41
		assert_not @shop.valid?
	end	

	test "Shopname should not be short" do 
		@shop.shopname = "aaa"
		assert_not @shop.valid?
	end	

	test "ShopEmail should be present" do 
		@shop.email = " "
		assert_not @shop.valid?
	end	

	test "ShopEmail should not be in bounds" do 
		@shop.email = "a" * 101 + "@gmail.com"
		assert_not @shop.valid?
	end	

	test "ShopEmail should not be unique" do 
		dup_shop = @shop.dup
		dup_shop.email = @shop.email.upcase
		@shop.save
		assert_not dup_shop.valid?
	end	

	test "email validation should be accepted" do
		emails = %w[user@eee.com R_T_SSS@eee.hello.com user@exmaple.com first.last@name.com abc+def@mokk.com]
		emails.each do |var|
			@shop.email = var
			assert @shop.valid?, '#{var.inspect} should be valid'
		end
	end

	test "email validation should be Rejected" do
		emails = %w[user@eee,com R_T_SSS_at_eee.hello.com user@exmaple. first.last@na_me.com abcdef@mo+kk.com]
		emails.each do |var|
			@shop.email = var
			assert_not @shop.valid?, '#{var.inspect} should be valid'
		end
	end
end
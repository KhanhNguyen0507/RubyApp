module ApplicationHelper
	def gravatar_for(shop, options = {size: 80})
		gravatar_id = Digest::MD5::hexdigest(shop.email.downcase)
		size = options[:size]
		gravatar_url = "https://s.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: shop.shopname, class:"gravatar")
	end
end

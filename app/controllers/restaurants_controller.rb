class RestaurantsController < ApplicationController

	def yes
		featured_restaurants = Zomato::API.new
		featured_restaurants.request_data(280, 'city', '1')

		featured_restaurants.response_data["restaurants"].map do |restaurant|
		    rest = restaurant["restaurant"]
		    Restaurant.create!( name: rest["name"],
		                    restaurant_url: rest["url"],
		                    address: rest["location"]["address"],
		                    locality: rest["location"]["locality"],
		                    city: rest["location"]["city"],
		                    zipcode: rest["location"]["zipcode"],
		                    average_cost_for_two: rest["average_cost_for_two"],
		                    featured_img: rest["featured_image"],
		                    menu_url: rest["menu_url"],
		                    has_online_delivery: rest["has_online_delivery"],
		                    cuisines: rest["cuisines"],
		                    restaurant_id: rest["id"]
		                    )
		    # binding.pry
		end
		render json: featured_restaurants
	end
end

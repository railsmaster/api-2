require 'test_helper'

class ListingPostsTest < ActionDispatch::IntegrationTest

	setup { host! 'api.example.com' }

	test 'returns list of all posts' do 
		get '/posts'
		assert response.success?
		refute_empty response.body
	end

end
require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path(10) }

    it 'should return correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'should include correct text' do
      expect(response.body).to include('Show All users')
    end
  end

#   describe 'GET #show' do
#     before(:example) { get users_post_path(10, 1) }

#     it 'should return correct response status' do
#       expect(response).to have_http_status(200)
#     end

#     it 'should render correct template' do
#       expect(response).to render_template(:show)
#     end

#     it 'should include correct  text' do
#       expect(response.body).to include('Show the details of one post per user')
#     end
#   end
end
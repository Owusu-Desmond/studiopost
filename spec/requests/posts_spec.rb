require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET user/posts' do
    before :each do
      @user = User.create!(full_name: 'Test Doe', username: 'testdeo', email: 'testdeo@gmail.com',
                           password: '123456', password_confirmation: '123456')
      @post = Post.create!(title: 'Test Post', text: 'This is a test post', user_id: @user.id)
    end
    it 'returns a successful response' do
      get user_posts_path(@user)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(@user)
      expect(response).to render_template('index')
    end

    it 'If the response body includes correct placeholder text' do
      get user_posts_path(@user)
      expect(response.body).to include('Studiopost is an amazing community of artists, designers, and developers')
    end
  end
end

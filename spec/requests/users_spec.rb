require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    let(:user) do
      User.create!(full_name: 'Desmond Doe', username: 'desmonddeo1', email: 'desmond5@gmail.com', password: '123456',
                   password_confirmation: '123456')
    end

    it 'returns a successful response' do
      get user_path(user.username)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get user_path(user.username)
      expect(response).to render_template('show')
    end

    it 'assigns the user to @user' do
      get user_path(user.username)
      expect(assigns(:user)).to eq(user)
    end
  end
end

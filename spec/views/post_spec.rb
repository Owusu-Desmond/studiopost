require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:user) do
    User.create!(full_name: 'Test Doe', username: 'testdeo9', email: 'testdeo9@gmail.com', password: '123456',
                 password_confirmation: '123456')
  end
  let(:post) { Post.create!(title: 'Test Post', text: 'This is a test post', user_id: user.id) }

  describe 'GET user/posts' do
    it 'returns a successful response' do
      visit new_user_session_path
      fill_in 'Email', with: 'testdeo9@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      visit user_posts_path(user)
      expect(page).to have_content('Studiopost is an amazing community of artists, designers, and developers')
      expect(page).to have_content('Test Post')
      expect(page).to have_content('This is a test post')
    end
  end

  describe 'GET user/post' do
    it 'returns a successful response' do
      visit new_user_session_path
      fill_in 'Email', with: 'testdeo9@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit user_post_path(user, post)
      expect(page).to have_content('Test Post')
      expect(page).to have_content('This is a test post')
    end
  end
end

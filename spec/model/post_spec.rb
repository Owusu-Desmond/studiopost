require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(full_name: 'Test Doe', username: 'testdeo', email: 'testdeo@gmail.com', password: '123456')
  end
  let(:post) { Post.new(title: 'Test Post', text: 'This is a test post', user_id: user.id) }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'is valid with a zero comments_counter' do
    post.comments_counter = 0
    expect(post).to be_valid
  end

  it 'is valid with a positive comments_counter' do
    post.comments_counter = 1
    expect(post).to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'is valid with a zero likes_counter' do
    post.likes_counter = 0
    expect(post).to be_valid
  end

  it 'is valid with a positive likes_counter' do
    post.likes_counter = 1
    expect(post).to be_valid
  end
end

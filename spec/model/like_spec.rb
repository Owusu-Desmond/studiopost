require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.create(full_name: 'Like Doe', username: 'likedeo', email: 'likedeo@gmail.com', password: '123456')
  end
  let(:post) { Post.create(title: 'Test Post', text: 'This is a test post', user_id: user.id) }
  let(:like) { Like.new(user_id: user.id, post_id: post.id) }

  it 'is valid with valid attributes' do
    expect(like).to be_valid
  end

  it 'is not valid without a user_id' do
    like.user_id = nil
    expect(like).to_not be_valid
  end

  it 'is not valid without a post_id' do
    like.post_id = nil
    expect(like).to_not be_valid
  end
end

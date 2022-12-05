require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(full_name: 'comment Doe', username: 'commentdeo', email: 'commentdeo@gmail.com', password: '123456')
  end
  let(:post) { Post.create(title: 'Test Post', text: 'This is a test post', user_id: user.id) }
  let(:comment) { Comment.new(user_id: user.id, post_id: post.id) }

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without a user_id' do
    comment.user_id = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a post_id' do
    comment.post_id = nil
    expect(comment).to_not be_valid
  end
end

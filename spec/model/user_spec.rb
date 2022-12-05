require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(full_name: 'John Doe', username: 'johndoe', email: 'johndoe@gmail.com', password: '123456') }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a full_name' do
    user.full_name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'is valid with a zero posts_counter' do
    user.posts_counter = 0
    expect(user).to be_valid
  end

  it 'is valid with a positive posts_counter' do
    user.posts_counter = 1
    expect(user).to be_valid
  end
end

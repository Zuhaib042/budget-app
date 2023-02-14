require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    user = User.create(name: 'Tom')
    Group.new(user: user,
             name: 'Shopping',
             icon: 'https://cdn.dribbble.com/users/9685/screenshots/997495/avatarzzz.gif')
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid when name is a string' do
    expect(subject).to be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to be_invalid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to be_invalid
  end

end
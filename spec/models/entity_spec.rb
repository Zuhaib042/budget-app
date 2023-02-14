require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    user = User.create(name: 'Tom')
    Entity.new(user: user,
             name: 'Macdonalds',
             amount: 14)
  end

  it 'is not valid without a title' do
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

  it 'is valid when amount is an integer' do
    subject.amount = 10
    expect(subject).to be_valid
  end

end
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom') }

  before { subject.save }

  it 'is not valid without a title' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when name is not a string' do
    subject.name = 23
    expect(subject).to be_invalid
  end

end
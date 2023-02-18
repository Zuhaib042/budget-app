require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) do
    User.create(
      name: 'Zuhaib',
      email: 'zuhaib@example.com',
      password: '123456'
    )
  end

  before do
    # stub the authenticate_user! method
    allow_any_instance_of(GroupsController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(GroupsController).to receive(:current_user).and_return(user)
  end

  describe 'GET /index' do
    before(:example) { get groups_path } 

    it 'should return succesfull response' do
      expect(response).to have_http_status(:ok)
    end

    it 'shoud return render the template' do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Categories')
    end
   
  end

  context 'GET /new' do
    before(:example) { get new_group_path } 

    it 'should return succesfull response' do
      expect(response).to have_http_status(200)
    end

    it 'should render a new template' do
        expect(response).to render_template('new')
    end

    it 'has response body that include the correct placeholder text' do
        expect(response.body).to include('Create your Category here.')
    end
  end
  
end
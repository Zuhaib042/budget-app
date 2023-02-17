require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  
  before(:example) do
   @user = User.create(
      name: 'Zuhaib',
      email: 'zuhaib@example.com',
      password: '123456'
    )
   @group = Group.create(name: 'Shopping', author_id: @user.id)
  end

  before do
    # stub the authenticate_user! method
    allow_any_instance_of(EntitiesController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(EntitiesController).to receive(:current_user).and_return(@user)
  end

  describe 'GET /index' do
    before(:example) { get group_entities_path(@group) } 

    it 'should return succesfull response' do
      expect(response).to have_http_status(:ok)
    end

    it 'shoud return render the template' do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder text' do
      expect(response.body).to include('Transactions')
    end
   
  end

  describe 'GET /new' do
    before(:example) { get new_group_entity_path(@group) } 

    it 'should return succesfull response' do
      expect(response).to have_http_status(200)
    end

    it 'should render a new template' do
        expect(response).to render_template('new')
    end

    it 'has response body that include the correct placeholder text' do
        expect(response.body).to include('Create your Transaction here.')
    end
  end
  
end
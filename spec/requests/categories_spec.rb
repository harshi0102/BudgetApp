require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'harshika', email: 'vmmaple2@gmail.com', password: 'password') }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns a 200 OK status' do
      get categories_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders categories/index template' do
      get categories_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns a 200 OK status' do
      get new_category_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders categories/new template' do
      get new_category_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /create' do
    let(:valid_params) { { category: { name: 'Health', icon: '💊' } } }
    let(:invalid_params) { { category: { name: nil, icon: '🏤' } } }

    context 'with valid parameters' do
      it 'creates a new Category' do
        expect do
          post categories_path, params: valid_params
        end.to change(Category, :count).by(1)
      end

      it 'redirects to categories/index page' do
        post categories_path, params: valid_params
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Category' do
        expect do
          post categories_path, params: invalid_params
        end.to change(Category, :count).by(0)
      end
    end
  end
end

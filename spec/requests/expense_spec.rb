require 'rails_helper'

RSpec.describe 'Expense', type: :request do
  before(:example) do
    @user = User.first
    sign_in @user
    @group = Group.create(name: 'Outdoor', user_id: @user.id)
  end

  describe 'GET group_expenses_path' do
    context 'when user is signed in' do
      it 'returns http success' do
        get group_expenses_path(@group)
        expect(response).to have_http_status(:success)
      end

      it 'renders the correct template' do
        get group_expenses_path(@group)
        expect(response).to render_template('index')
      end
    end

    context 'when user is signed out' do
      before do
        sign_out @user
      end

      it 'should redirect to splash page' do
        get group_expenses_path(@group)
        expect(response).to redirect_to(budget_path)
        expect(response.status).to eq(302)
      end
    end
  end

  describe 'GET new_group_expense_path when user is signed in' do
    it 'returns http success' do
      get new_group_expense_path(@group)
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get new_group_expense_path(@group)
      expect(response).to render_template('new')
    end
  end
end

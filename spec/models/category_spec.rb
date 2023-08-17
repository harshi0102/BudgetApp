require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create!(name: 'harshika', email: 'vmmaple2@gmail.com', password: 'password') }
  let(:category) { Category.create!(user: user, name: 'School', icon: '📚') }
  let(:expense) { Expense.create!(author: user, name: 'T-shirt', amount: 5, category: category) }

  describe 'validations' do
    it 'is valid with all valid attributes' do
      expect(category).to be_valid
    end

    it 'is not valid if name is not present' do
      category.name = nil
      expect(category).not_to be_valid
    end

    it 'is not valid if icon is not present' do
      category.icon = nil
      expect(category).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to the correct user' do
      expect(category.user).to eql(user)
    end

    it 'includes the correct expense' do
      expect(category.expenses).to include(expense)
    end
  end
end

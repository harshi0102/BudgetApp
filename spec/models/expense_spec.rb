require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create!(name: 'harshika', email: 'vmmaple2@gmail.com', password: 'password') }
  let(:category) { Category.create!(user: user, name: 'Food', icon: '🍔') }
  let(:expense) { Expense.create!(author: user, name: 'Lunch', amount: 6, category: category) }

  describe 'validations' do
    it 'is not valid if name is not present' do
      expense.name = nil
      expect(expense).not_to be_valid
    end

    it 'is not valid if amount is not present' do
      expense.amount = nil
      expect(expense).not_to be_valid
    end

    it 'is not valid if amount is negative' do
      expense.amount = -100
      expect(expense).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a category' do
      expect(expense.category).to eq(category)
    end

    it 'belongs to an author (user)' do
      expect(expense.author).to eq(user)
    end
  end
end
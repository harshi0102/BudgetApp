require 'rails_helper'

RSpec.feature 'Categories Index', type: :feature do
  include Devise::Test::IntegrationHelpers

  let!(:user) { User.create!(name: 'harshika', email: 'vmmaple2@gmail.com', password: 'password') }
  let!(:category1) { Category.create!(user:, name: 'Food', icon: '🍔') }
  let!(:category2) { Category.create!(user:, name: 'Health', icon: '💊') }
  let!(:expense1) { Expense.create!(author: user, category: category1, name: 'Burger', amount: 10.0) }
  let!(:expense2) { Expense.create!(author: user, category: category2, name: 'Medicine', amount: 15.0) }

  before do
    sign_in user
    visit categories_path
  end

  scenario 'displays the categories with their details' do
    expect(page).to have_content('Categories')

    within('.categories') do
      expect(page).to have_content(category1.name)
      expect(page).to have_content(expense1.amount)
      expect(page).to have_content(category2.name)
      expect(page).to have_content(expense2.amount)
    end
  end

  scenario 'displays buttons to view expenses and add a new expense for each category' do
    within('.categories') do
      expect(page).to have_link('View Expenses', href: category_expenses_path(category1))
      expect(page).to have_link('View Expenses', href: category_expenses_path(category2))
      expect(page).to have_link('Add a New Expense', href: new_category_expense_path(category1))
      expect(page).to have_link('Add a New Expense', href: new_category_expense_path(category2))
    end
  end

  scenario 'displays a button to add a new category' do
    expect(page).to have_link('Scan', href: new_category_path)
  end

  scenario 'displays a message and a button to add a new category when no categories exist' do
    Expense.destroy_all # Delete associated expenses first
    Category.destroy_all
    visit categories_path

    expect(page).to have_content('No categories found')
    expect(page).to have_link('Scan')
  end
end

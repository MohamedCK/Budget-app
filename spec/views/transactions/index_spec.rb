require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  before :each do
    @name = Faker::Name.name
    @email = Faker::Internet.email
    @password = Faker::Internet.password

    @user = User.create(name: @name, email: @email, password: @password)
    @category = Group.create(author: @user, name: 'cake', icon: 'https://th.bing.com/th/id/R.bbd92d64f5c944c8deb186f221857c0e?rik=qkpNCm0avpbgcA&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_317099.png&ehk=ku2fAarDstuuq2N4Mi6LoH%2b2xZf0aTKTtW5FHlDfymE%3d&risl=&pid=ImgRaw&r=0')

    @transaction = Expense.create(author: @user, name: 'cake', amount: 100, groups: [@category])

    visit root_path
    click_link 'Log In'

    within('#new_user') do
      fill_in 'email', with: @email
      fill_in 'password', with: @password
    end
    click_button 'Log in'
    visit group_expenses_path(@category)
  end

  it 'visits transactions page' do
    expect(page).to have_content 'Transactions'
  end

  # it 'displays total transactions price' do
  #     expect(page).to have_content("#{@name} : $100.0")
  # end
end

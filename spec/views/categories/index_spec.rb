require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    @name = 'King Cake'
    @email = "#{rand(1000)}_#{Faker::Internet.email}"
    @user = User.create(name: @name, email: @email, password: '123456')
    @category = Group.create(author: @user, name: 'king cake', icon: 'https://th.bing.com/th/id/R.bbd92d64f5c944c8deb186f221857c0e?rik=qkpNCm0avpbgcA&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_317099.png&ehk=ku2fAarDstuuq2N4Mi6LoH%2b2xZf0aTKTtW5FHlDfymE%3d&risl=&pid=ImgRaw&r=0')

    visit root_path
    click_link 'Log In'

    within('#new_user') do
      fill_in 'email', with: @email
      fill_in 'password', with: '123456'
    end
    click_button 'Log in'
  end

  it 'visits categories page' do
    expect(current_path).to match groups_path
    expect(page).to have_content 'king cake'
  end

  # it 'redirects to transactions page of the category' do
  #     within("#group_#{@category.id}") do
  #         click_on @category.name
  #     end
  #     expect(current_path).to match group_expenses_path(@category)
  # end
end

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'King Cake', email: 'cake@gmail.com', password: '123456') }
  let(:group) { described_class.new(author: user, name: 'Food', icon: 'http://bit.ly/3Z67TG0') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'is not valid without a user id' do
      group.author_id = nil
      expect(group).to_not be_valid
    end

    it 'is not valid without an icon' do
      group.icon = nil
      expect(group).to_not be_valid
    end
  end
end

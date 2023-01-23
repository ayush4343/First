require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user ' do
    user = FactoryBot.create(:user)

    it 'should be valid user with all attributes' do
      expect(user.valid?).to eq(true)
    end

    describe "validations" do
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:username)}
      it {should validate_presence_of(:email)}
      it {should validate_presence_of(:password)}
    end
    

    describe 'association'  do
        it {should have_many(:posts)}  
    end
  end
end

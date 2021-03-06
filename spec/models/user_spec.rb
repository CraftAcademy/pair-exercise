require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  describe 'Fixtures' do
    it 'should have valid User Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it 'should have valid Admin Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:posts) }
  end

  describe 'Database Schema' do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :email }
    # Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('a@a.com', 'a@1b.net').for(:email) }
    it { is_expected.to_not allow_value('a@a', 'a@1b,net', '!d@e.se', 'd@a!.s0').for(:email) }
  end

  context 'instance methods' do
    let(:user) { User.create(first_name: 'Thomas', last_name: 'Ochman', email: 'thomas@test.com', password: 'password') }
    it { is_expected.to respond_to :name }
    it 'returns name as a combination of first and last' do
      expect(user.name).to eq 'Thomas Ochman'
    end
  end
end
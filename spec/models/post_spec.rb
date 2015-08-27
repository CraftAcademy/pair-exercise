require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Fixtures' do
    it 'should have valid User Factory' do
      expect(FactoryGirl.create(:post)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'Database Schema' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :body }
    # Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
end

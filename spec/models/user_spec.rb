require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of :name }

    context 'when create new user' do
      subject { build :user, name: 'admin', email: 'model@test.com' }
      it { is_expected.to be_valid }
    end

    context "when user with this email is already exist" do
      let(:another_user) { create :user, email: "test@test.com"}
      subject { build :user, another_user.attributes }

      it { is_expected.to_not be_valid }
    end

    context 'when try to creating user with empty name' do
      subject { build :user, name: nil }
      it { is_expected.to_not be_valid }
    end
  end

  describe 'database columns' do
    it { should have_db_column :provider}
    it { should have_db_column :uid }
    it { should have_db_column :name }
    it { should have_db_column :image_url }
  end

  describe 'associations' do
    it { is_expected.to have_many :books }
    it { is_expected.to have_many :user_books }
  end
end

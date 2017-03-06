require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create new user' do
    context 'when create new user' do
      subject { build :user, email: 'model@test.com' }

      it { is_expected.to be_valid }
    end

    context "when user with that email is already exist" do
      let(:another_user) { create :user , email: "test@test.com"}
      subject { build :user, another_user.attributes }

      it { is_expected.to_not be_valid }
    end

    context 'when try to create empty user' do
      subject { build :user, email: '', password: '' }

      it { is_expected.to_not be_valid }
    end
  end
end

require 'rails_helper'

RSpec.describe UserBook, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of :user}
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :book }
  end

  describe 'database columns' do
    it { should have_db_column :user_id}
    it { should have_db_column :book_id }
    it { should have_db_column :give_back }
  end
end

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :author }
    it { validate_uniqueness_of :title }

    context "when creating new book" do
      subject { build :book }
      it { is_expected.to be_valid }
    end

    context "when creating book which already exist" do
      let!(:book) { create :book, title: 'Magda Gessler Restaurants'}
      subject { build :book, title: 'Magda Gessler Restaurants'}
      it { is_expected.to_not be_valid }
    end

    context "when creating book with epty attribute" do
      let!(:book) { create :book }
      it { is_expected.to_not be_valid }
    end
    context "when creating book with nill title" do
      subject { build :book, title: nil }
      it { is_expected.to_not be_valid }
    end

  end

  describe 'database columns' do
    it { should have_db_column :title}
    it { should have_db_column :grade }
    it { should have_db_column :author }
    it { should have_db_column :description }
    it { is_expected.to have_db_index :title}
  end

  describe 'associations' do
    it { is_expected.to have_many :users }
    it { is_expected.to have_many :user_books }
  end
end

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#which_alert" do
    let(:success) { 'notice'}
    let(:danger) { 'danger'}

    it 'return success alert' do
      expect(helper.which_alert(success)).to eq('success')
    end

    it 'return danger alert' do
      expect(helper.which_alert(danger)).to eq('danger')
    end
  end
end

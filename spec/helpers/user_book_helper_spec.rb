require 'rails_helper'

RSpec.describe UserBooksController, type: :helper do
  let(:first_time) { DateTime.new(2012, 8, 29, 22, 35, 0) }

  describe "#shortest_timme" do
    it "return time in format 'dd:MM:yyyy, hh:mm'" do
      expect(helper.shortest_timme(first_time)).to eq("29.08.2012, 22:35")
    end
  end
end

require 'bike'

describe Bike do
  it {is_expected.to respond_to(:working?) }

  describe 'broken_bike' do
    it 'bike can be reported broken' do
      subject.report_broken
      expect(subject.broken).to eq true
    end
  end
end

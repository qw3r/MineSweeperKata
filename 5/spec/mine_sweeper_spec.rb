require 'rspec'

require_relative '../mine_sweeper'


describe MineSweeper do


  inputs = [
    %w[* *],
    %w[. 0],
    %w[.. 00],
    %W[.\n. 0\n0],
  ]


  inputs.each do |given, hints|
    it "give the hint (#{hints}) for the input (#{given})" do
      expect(MineSweeper.new(given).hints).to eq hints
    end
  end

end

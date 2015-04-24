require 'spec_helper'

describe Kata::RomanNumeral do
	let(:numeral) { described_class.new }

	describe '#to_s' do
		it 'returns the basic 10^x numerals' do
			expect(described_class.new(1).to_s).to eq('I')
			expect(described_class.new(10).to_s).to eq('X')
			expect(described_class.new(100).to_s).to eq('C')
			expect(described_class.new(1000).to_s).to eq('M')
		end

		it 'returns the basic 5*10^x numerals' do
			expect(described_class.new(5).to_s).to eq('V')
			expect(described_class.new(50).to_s).to eq('L')
			expect(described_class.new(500).to_s).to eq('D')
		end

		it 'returns double numerals for 2*10^x' do
			expect(described_class.new(2).to_s).to eq('II')
			expect(described_class.new(20).to_s).to eq('XX')
			expect(described_class.new(200).to_s).to eq('CC')
		end

		it 'returns VII for 7' do
			expect(described_class.new(7).to_s).to eq('VII')
		end

		it 'returns XIII for 13' do
			expect(described_class.new(13).to_s).to eq('XIII')
		end

		it 'does substraction for 4' do
			expect(described_class.new(4).to_s).to eq('IV')
		end

		it 'does substraction for 9' do
			expect(described_class.new(9).to_s).to eq('IX')
			expect(described_class.new(90).to_s).to eq('XC')
			expect(described_class.new(900).to_s).to eq('CM')
		end

		it 'returns MMMMM for 5000' do
			expect(described_class.new(5000).to_s).to eq('MMMMM')
		end

		it 'returns an empty string for 0' do
			expect(described_class.new(0).to_s).to eq('')
		end

		# acceptance tests
		it 'returns MMVIII for 2015' do
			expect(described_class.new(2015).to_s).to eq('MMXV')
		end

		it 'returns MCMXC for 1999' do
			expect(described_class.new(1999).to_s).to eq('MCMXCIX')
		end

		it 'returns CDXLVIII for 448' do
			expect(described_class.new(448).to_s).to eq('CDXLVIII')
		end

	end
end
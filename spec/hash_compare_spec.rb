# frozen_string_literal: true

RSpec.describe HashCompare do
  describe '.compare' do
    subject { described_class.compare(a, b) }

    describe 'argument is hash' do
      let(:a) { { a: 3, b: 2 } }
      let(:b) { {} }

      it { is_expected.to eq [['-', :a, 3], ['-', :b, 2]] }
    end
  end
end

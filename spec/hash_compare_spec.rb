# frozen_string_literal: true

RSpec.describe HashCompare do
  describe '.compare' do
    subject { described_class.compare(a, b) }

    context 'キーが不足している場合' do
      let(:a) { { a: 3, b: 2 } }
      let(:b) { {} }

      it { is_expected.to eq [['-', 'a', 3], ['-', 'b', 2]] }
    end

    context 'キーが充足している場合' do
      let(:a) { {} }
      let(:b) { { a: 3, b: 2 } }

      it { is_expected.to eq [['+', 'a', 3], ['+', 'b', 2]] }
    end
  end
end

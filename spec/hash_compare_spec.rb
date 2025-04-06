# frozen_string_literal: true

RSpec.describe HashCompare do
  describe '.compare' do
    subject { described_class.compare(a, b) }

    context '比較対象の右辺がnilだった場合' do
      let(:a) { { a: 1 } }
      let(:b) { nil }

      it { is_expected.to eq [['~', '', { a: 1 }, nil]] }
    end

    context '比較対象の左辺がnilだった場合' do
      let(:a) { nil }
      let(:b) { { b: 2 } }

      it { is_expected.to eq [['~', '', nil, { b: 2 }]] }
    end

    context '比較対象の両方ともnilだった場合' do
      let(:a) { nil }
      let(:b) { nil }

      it { is_expected.to eq [] }
    end

    context 'キーが不足している場合' do
      let(:a) { { a: 1, b: 2 } }
      let(:b) { {} }

      it { is_expected.to eq [['-', 'a', 1], ['-', 'b', 2]] }
    end

    context 'キーが充足している場合' do
      let(:a) { {} }
      let(:b) { { a: 1, b: 2 } }

      it { is_expected.to eq [['+', 'a', 1], ['+', 'b', 2]] }
    end
  end
end

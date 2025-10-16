RSpec.describe NumRuby::UFunc::Registry do
  let(:a) { Numo::DFloat[1, 2, 3] }
  let(:b) { Numo::DFloat[4, 5, 6] }

  describe ".call" do
    it "adds two arrays with :add" do
      result = described_class.call(:add, a, b)
      expect(result).to eq(Numo::DFloat[5, 7, 9])
    end

    it "applies sin with :sin" do
      result = described_class.call(:sin, a)
      expect(result).to be_a(Numo::DFloat)
    end

    it "raises on unknown ufunc" do
      expect { described_class.call(:foo, a) }.to raise_error(ArgumentError)
    end
  end
end

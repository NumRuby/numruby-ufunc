require 'spec_helper'

RSpec.describe NumRuby::UFunc::Registry do
  it 'has all expected ufuncs registered' do
    expected = %i[
      absolute add arccos arcsin arctan ceil cos cosh divide exp exp2 floor hypot log log2
      log10 maximum minimum multiply pow rint sign sin sinh sqrt subtract tan tanh trunc
    ]

    registered = described_class.ufuncs.keys
    expect(registered.sort).to eq(expected.sort)
  end

  it 'raises an error for unknown ufunc' do
    expect { described_class.call(:nonexistent, 1, 2) }.to raise_error(ArgumentError)
  end
end

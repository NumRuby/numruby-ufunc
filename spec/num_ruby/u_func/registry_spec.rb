require 'spec_helper'

RSpec.describe NumRuby::UFunc::Registry do
  it 'has all expected ufuncs registered' do
    expected = %i[
      absolute add arccos arcsin arctan cbrt ceil conj conjugate cos cosh divide divmod
      exp exp2 expm1 fabs floor floor_divide float_power fmod gcd heaviside hypot lcm
      log log1p log2 log10 logaddexp logaddexp2 matmul maximum minimum mod multiply
      negative positive power pow reciprocal remainder rint sign sin sinh square sqrt
      subtract tan tanh true_divide trunc
    ]

    registered = described_class.ufuncs.keys
    expect(registered.sort).to eq(expected.sort)
  end

  it 'raises an error for unknown ufunc' do
    expect { described_class.call(:nonexistent, 1, 2) }.to raise_error(ArgumentError)
  end
end

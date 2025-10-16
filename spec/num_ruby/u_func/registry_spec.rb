require 'spec_helper'

RSpec.describe NumRuby::UFunc::Registry do
  it 'has all expected ufuncs registered' do
    expected = %i[
      absolute add arccos arccosh arcsin arcsinh arctan arctan2 arctanh bitwise_and
      bitwise_or bitwise_xor cbrt ceil conj conjugate cos cosh deg2rad degrees divide
      divmod exp exp2 expm1 fabs floor floor_divide float_power fmod gcd heaviside
      hypot invert lcm left_shift log log1p log2 log10 logaddexp logaddexp2 matmul
      maximum minimum mod multiply negative positive power pow rad2deg radians
      reciprocal remainder right_shift rint sign sin sinh square sqrt subtract tan
      tanh true_divide trunc
    ]

    registered = described_class.ufuncs.keys
    expect(registered.sort).to eq(expected.sort)
  end

  it 'raises an error for unknown ufunc' do
    expect { described_class.call(:nonexistent, 1, 2) }.to raise_error(ArgumentError)
  end
end

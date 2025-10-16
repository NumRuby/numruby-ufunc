require "spec_helper"

RSpec.describe NumRuby::UFunc::Registry do
  it "has all expected ufuncs registered" do
    expected = [:abs, :add, :arccos, :arcsin, :arctan, :ceil, :cos, :cosh, :div, :exp, :exp2, :floor, :hypot, :log, :log2, :log10, :maximum, :minimum, :multiply, :pow, :round, :sign, :sin, :sinh, :sqrt, :sub, :tan, :tanh, :trunc]

    registered = NumRuby::UFunc::Registry.ufuncs.keys
    expect(registered.sort).to eq(expected.sort)
  end

  it "raises an error for unknown ufunc" do
    expect { NumRuby::UFunc::Registry.call(:nonexistent, 1, 2) }.to raise_error(ArgumentError)
  end
end

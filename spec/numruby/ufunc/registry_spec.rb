require "spec_helper"

RSpec.describe NumRuby::UFunc::Registry do
  it "has all expected ufuncs registered" do
    expected = [:add, :sub, :mul, :div, :sin, :cos, :tan, :exp, :log, :sqrt]
    registered = NumRuby::UFunc::Registry.ufuncs.keys
    expect(registered.sort).to eq(expected.sort)
  end

  it "raises an error for unknown ufunc" do
    expect { NumRuby::UFunc::Registry.call(:nonexistent, 1, 2) }.to raise_error(ArgumentError)
  end
end

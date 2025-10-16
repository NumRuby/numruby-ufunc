RSpec.describe NumRuby::UFunc::VERSION do
  it 'is a string' do
    expect(NumRuby::UFunc::VERSION).to be_a(String)
  end

  it 'follows semantic versioning' do
    expect(NumRuby::UFunc::VERSION).to match(/^\d+\.\d+\.\d+$/)
  end
end

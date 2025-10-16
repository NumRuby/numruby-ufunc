RSpec.describe NumRuby::UFunc do
  it 'has a version number' do
    expect(NumRuby::UFunc::VERSION).not_to be_nil
  end

  it 'responds to .call' do
    expect(described_class).to respond_to(:call)
  end
end

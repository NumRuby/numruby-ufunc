RSpec.describe NumRuby::UFunc do
  it "has a version number" do
    expect(NumRuby::UFunc::VERSION).not_to be nil
  end

  it "responds to .call" do
    expect(NumRuby::UFunc).to respond_to(:call)
  end
end

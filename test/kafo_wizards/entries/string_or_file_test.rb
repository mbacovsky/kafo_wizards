describe KafoWizards::Entries::StringOrFileEntry do

  let(:text) { KafoWizards::Entries::StringOrFileEntry.new(:text)}

  it "inherits from StringEntry" do
    text.display_type(true).must_include :string
  end

end

describe KafoWizards::Entries::PasswordEntry do

  let(:password) { KafoWizards::Entries::PasswordEntry.new(:password)}

  it "inherits from StringEntry" do
    password.display_type(true).must_include :string
  end

  describe "update" do
    it "updates the value" do
      pass = password
      pass.update(:password => 'password', :password_confirmation => 'password')
      pass.value.must_match 'password'
    end

    it "raises ValidationError when the values differ" do
      proc {
        password.update(:password => 'password', :password_confirmation => 'otherpassword')
      }.must_raise KafoWizards::ValidationError
    end

  end

  describe "validate" do
    it "accepts valid password" do
      res = password.validate('password')
      res.must_match 'password'
    end

    it 'raises ValidationError when the password is less then 8 chars long' do
      proc {
        password.validate('xxx')
      }.must_raise KafoWizards::ValidationError
    end
  end
end

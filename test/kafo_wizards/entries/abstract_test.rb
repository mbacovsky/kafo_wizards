require 'test_helper'

describe KafoWizards::Entries::AbstractEntry do

  let(:entry) do KafoWizards::Entries::AbstractEntry.new(:name,
    :label => 'NAME',
    :default_value => 'Mr. X',
    :description => 'Description',
    :validators => [])
  end

  it 'has label' do
    entry.label.must_equal 'NAME'
  end

  it 'has description' do
    entry.description.must_equal 'Description'
  end

  it 'has default label' do
    entry = KafoWizards::Entries::AbstractEntry.new(:postal_code)
    entry.label.must_equal 'Postal code'
  end

  it 'has required option' do
    entry = factory.abstract(:name, :required => true)
    entry.required?.must_equal true
  end

  describe "display_type" do
    it "should have default display type" do
      entry.display_type.must_equal :abstract
    end

    # it "should allow to override the display type" do
    # end

    it "should return the ancestry" do
      class MyEntry < KafoWizards::Entries::AbstractEntry
      end

      entry = MyEntry.new(:name)
      entry.display_type(true).must_equal [:my, :abstract]
    end

  end

  describe "update" do
    it "should update the entry" do
      name = entry
      name.update('Test')
      name.value.must_equal 'Test'
    end

    it "calls the valiedate method" do
      name = entry
      name.expects(:validate).returns("Validated")
      name.update('Test')
      name.value.must_equal "Validated"
    end

    it 'calls custom validators' do
      name = entry
      name.expects(:validate).returns("Validated")
      name.validators = [lambda { |value| return "Custom #{value}" }]
      name.update('Test')
      name.value.must_equal "Custom Validated"
    end


  end
end


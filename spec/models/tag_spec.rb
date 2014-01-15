require 'spec_helper'

describe Tag do
  it "is valida with name" do
    expect(build(:tag)).to be_valid
  end

  it "is invalida without name" do
    expect(build(:tag, name: nil)).to have(1).error_on(:name)
  end
end

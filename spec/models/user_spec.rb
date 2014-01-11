require 'spec_helper'

describe User do
    it "is valid with name,email and password" do
        expect(build(:user)).to be_valid
    end
    it "is invalid without a name" do
        expect(build(:user, name: nil)).to have(1).errors_on(:name)
    end
    it "is invalid without an email" do
        expect(build(:user, email: nil)).to have(1).errors_on(:email)
    end
    it "is invalid without a password" do
        expect(build(:user, password: nil)).to have(2).errors_on(:password)
    end
end
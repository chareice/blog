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

    context "auth method" do
        subject{ create(:user) }
        it "return true when email and password matched user" do
            expect(User.auth(subject.email, subject.password)).to be_true 
        end

        it "return false when email and password not matched" do
            expect(User.auth(subject.email, "what the fuck")).to be_false
            expect(User.auth("what's the user email", "what the fuck")).to be_false
        end
    end
end
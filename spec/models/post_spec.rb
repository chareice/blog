require 'spec_helper'

describe Post do
    it "is valid with title and content" do
        expect(build(:post)).to be_valid
    end

    it "is invalid without title" do
        expect(build(:post, title: nil)).to have(1).errors_on(:title)
    end

    it "is invalid without content" do
        expect(build(:post, content: nil)).to have(1).errors_on(:content)
    end
end
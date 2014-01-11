require 'spec_helper'

describe Post do
    it "is valid with title and content" do
        expect(Post.new(
            title: "The title of post",
            content: "The post Content"
        )).to be_valid
    end

    it "is invalid without title" do
        expect(Post.new(title: nil)).to have(1).errors_on(:title)
    end

    it "is invalid without content" do
        expect(Post.new(content: nil)).to have(1).errors_on(:content)
    end
end
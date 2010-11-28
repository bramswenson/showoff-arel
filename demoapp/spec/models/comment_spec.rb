require 'spec_helper'

describe Comment do
  before(:each) do
    @user = User.last ||
            Factory.create(:user, :email => 'neo@matrix.com', 
                           :password => 'trinity1',
                           :password_confirmation => 'trinity1')
    @post = Post.last ||
            Factory.create(:post, :user => @user, :title => 'All about Morpheus')
    @comment = Factory(:comment)
  end
    
  context "should not be valid" do

    it "without name" do
      @comment.name = nil
      @comment.should_not be_valid
    end

    it "without title" do
      @comment.title = nil
      @comment.should_not be_valid
    end

    it "without comment" do
      @comment.comment = nil
      @comment.should_not be_valid
    end

    it "without post" do
      @comment.post = nil
      @comment.should_not be_valid
    end
  end

end

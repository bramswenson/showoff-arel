require 'spec_helper'

describe Post do
  before(:each) do
    @user = Factory(:user, :email => 'neo@matrix.com', :password => 'trinity1',
                    :password_confirmation => 'trinity1')
    @post = Factory(:post, :user => @user, :title => 'All about Morpheus')
  end
    
  context "should not be valid" do

    it "without title" do
      @post.title = nil
      @post.should_not be_valid
    end

    it "without body" do
      @post.body = nil
      @post.should_not be_valid
    end

    it "without user" do
      @post.user = nil
      @post.should_not be_valid
    end

    it "without unique title" do
      @post.save!
      post2 = Factory(:post, :user => @user)
      post2.title = 'All about Morpheus'
      post2.should_not be_valid
    end
  end

  it "should auto generate the slug field" do
    @post.save!
    @post.slug.should_not be_blank
  end
  
end

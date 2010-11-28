require 'spec_helper'

describe Following do
  before(:each) do
    @user = Factory.create(:user, :email => 'neo@matrix.com', :password => 'trinity1',
                           :password_confirmation => 'trinity1',
                           :blog_name => 'Adventures in The Matrix')
    @user2 = Factory.create(:user, :email => 'morpheus@matrix.com', :password => 'theone?',
                           :password_confirmation => 'theone?',
                           :blog_name => 'My ship and me')
    @following = Factory(:following, :follower => @user, :followed => @user2)
  end

  context "should not be valid" do

    it "without follower" do
      @following.follower = nil
      @following.should_not be_valid
    end

    it "without followed" do
      @following.followed = nil
      @following.should_not be_valid
    end

    it "when already followed" do
      @following.save!
      following2 = Factory(:following, :follower => @user)
      following2.followed = @user2
      following2.should_not be_valid
    end

  end

  it "should be in users source_followings" do
    @following.save!
    @user.source_followings.include?(@following).should be_true 
  end

  it "should be in user2s target_followings" do
    @following.save!
    @user2.target_followings.include?(@following).should be_true 
  end

  it "user2 should be in users following" do
    @following.save!
    @user.following.include?(@user2).should be_true 
  end

  it "user should be in user2 followers" do
    @following.save!
    @user2.followers.include?(@user).should be_true 
  end
end

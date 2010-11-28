require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory(:user, :email => 'neo@matrix.com', :password => 'trinity1',
                    :password_confirmation => 'trinity1',
                    :blog_name => 'Adventures in The Matrix')
  end

  context "should not be valid" do

    it "without email" do
      @user.email = nil
      @user.should_not be_valid
    end

    it "without password" do
      @user.password = nil
      @user.should_not be_valid
    end

    it "without matching password and password_confirmation" do
      @user.password = 'pass1'
      @user.password = 'pass2'
      @user.should_not be_valid
    end

    it "withouth blog_name" do
      @user.blog_name = nil
      @user.should_not be_valid
    end

    it "without unique blog_name" do
      @user.save!
      user2 = Factory(:user)
      user2.blog_name = @user.blog_name
      user2.should_not be_valid
    end

  end

  it "should auto generate the slug field" do
    @user.save!
    @user.blog_slug.should_not be_blank
  end
  
end

require 'spec_helper'

describe Rating do
  before(:each) do
    @user = Factory.create(:user, :email => 'neo@matrix.com', :password => 'trinity1',
                           :password_confirmation => 'trinity1',
                           :blog_name => 'Adventures in The Matrix')
    @user2 = Factory.create(:user, :email => 'morpheus@matrix.com', :password => 'theone?',
                           :password_confirmation => 'theone?',
                           :blog_name => 'My ship and me')
    @post = Factory.create(:post, :user => @user)
    @rating = Factory(:rating, :rater => @user2, :post => @post, :rating => 5)
  end

  context "should not be valid" do

    it "without rater" do
      @rating.rater = nil
      @rating.should_not be_valid
    end

    it "without post" do
      @rating.post = nil
      @rating.should_not be_valid
    end

    it "without rating" do
      @rating.rating = nil
      @rating.should_not be_valid
    end

    it "with rating lower than 1" do
      @rating.rating = -1
      @rating.should_not be_valid
    end

    it "with rating higher than 5" do
      @rating.rating = 6
      @rating.should_not be_valid
    end

    it "with rater having already rated post" do
      @rating.save!
      rating2 = Factory(:rating, :rater => @user2, :rating => 5)
      rating2.post = @post
      rating2.should_not be_valid
    end
  end

  it "should be in the users ratings" do
    @rating.save!
    @user2.ratings.include?(@rating).should be_true
  end

  it "should be in the post ratings" do
    @rating.save!
    @post.ratings.include?(@rating).should be_true
  end

  it "user should be in the posts raters" do
    @rating.save!
    @post.raters.include?(@user2).should be_true
  end

  it "post should be in the users posts_rated" do
    @rating.save!
    @user2.posts_rated.include?(@post).should be_true
  end
end

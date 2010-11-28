require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory(:user, :email => 'neo@matrix.com', :password => 'trinity1',
                    :password_confirmation => 'trinity1')
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
  end

end

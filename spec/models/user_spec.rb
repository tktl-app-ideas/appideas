require 'spec_helper'

describe User do
  before(:each) do
    @user = User.create username:"nimi", password:"salasana"
  end
  
  it "is saved with correct name and password" do
    
    expect(@user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "is not saved if username is already in use" do
    user2 = User.create username:"nimi", password:"salasana2"
    expect(user2.valid?).not_to be(true)
    expect(User.count).to eq(1)
  end

  it "is not saved if password is null" do
    user2 = User.create username:"nimi", password:"salasana2"
    expect(user2.valid?).not_to be(true)
    expect(User.count).to eq(1)
  end
end

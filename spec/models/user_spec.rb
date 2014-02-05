require 'spec_helper'

describe User do
  it "is saved with correct name and password" do
    user = User.create username:"nimi", password:"salasana"

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

end

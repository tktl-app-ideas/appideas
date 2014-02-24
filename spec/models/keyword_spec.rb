require 'spec_helper'

describe Keyword do
  it "is saved with the correct name" do
    kw = Keyword.create name:"Testi"

    expect(kw.valid?).to be(true)
    expect(Keyword.count).to eq(1)
  end

  it "is not saved without name" do
    kw = Keyword.create concrete:false

    expect(kw.valid?).not_to be(true)
    expect(Keyword.count).to eq(0)
  end

  it "is saved with correct concrete" do
    kw = Keyword.create name:"Testi", concrete:true

    expect(kw.valid?).to be(true)
    expect(Keyword.count).to eq(1)
  end
end

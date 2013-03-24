require 'spec_helper'

describe Registrant do

  before { @registrant = Registrant.new(name: "Twin Panichsomabt", email: "roofimon@live.com") }

  subject { @registrant }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  describe 'when name is not present' do
    before { @registrant.name = " " }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { @registrant.email = " " }
    it { should_not be_valid }
  end

  describe 'when name is longer than 50 characters' do
    before { @registrant.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe 'when email format is invalid' do
    %w(abc abc@def).each do |email|
      before { @registrant.email = email }
      it { should_not be_valid }
    end
  end

  describe 'when email format is valid' do
    before { @registrant.email = "roong.p@ppteam.net" }
    it { should be_valid }
  end

  describe 'when email address is already taken' do
    before {
      @user1 = Registrant.new(name: "Twin Panichsomabt", email: "roofimon@live.com")
      @user1.save!
    }
    it {should_not be_valid}
  end
end

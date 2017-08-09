require "rails_helper"

RSpec.describe Category, type: :model do

  describe "Factory" do
    it "creates a valid object" do
      expect(FactoryGirl.create(:category)).to be_valid
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "Associations" do
    it { should have_many(:jobs) }
  end
end

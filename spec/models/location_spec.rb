require "rails_helper"

RSpec.describe Location, type: :model do
  describe "Factory" do
    it "creates valid object" do
      expect(FactoryGirl.build(:location)).to be_valid
    end
  end

  describe "Validations" do
    subject { FactoryGirl.build(:location) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_uniqueness_of(:city).scoped_to(:state) }
  end

  describe "Associations" do
    it { should have_many(:jobs) }
  end
end

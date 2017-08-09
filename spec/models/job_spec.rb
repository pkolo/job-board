require "rails_helper"

RSpec.describe Job, type: :model do
  describe "Factory" do
    it "creates valid object" do
      expect(FactoryGirl.create(:job)).to be_valid
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:details) }
  end

  describe "Associations" do
    it { should belong_to(:category) }
  end
end

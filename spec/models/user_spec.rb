require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  context "with valid attributes" do
    it "is valid" do
      user = User.new(email: "user@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end
  end

  context "without an email" do
    it "is invalid" do
      user = User.new(password: "password", password_confirmation: "password")
      expect(user).to_not be_valid
    end
  end

  context "without a password" do
    it "is invalid" do
      user = User.new(email: "user@example.com")
      expect(user).to_not be_valid
    end
  end

  context "when passwords do not match" do
    it "is invalid" do
      user = User.new(email: "user@example.com", password: "password", password_confirmation: "wrongpassword")
      expect(user).to_not be_valid
    end
  end

  describe "#authenticate" do
    let(:user) { User.create!(email: "user@example.com", password: "password", password_confirmation: "password") }

    context "with valid password" do
      it "authenticates" do
        expect(user.valid_password?("password")).to be true
      end
    end

    context "with invalid password" do
      it "does not authenticate" do
        expect(user.valid_password?("wrongpassword")).to be false
      end
    end
  end
end

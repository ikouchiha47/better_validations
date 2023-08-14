class User
  include ActiveModel::Model
  include ActiveModel::Validations
  attr_accessor :email, :custom_email

  validates :email, email_format: { allow_nil: true }
  validates :custom_email, email_format: { check_with: ->(email) { email == "foo.bar" }, allow_nil: true }
end

class UserWithNilableEmail
  include ActiveModel::Model
  include ActiveModel::Validations
  attr_accessor :email, :custom_email

  validates :email, email_format: { allow_nil: true }
  validates :custom_email, email_format: { check_with: ->(email) { email == "foo.bar" } }
end

RSpec.describe EmailFormatValidator do
  it "returns error for invalid email" do
    user = User.new
    user.email = "invalid-email"

    expect(user.valid?).to eq(false)
    expect(user.errors[:email]).to include("is not a valid email")
  end

  it "returns true for valid email" do
    user = User.new
    user.email = "goo@bar"

    expect(user).to be_valid
    expect(user.errors.count).to eq(0)

    user = User.new
    user.email = "goo@gmail.com"
    expect(user).to be_valid

    expect(user.errors.count).to eq(0)
  end

  it "uses the custom proc to validate email" do
    user = User.new
    user.custom_email = "valid.email@gmail.com"

    user.valid?
    expect(user.errors.count).to eq(1)
    expect(user.errors[:custom_email]).to include("is not a valid email")

    expect(user.errors[:email]).to be_empty
  end

  it "skips validation on nil value if allow_nil is true" do
    user = UserWithNilableEmail.new
    user.valid?

    expect(user.errors[:custom_email]).not_to be_empty
    expect(user.errors[:email]).to be_empty

    user.custom_email = "foo.bar"
    user.valid?

    expect(user.errors[:custom_email]).to be_empty
    expect(user.errors[:email]).to be_empty
  end
end

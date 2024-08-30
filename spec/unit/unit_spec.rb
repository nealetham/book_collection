require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: "Harry Potter")
  end

  it "is valid with a title" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end

end

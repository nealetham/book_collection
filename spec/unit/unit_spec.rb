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

  it "is valid with an author" do
    subject.author = 'J.K Rowling'
    expect(subject).to be_valid
  end

  it "is valid with a price" do
    subject.price = 20
    expect(subject).to be_valid
  end

  it "is valid with a published date" do
    subject.published_date = '2024-8-30'
    expect(subject).to be_valid
  end

end

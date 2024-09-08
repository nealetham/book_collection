# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'Harry Potter', author: 'J.K Rowling', price: '25.0', pdate: '1997-6-26')
  end

  it 'is valid with a title' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a published date' do
    subject.pdate = nil
    expect(subject).not_to be_valid
  end
end

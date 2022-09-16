# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
        title: 'harry potter', 
        author: 'J.K. Rowling',
        published: Date.new(2022, 9, 15),
        price: 19.99
    )
  end

  # 1
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  # 2
  it 'is not valid without a name' do
    subject.title = nil
    subject.author = 'J.K. Rowling'
    subject.published = Date.new(2022, 9, 15)
    subject.price = 19.99
    expect(subject).not_to be_valid
  end

  # 3
  it 'is not valid without an author' do
    subject.title = 'harry potter'
    subject.author = nil
    subject.published = Date.new(2022, 9, 15)
    subject.price = 19.99
    expect(subject).not_to be_valid
  end

  # 4
  it 'is not valid without a published date' do
    subject.title = 'harry potter'
    subject.author = 'J.K. Rowling'
    subject.published = nil
    subject.price = 19.99
    expect(subject).not_to be_valid
  end

  # 5
  it 'is not valid without a price' do
    subject.title = 'harry potter'
    subject.author = 'J.K. Rowling'
    subject.published = Date.new(2022, 9, 15)
    subject.price = nil
    expect(subject).not_to be_valid
  end

  # 6
  it 'is not valid with a negative price' do
    subject.title = 'harry potter'
    subject.author = 'J.K. Rowling'
    subject.published = Date.new(2022, 9, 15)
    subject.price = -1
    expect(subject).not_to be_valid
  end
end
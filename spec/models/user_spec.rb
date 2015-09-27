require 'rails_helper'

RSpec.describe User, type: :model do

  it {expect(subject).to have_many(:projects)}
  it {expect(subject).to validate_presence_of(:email)}
  it {expect(subject).to validate_uniqueness_of(:email)}
  it {expect(subject).to validate_presence_of(:name)}

end
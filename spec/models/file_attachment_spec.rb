require 'rails_helper'

RSpec.describe FileAttachment, type: :model do

  it { expect(subject).to belong_to(:comment) }

  it {expect(subject).to validate_presence_of(:file)}
end
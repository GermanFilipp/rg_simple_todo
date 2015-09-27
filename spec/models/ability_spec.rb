require 'rails_helper'


RSpec.describe Ability, type: :model do

  subject { ability }
  let(:ability){ Ability.new(user) }

  describe 'abilities for not log in customer' do
    let(:user){ nil }

    context 'for projects' do
      it { expect(ability).not_to be_able_to(:index,   Project) }
      it { expect(ability).not_to be_able_to(:show,    Project) }
      it { expect(ability).not_to be_able_to(:create,  Project) }
      it { expect(ability).not_to be_able_to(:update,  Project) }
      it { expect(ability).not_to be_able_to(:destroy, Project) }
    end

    context 'for tasks' do
      it { expect(ability).not_to be_able_to(:index,   Task) }
      it { expect(ability).not_to be_able_to(:show,    Task) }
      it { expect(ability).not_to be_able_to(:create,  Task) }
      it { expect(ability).not_to be_able_to(:update,  Task) }
      it { expect(ability).not_to be_able_to(:destroy, Task) }
    end

    context 'for comments' do
      it { expect(ability).not_to be_able_to(:index,   Comment) }
      it { expect(ability).not_to be_able_to(:show,    Comment) }
      it { expect(ability).not_to be_able_to(:create,  Comment) }
      it { expect(ability).not_to be_able_to(:update,  Comment) }
      it { expect(ability).not_to be_able_to(:destroy, Comment) }
    end

    context 'for file_attachments' do
      it { expect(ability).not_to be_able_to(:index,   FileAttachment) }
      it { expect(ability).not_to be_able_to(:show,    FileAttachment) }
      it { expect(ability).not_to be_able_to(:create,  FileAttachment) }
      it { expect(ability).not_to be_able_to(:update,  FileAttachment) }
      it { expect(ability).not_to be_able_to(:destroy, FileAttachment) }
    end
  end


  describe 'abilities for log in customer' do
    let(:user){ FactoryGirl.create(:user) }

    context 'for projects' do
      it { expect(ability).to be_able_to(:index,   Project) }
      it { expect(ability).to be_able_to(:show,    Project) }
      it { expect(ability).to be_able_to(:create,  Project) }
      it { expect(ability).to be_able_to(:update,  Project) }
      it { expect(ability).to be_able_to(:destroy, Project) }
    end

    context 'for tasks' do
      it { expect(ability).to be_able_to(:index,   Task) }
      it { expect(ability).to be_able_to(:show,    Task) }
      it { expect(ability).to be_able_to(:create,  Task) }
      it { expect(ability).to be_able_to(:update,  Task) }
      it { expect(ability).to be_able_to(:destroy, Task) }
    end

    context 'for comments' do
      it { expect(ability).to be_able_to(:index,   Comment) }
      it { expect(ability).to be_able_to(:show,    Comment) }
      it { expect(ability).to be_able_to(:create,  Comment) }
      it { expect(ability).to be_able_to(:update,  Comment) }
      it { expect(ability).to be_able_to(:destroy, Comment) }
    end

    context 'for file_attachments' do
      it { expect(ability).to be_able_to(:index,   FileAttachment) }
      it { expect(ability).to be_able_to(:show,    FileAttachment) }
      it { expect(ability).to be_able_to(:create,  FileAttachment) }
      it { expect(ability).to be_able_to(:update,  FileAttachment) }
      it { expect(ability).to be_able_to(:destroy, FileAttachment) }
    end
  end




end

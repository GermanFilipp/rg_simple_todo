feature 'attach files', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given!(:project) { FactoryGirl.create(:project, user: user, name: 'test project') }
  given!(:task) { FactoryGirl.create(:task, project: project) }
  given!(:comment) { FactoryGirl.create(:comment, task: task) }

  before do
    login_as user, scope: :user
    visit '/#/'
    @file = Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test.txt'), 'text/plain')
  end

  scenario 'user attach files to comment' do
    find('.li-task').hover
    find('.glyphicon-comment').click

    find('.glyphicon-save').set(@file)

    save_screenshot('./spec/screen/files.png')
  end

end
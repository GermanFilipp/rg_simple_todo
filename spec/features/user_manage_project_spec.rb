feature 'project', js: true do


  given(:user) { FactoryGirl.create(:user) }
  given!(:project) { FactoryGirl.create(:project, user: user, name: 'test project') }

  before do
    login_as user, scope: :user
    visit '/#/'
  end

  scenario 'user press \'Add Todo\' button and create new project' do
    find('.add-todo-list').click
    find('#project_name').set 'test project'
    click_button 'Submit'
    expect(page).to have_content('test project')
  end

  scenario 'user can delete his projects' do
    find('.glyphicon-trash').click
    expect(page).not_to have_content project.name
  end

  scenario 'user can edit his projects' do
    find('.original-text').click
    fill_in 'projname[name]', with:"hello world"
    find('#project_change_name').native.send_keys(:return)
    expect(page).to have_content('hello world')
  end

end
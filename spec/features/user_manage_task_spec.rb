feature 'task', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given!(:project) { FactoryGirl.create(:project, user: user, name: 'test project') }
  given!(:task) { FactoryGirl.create(:task, project: project) }

  before do
    login_as user, scope: :user
    visit '/#/'
  end

  scenario 'User add task successfully with valid data' do
    fill_in 'Enter task name', with: 'New task'
    click_button 'Add Task'
    expect(page).to have_content 'New task'
  end

  scenario 'User delete task successfully' do
    expect(page).to have_content task.title

    find('.li-task').hover
    within('.task-change') do
      find('.glyphicon-trash').click
    end

    expect(page).not_to have_content task.title
  end

  scenario 'user want to be able mark task as done' do
    find('#task_status').set true
    expect(page).to have_css('.done')
  end

  scenario 'user can edit his tasks' do
    find('.original-text').click
    fill_in 'task_name[name]', with:"hello world"
    find('#change_task_name').native.send_keys(:return)
    expect(page).to have_content('hello world')
  end

end
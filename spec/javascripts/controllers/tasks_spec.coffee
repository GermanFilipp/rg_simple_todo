#= require spec_helper
describe 'TasksController', ->
  beforeEach ->
    @project_with_task =  id: 1, name: 'first projects', tasks: [ { id: 1, title: 'first task' }]
    @scope.project = @project_with_task
    @controller('TasksController', { $scope: @scope, $http: @http })



  it "has setDeadline method", ->
    expect(@scope.setDeadline).toBeDefined()

  it "has updateStatus method", ->
    expect(@scope.updateStatus).toBeDefined()

  it "has createTask method", ->
    expect(@scope.createTask).toBeDefined()

  it "has updateTask method", ->
    expect(@scope.updateTask).toBeDefined()

  it "has deleteTask method", ->
    expect(@scope.deleteTask).toBeDefined()

  describe 'load', ->
    it 'sets up the list of tasks', ->
      expect(@scope.project.tasks.length).toEqual(1)

    it 'sort task by position', ->
      @first_task = { id: 1, title: 'first task', position: '2' }
      @second_task = { id: 2, title: 'second task', position: '1' }
      @scope.projects = [ id: 1, name: 'first projects', tasks: [ @first_task , @second_task ] ]
      @controller('TasksController', { $scope: @scope })
      expect(@scope.projects[0].tasks[0]).toEqual(@second_task)


  describe 'createTask', ->
    beforeEach ->
      @scope.todoText = '1234'

    it 'creates a new task', ->
      @scope.taskName = '123'
      @http.expectPOST('/tasks?title=1234&project_id=1').respond(200, { task: id: 2, title: '1234' })
      @scope.createTask(1)
      expect(@scope.project.tasks.length).toEqual(1)

  describe 'updateStatus', ->
    beforeEach ->
      @key = 0

    it 'update task status from true to false', ->
      @http.expectPATCH('/tasks/1?status=true').respond(200, '')
      @scope.updateStatus(1, false, @key)
      @http.flush()

    it 'update task status from false to true', ->
      @http.expectPATCH('/tasks/1?status=false').respond(200, '')
      @scope.updateStatus(1, true, @key)
      @http.flush()

    it 'switch status in display list', ->
      @http.whenPATCH('/tasks/1?status=false').respond(200, '')
      @scope.updateStatus(1, true, @key)
      @http.flush()
      expect(@scope.project.tasks[@key].status).toEqual(false)

  describe 'deleteTask', ->
    beforeEach ->
      @key = 0

    it 'remove task', ->
      @http.expectDELETE('/tasks/1').respond(200, '')
      @scope.deleteTask(1, @key)
      @http.flush()

    it 'remove task from display list', ->
      @http.whenDELETE('/tasks/1').respond(200, '')
      @scope.deleteTask(1, @key)
      @http.flush()
      expect(@scope.project.tasks.length).toEqual(0)

  describe 'sortableOptions', ->
    it 'update all task', ->
      @key = 0
      @http.expectPATCH('/tasks/1?position=' + @key).respond(200, '')
      @scope.sortableOptions.stop()
      @http.flush()

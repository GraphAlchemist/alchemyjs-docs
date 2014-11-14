'use strict'

describe 'Controller: NavCtrl', ->

  # load the controller's module
  beforeEach module 'siteApp'

  NavCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NavCtrl = $controller 'NavCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3

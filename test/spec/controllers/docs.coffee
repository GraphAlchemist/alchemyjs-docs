'use strict'

describe 'Controller: DocsCtrl', ->

  # load the controller's module
  beforeEach module 'siteApp'

  DocsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DocsCtrl = $controller 'DocsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3

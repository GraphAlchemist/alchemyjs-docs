'use strict'

# ngDoc needs to change...
###*
 # @ngdoc function
 # @name siteApp.controller:NavCtrl
 # @description
 # # NavCtrl
 # Controller of the siteApp
###

angular.module('navigation', ['ui.bootstrap'])
    .controller 'navCtrl', ($scope, $location, $route, $http) ->
        $scope.$on '$routeChangeSuccess', ->
            if $location.path() is '/examples/FullApp'
                $scope.showNav = "hidden"
            else
                $scope.showNav = ""

        $scope.init = ->
            # $scope.getGHData()
            $scope.links =   
            [
                { name: 'Home', href: '/'},
                { name: 'Examples', href: '/examples'},
                { name: 'Documentation', href: '/docs'} 
            ] 
            $scope.active($location.path())
            $scope.hidden = false

        $scope.active = (navTab) ->
            $location.hash("")
            for link in $scope.links
                if navTab is link.href
                    link.state= "active"
                    $location.path(link.href)
                else 
                    link.state= ""
        
        $scope.socialToggle = ->
            if $scope.hidden is false
                $scope.hidden = true
            else if $scope.hidden is true
                $scope.hidden = false

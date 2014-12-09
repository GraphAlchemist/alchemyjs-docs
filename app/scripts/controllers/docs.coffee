'use strict'

###*
 # @ngdoc function
 # @name siteApp.controller:DocsCtrl
 # @description
 # # DocsCtrl
 # Controller of the siteApp
###

angular.module('documentation',['ngRoute'])
    .run (['$anchorScroll', ($anchorScroll)->
        $anchorScroll.yOffset = 10])

    .controller 'docsCtrl', ($anchorScroll,  $location, $scope, $routeParams ) ->
        
 
        $scope.init = ->
            $scope.documents = {
                'Start': {}
                'Configuration': {} 
                'GraphJSON':{},
                'GraphStyling':{},
                'Examples':{},
                'Contributing':{},
                'API': {}
        }
            
            if 'documentsName' of $routeParams
                showDocs($routeParams.documentsName)

        $scope.getDocPartial = (docName) ->
            # loads all of the markdown partials that have been
            # precompiled into HTML
            "views/docs/#{docName}.html"        
           
        $scope.tocRan = false            
        $scope.createToC = () ->
             # since we edit the docs in markdown, headers, subheaders,
            # etc. may change.  For this reason, we use this function to 
            # build the table of contents style side bar on the fly
            if !$scope.tocRan
                $scope.tocRan = true
                sideBarSection = $("h2,h3,h5")
                docs = $scope.documents

                currentHeader = 'Start'
                currentSubHeader = ''
                _.forEach sideBarSection, (tag)->
                    content = tag.innerHTML
                    if tag.tagName is "H2"
                        if docs[content]?
                            currentHeader = content
                    if tag.tagName is "H3" 
                        docs[currentHeader][content] = []
                    if docs[currentHeader][content]?
                            currentSubHeader = content
                    if tag.tagName is "H5"
                        list = docs[currentHeader][currentSubHeader]
                        list.push(content) if list?

        $scope.gotoAnchor = (doc) ->
            
            old = $location.hash()
            $location.hash(doc)
            $anchorScroll()
            $location.hash(old)
            


        $scope.anchorName = (value) ->

            value.toLowerCase()
                 .split('.').join('-')
                 .split(' ').join('-')

        # $scope.sidebarView = (sidebar) ->
             
        #     showSidebar=!showSidebar
        #     showSubsidebar=false
        #     if showSidebar==true 
        #             showSubsidebar=!showSubsidebar
            
        #         if showSidebar==false 
        #             showSubsidebar==false

        #     console.log showSubsidebar    

            





        
    
'use strict'

###*
 # @ngdoc function
 # @name siteApp.controller:DocsCtrl
 # @description
 # # DocsCtrl
 # Controller of the siteApp
###

angular.module('documentation',['ngRoute'])
    .controller 'docsCtrl', ($scope, $location, $routeParams, $anchorScroll) ->
        # showDocs = (name) ->
        #     _.forEach $scope.documents, (document) -> document.state = undefined
        #     docs = $scope.documents[name]
        #     docs.state = 'active'
        #     $scope.current_documents = docs

        $scope.init = ->
            $scope.documents = [
                'Start'
                'Configuration'
                'GraphJSON'
                'GraphStyling'
                'Examples'
                'Contributing'
                'API'

            ]

                # 'Start':
                #     name: 'Start'
                #     src: 'views/html/app/views/docs/_documentation/start.html'
                #     desc: "begin to use grunt here"
                # 'Configuration':
                #     name: 'Configuration'
                #     src: 'views/html/app/views/docs/_documentation/Configuration.html'  
                #     desc: "configure this!"
                #     link: 'views/html/app/views/docs/_configDocs/Edges.html'
                # 'GraphJSON':
                #     name: 'GraphJSON'
                #     src: 'views/html/app/views/docs/_documentation/GraphJSON.html'
                #     desc: "graph this!"
                # 'GraphStyling':    
                #     name: 'GraphStyling'
                #     src: 'views/html/app/views/docs/_documentation/GraphStyling.html'
                #     desc: "styling"
                # 'Examples':
                #     name: 'Examples'
                #     src: 'views/html/app/views/docs/_documentation/Examples.html'
                # 'Contributing':
                #     name: 'Contributing'
                #     src: 'views/html/app/views/docs/_documentation/Contributing.html'
                #     desc: 'contribute'
                # 'API':
                #     name: 'API'
                #     src: 'views/html/app/views/docs/_documentation/API.html'
                #     desc: 'API'
            # $scope.orderedDocuments = ['Start', 'Configuration', 
            #                           'GraphJSON','GraphStyling',
            #                           'Examples','Contributing','API'
            #                       ]
            if 'documentsName' of $routeParams
                showDocs($routeParams.documentsName)


        # $scope.showDocs = (name) ->
        #     showDocs(name)

        $scope.getDocPartial = (docName) ->
            # loads all of the markdown partials that have been
            # precompiled into HTML
            "views/docs/#{docName}.html"

        $scope.createToC = (docName) ->
            # since we edit the docs in markdown, headers, subheaders,
            # etc. may change.  For this reason, we use this function to 
            # build the table of contents style side bar on the fly
            section = angular.element("section #{docName}")
            h2 = angular.element(section).find("h2")
            
            sideBarSection = angular.element("#nav-#{docName}")           
            
            if h2.length
                level2headers = angular.element('<div>')
                                        .attr("id", "lvl-2-#{docName}")
                                        .attr("class", "level-2 list-group hidden")
                sideBarSection.append(level2headers)
                for header in h2
                    # debugger
                    title = angular.element('<a>')
                                    .attr('href', "##{header.getAttribute('id')}")
                                    .attr('class', "level-2 list-group-item")
                    level2headers.append(title)

                    # debugger
                    "foo"
            
            href = docName


            for section in $("#sidebar").children()
                href = $(section).children("a.level-1")[0].hash.replace("#", "")
                sectionContent = $("##{href}").children("section, h2, h3, h4, h5")
                if sectionContent.length
                    $(section).append("<div id='lvl-2-#{href}' class='level-2 list-group'>")
                    nextLvl = $("#lvl-2-#{href}")
                    for header in sectionContent
                        id = $(header).prop("id")
                        if (href is "Configuration") or (href is "API")
                            nextLvl.addClass('lvl-2-extended')                    
                            nextLvl.append("<a href='##{id}' class='level-2 list-group-item'>#{id}</a>")
                            nextLvl.append("<div id='lvl-3-#{id}' class='level-3 list-group'></div>")
                            configHeader = $("#lvl-3-#{id}")
                            subSectionContent = $("##{id}").children("h5")
                            for item in subSectionContent
                                ssID = $(item).prop("id")
                                text =  $(item)[0].innerText
                                configHeader.append("<a class='level-3 list-group-item' href='##{ssID}'>#{text}</a>")
                            $(configHeader).find("div.level-3").addClass("hidden")
            
                        else
                            text =  $(header)[0].innerText
                            nextLvl.append("<a class='level-2 list-group-item' href='##{id}'>#{text}</a>")

                        $("#sidebar").find("div.level-2").addClass("hidden")

        $location.hash("href")
        $anchorScroll()
        
    # .controller 'configdocsCtrl', ($scope, $location, $routeParams) ->
    #     showDocs = (name) ->
    #        # _.forEach $scope.documents, (document) -> document.state = undefined
    #         docs = $scope.documents[name]
    #         docs.state = 'active'
    #         $scope.current_documents = docs   

    #     $scope.init = ->    

    #         $scope.documents =
    #             'Edges':
    #                 name: 'Edges'
    #                 src: 'views/html/app/views/docs/_configDocs/Edges.html'
    #                 desc: 'On the edge'
    #                 id: 'Edges'  
    #         if 'documentsName' of $routeParams
    #             showDocs($routeParams.documentsName)        

    #     $scope.showDocs = (name) ->
            # showDocs(name)
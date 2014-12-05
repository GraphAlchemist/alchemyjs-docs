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
        $anchorScroll.yOffset = 50])

    .controller 'docsCtrl', ($anchorScroll,  $location, $scope, $routeParams ) ->
        
 
        $scope.init = ->
            $scope.documents = {
                'Start': {
                    'Philosophy':[],
                    'Quick Start':[],
                    'Next Steps':[],
                },
                'Configuration': { 
                    'Nodes': [],
                    'Edges': [],
                    'Layout': [],
                    'Editing': [],
                    'Filtering': [],
                    'Search': [],
                    'Other': []
                },
                'GraphJSON':{},
                'GraphStyling':{},
                'Examples':{},
                'Contributing':{},
                'API':{
                    'Get':[],
                    'Create':[],
                    'Node-Methods':[],
                    'Edge-Methods':[],
                }
        }

              
            
            # if 'documentsName' of $routeParams
            #     showDocs($routeParams.documentsName)

    
           
        

        $scope.getDocPartial = (docName) ->
            # loads all of the markdown partials that have been
            # precompiled into HTML
            

            "views/docs/#{docName}.html"

        
        
        $scope.tocRan = false            
        $scope.createToC = () ->
            if !$scope.tocRan
                $scope.tocRan = true
                sideBarSection = $("h2,h5")
                docs = $scope.documents

                currentHeader = 'Start'
                currentSubHeader = ''
                _.forEach sideBarSection, (tag)->
                    content = tag.innerHTML
                    if tag.tagName is "H2"
                        if docs[content]?
                            currentHeader = content 
                        if docs[currentHeader][content]?
                            currentSubHeader = content
                    if tag.tagName is "H5"
                        list = docs[currentHeader][currentSubHeader]
                        list.push(content) if list?
                    
                # if tag.innerHTML == docs[tag.innerHTML]
                #     console.log 'yes'
                # else if tag.innerHTML != docs[tag.innerHTML]
                #     console.log 'no'

                # if docs.Start[tag.innerHTML]?
                #     # do it
                # if _.contains( _.keys(docs.Start), tag.innerHTML)
                #     # do it
                
                # if tag.tagName is "H5"
                #     # do something

                # switch tag.tagName
                # when "H5" then # do something
                # when "H2" then # do something else

                # if tag.innerHTML == docs.Start[tag.innerHTML]
                #     # docs.Start.Philosophy.push(tag.innerHTML)
                #     console.log 'done'
                # else if tag.innerHTML == !docs.Start[tag.innerHTML]
                # # else if tag.tagName == 'H5'
                #         console.log '5'
                #     $scope.documents.Start.Philosophy.push(x)
                
                   
                 
            

                
            
            

            

            
            

        



            # since we edit the docs in markdown, headers, subheaders,
            # etc. may change.  For this reason, we use this function to 
            # build the table of contents style side bar on the fly
            #section = angular.element(" ##{docName}")

            #h2 = angular.element(section).find("h2")
            
            #sideBarSection = angular.element("anchor #{docName}")           
            
            # if h2.length
            #     level2headers = angular.element('<div>')
            #                             .attr("id", "lvl-2-#{docName}")
            #                             .attr("class", "level-2 list-group hidden")
            #     sideBarSection.append(level2headers)
            #     for header in h2
                    
            #         title = angular.element('<a>')
            #                         .attr('href', "##{header.getAttribute('id')}")
            #                         .attr('class', "level-2 list-group-item")
            #         level2headers.append(title)

                    
            #         "foo"
            
           # href = docName
            


            # for section in $("#sidebar").children()
            #     href = $(section).children("a.level-1")[0].hash.replace("#", "")
                
            #     sectionContent = $("##{href}").children("section, h2, h3, h4, h5")
            #     if sectionContent.length
            #         $(section).append("<div id='lvl-2-#{href}' class='level-2 list-group'>")
            #         nextLvl = $("#lvl-2-#{href}")
            #         for header in sectionContent
            #             id = $(header).prop("id")
            #             if (href is "Configuration") or (href is "API")
            #                 nextLvl.addClass('lvl-2-extended')                    
            #                 nextLvl.append("<a href='##{id}' class='level-2 list-group-item'>#{id}</a>")
            #                 nextLvl.append("<div id='lvl-3-#{id}' class='level-3 list-group'></div>")
            #                 configHeader = $("#lvl-3-#{id}")
            #                 subSectionContent = $("##{id}").children("h5")
            #                 for item in subSectionContent
            #                     ssID = $(item).prop("id")
            #                     text =  $(item)[0].innerText
            #                     configHeader.append("<a class='level-3 list-group-item' href='##{ssID}'>#{text}</a>")
            #                 $(configHeader).find("div.level-3").addClass("hidden")
            
            #             else
            #                 text =  $(header)[0].innerText
            #                 nextLvl.append("<a class='level-2 list-group-item' href='##{id}'>#{text}</a>")

            #             $("#sidebar").find("div.level-2").addClass("hidden")

        $scope.gotoAnchor = (doc) ->
            old = $location.hash()
            $location.hash(doc)
            $anchorScroll()
            $location.hash(old)



        
    
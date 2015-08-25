# ---------------------------------------------------------
# Service Module: User
#
# This module is injected into controllers to grab the 
# current user object for the frontend controller function
# ---------------------------------------------------------

ServiceFunction = (requestService) ->
    
    # $http request function to grab information
    this.getUser = ->
        sendParams = 
            url: '/current_user.json'
            method: "POST"

        return requestService.service(sendParams)

    this.role = " "

    ###
    this.getAccessLevel = ->
        return this.getUser().then((data)->
            return data
        )

    return this
    ###
    

angular
    .module('dcsupp')
    .service('User', ServiceFunction)
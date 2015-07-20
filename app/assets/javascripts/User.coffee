ServiceFunction = (requestService) ->

    getAccessLevel: ->
        return 'administrator'


angular
.module('dcsupp')
.service('User', ServiceFunction)

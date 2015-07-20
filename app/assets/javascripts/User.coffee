ServiceFunction = (requestService) ->

    getAccessLevel: ->
        return 'student'


angular
.module('dcsupp')
.service('User', ServiceFunction)

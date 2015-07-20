ServiceFunction = ($http) ->

    getAccessLevel: ->
        return 'student'


angular
.module('dcsupp')
.service('User', ServiceFunction)

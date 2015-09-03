# ---------------------------------------------------------
# State: Index
#
# This state has no associated HTML view, it is just the
# landing state when the application is first
# initialized or when the
# application is refreshed/URL is being
# manually entered/user has hit the back button.
# If the application is being
# initialized for the first time,
# then Index state will redirect the app
# to the Intro page. If the application is being
# refreshed//URL is being
# manually entered/user has hit the back button,
# the server will pass back the
# URL to go to reload it
# using the code URL parsing function down below.
# ---------------------------------------------------------
angular.module('dcsupp').controller 'IndexCtrl', [
    '$stateParams'
    '$scope'
    '$state'
    ($stateParams, $scope, $state) ->
        #   If application is being initialized: go to intro page
        #   If application is being refreshed//URL is being
        #   manually entered/user has hit the back button: the
        #   server will pass back to URL (stored in stateParams.goto)
        #   to go to in a format such as the following:
        #   "http://localhost:3000/?goto=current_project%2Fproject_info%2F61"
        #   => equivalent to state: "current_project.project_info({id: 61})"
        #   The URL is then parsed (so that UI router can understand it)
        #   and loaded into the view.
        #
        #   The state name in DCSUPP app take the following forms:
        #   1) [ parent state ].[ child state](optional param id)
        #   2) [ state ](optional param id)
        #
        #   So the parse function will parse the URL into both of these
        #   forms and attempt to go into each of these states using
        #   a try/catch block.
        if $stateParams.goto
            path = $stateParams.goto.split('/')

            state = path[0]
            state2 = path[0]
            i = undefined
            i = 1
            while i < path.length
                state = state + '.' + path[i]
                if i != path.length - 1
                    state2 = state
                i++
            try
                $state.go state
            catch err
                try
                    $state.go state2, id: path[path.length - 1]
                catch err2
        else
            $state.go 'intro'
]


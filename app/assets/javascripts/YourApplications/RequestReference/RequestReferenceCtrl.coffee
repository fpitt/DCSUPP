# ---------------------------------------------------------
# Page 3: Request Reference
#
# This is the request reference page for the application for
# students to submit a reference request to a professor.
# ---------------------------------------------------------
controllerFunction = ($scope, $stateParams, Reference, User, $q, $state, ProjectApplication) ->

    #   true iff reference request was successful, to alert error message
    $scope.error = false;

    #   reference request form info
    $scope.reference = {}

    #   create a reference request
    $scope.createReference = () ->
        Reference.create(
            student_text : $scope.student_text
            professor : $scope.professor.id
            application : $stateParams.id).success((data) ->
            #   redirect to new page
            $state.go('your_applications.application_info', {id: $stateParams.id})
            ).error((data) ->
                $scope.error = true
        )

    #   get all professors with names matching keyword "name"
    $scope.getProfessors = (name) ->
        deferred = $q.defer();
        User.getProfessorContainingKeyword(professor: name).success((data) ->
            deferred.resolve(data) )
        return deferred.promise


angular
.module('dcsupp')
.controller('RequestReferenceCtrl', ['$scope', '$stateParams', 'Reference', 'User', 
    '$q', '$state', 'ProjectApplication', controllerFunction])

controllerFunction.$injector = ['$scope', '$stateParams', 'Reference', 'User', 
    '$q', '$state', 'ProjectApplication']
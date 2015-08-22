controllerFunction = ($scope, modalService, $stateParams, Reference, User, $q, $state, ProjectApplication) ->

    $scope.modalService = modalService
    $scope.reference = {}
    $scope.projectId = {}
    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.createReference = () ->
        payload =
            reference : $scope.reference
            professor : $scope.professor
            projectApplication : $stateParams.id

        Reference.create(payload).success((data) ->
            $state.go('your_applications.application_info', {id: $stateParams.id})
            )

    $scope.getProfessors = (name) ->
        payload =
            professor: name

        deferred = $q.defer();
        User.getProfessorByName(payload).success((data) ->
            deferred.resolve(data) )
        return deferred.promise


angular
.module('dcsupp')
.controller('RequestReferenceCtrl', ['$scope', 'modalService', '$stateParams', 'Reference', 'User', '$q', '$state', 'ProjectApplication', controllerFunction])

controllerFunction = ($scope, modalService, $stateParams, Reference, User, $q) ->

    $scope.modalService = modalService
    $scope.reference = {}
    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    $scope.createReference = () ->
        payload =
            reference = $scope.reference
        Reference.create(payload).success((data) ->
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
.controller('RequestReferenceCtrl', ['$scope', 'modalService', '$stateParams', 'Reference', 'User', '$q', controllerFunction])

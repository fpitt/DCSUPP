controllerFunction = ($scope, modalService, $stateParams, $state, Reference) ->
    $scope.modalService = modalService

    $scope.professorText = ''

    $scope.writeReference = () ->
        payload =
            id: $stateParams.id
            professorText: $scope.professorText

        Reference.addProfessorText(payload).success((data) ->
            $state.go('your_reference_requests')
        )


angular
.module('dcsupp')
.controller('WriteReferenceCtrl',
    ['$scope', 'modalService', '$stateParams', '$state', 'Reference', controllerFunction])

controllerFunction = ($scope, $stateParams, $state, Reference) ->
    #   professor's letter of reference
    $scope.professorText = ''

    #   add professor's reference to student application
    #   and set the reference request as approved. Note:
    #   student has ability to use/not use the reference letter
    $scope.writeReference = () ->
        Reference.addProfessorText(payload).success((data) ->
            Reference.processReferenceApproval(id: $stateParams.id, approved: true).success((data) ->
                $state.go('your_reference_requests')
            )
        )


angular
.module('dcsupp')
.controller('WriteReferenceCtrl',
    ['$scope', '$stateParams', '$state', 'Reference', controllerFunction])

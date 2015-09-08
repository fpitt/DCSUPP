# -------------------------------------------------------------------------------------------------------
# Page: Write Reference
#
# Summary:
# This is the Write Reference page for DCSUPP for
# professors to write reference letters.
# -------------------------------------------------------------------------------------------------------
controllerFunction = ($scope, $stateParams, $state, Reference, modalService) ->
    $scope.modalService = modalService;

    #   professor's letter of reference
    $scope.professor_text = ''

    #   add professor's reference to student application
    #   and set the reference request as approved. Note:
    #   student has ability to use/not use the reference letter
    $scope.writeReference = () ->
        Reference.addProfessorText(professor_text: $scope.professor_text).success((data) ->
            Reference.processReferenceApproval(reference: $stateParams.id, approved: true).success((data) ->
                $state.go('your_reference_requests')
            )
        )


angular
.module('dcsupp')
.controller('WriteReferenceCtrl',
    ['$scope', '$stateParams', '$state', 'Reference', 'modalService', controllerFunction])

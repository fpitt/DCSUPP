# -------------------------------------------------------------------------------------------------------
# Page: Write Reference
#
# Summary:
# This is the Write Reference page for DCSUPP for
# professors to write reference letters.
# -------------------------------------------------------------------------------------------------------
angular
.module('dcsupp')
.controller 'WriteReferenceCtrl',
    ['$scope', '$stateParams', '$state', 'Reference', 'modalService', 
    ($scope, $stateParams, $state, Reference, modalService) ->

        $scope.modalService = modalService;
        #   true iff something on this page resulted in an error to alert error message
        $scope.error = false

        #   professor's letter of reference
        $scope.professor_text = ''

        #   add professor's reference to student application
        #   and set the reference request as approved. Note:
        #   student has ability to use/not use the reference letter
        $scope.writeReference = () ->
            Reference.addProfessorText(reference: $stateParams.id, professor_text: $scope.professor_text).success((data) ->
                $scope.error = false
                Reference.processReferenceApproval(reference: $stateParams.id, approved: true).success((data) ->
                    $state.go('your_reference_requests')
                )
            ).erorr((data) ->
                $scope.error = true
            )
    ]

ListStudentFunction = ($scope, requestService, RequirementSubcategory, User, $q) ->

    # --- Page Variables --- 
    $scope.direction = 0
    $scope.students = null
    $scope.pagenumber = 1

    # --- Page Navigation ---

    #	filter list of students
    $scope.filterStudents = (tagsChanged, direction) ->
        if tagsChanged
            $scope.pagenumber = 1
            $scope.students = null

        User.filterStudents(
            pagenumber: $scope.pagenumber
            direction: direction
        ).success((data) ->
            if (data)
                $scope.students = data
                if direction > 0
                    $scope.pagenumber += 1
                else if direction < 0
                    $scope.pagenumber -= 1
                else
                    $scope.pagenumber = 1
        )

    #   run this code when controller loads
    $scope.filterStudents(false, 0)


angular
    .module('dcsupp')
    .controller('ListStudentCtrl', ['$scope', 'requestService', 
        'RequirementSubcategory', 'User','$q', ListStudentFunction])
    
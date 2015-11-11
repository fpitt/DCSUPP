ListStudentFunction = ($scope, requestService, RequirementSubcategory, User, $q) ->

    # --- Page Variables ---
    $scope.browse = true;
    $scope.direction = 0
    $scope.students = null
    $scope.pagenumber = 1

    # --- Page Navigation ---

    # Change Browse
    $scope.student_browse = (input) ->
        $scope.browse = input

        if (input == false)
            $("#browse").removeClass("btn-primary").addClass("btn-default")
            $("#filter").addClass("btn-primary").removeClass("btn-default")
        else
            $("#filter").removeClass("btn-primary").addClass("btn-default")
            $("#browse").addClass("btn-primary").removeClass("btn-default")

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
    
ListStudentCtrl.$injector = ['$scope', 'requestService', 
        'RequirementSubcategory', 'User','$q']
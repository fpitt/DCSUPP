ListStudentFunction = ($scope, $modal, modalService, requestService, RequirementSubcategory, User, $q) ->

    $scope.modalService = modalService

    # --- Page Variables --- 

    $scope.direction = 0
    $scope.students = null
    $scope.pagenumber = 1

    #   filter tags
    $scope.requirements = []

    # --- Page Navigation ---

    #	get Project filter tags by keyword
    $scope.loadTags = (query) ->
        deferred = $q.defer();
        RequirementSubcategory.studentAttributeRequirementSubcategoriesWithKeyword(keyword: query)
        .success((data) ->
            tags = data.map((val) ->
                name: val.sub_category_name
                id: val.id)
            deferred.resolve(tags))
        return deferred.promise

    #	filter list of students
    $scope.filterStudents = (tagsChanged, direction) ->
        if tagsChanged
            $scope.pagenumber = 1
            $scope.students = null


        User.filterStudents(
            pagenumber: $scope.pagenumber
            filter: $scope.requirements
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
    .controller('ListStudentCtrl', ['$scope', '$modal', 'modalService', 'requestService', 'RequirementSubcategory', 'User', '$q', ListStudentFunction])
    
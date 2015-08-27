ListStudentFunction = ($scope, $modal, modalService, requestService, RequirementSubcategory) ->
        
    $scope.modalService = modalService
    
    # --- Page Variables --- 

    $scope.direction = 0
    $scope.students = null
    $scope.pagenumber = 1
    $scope.requirements = []
    $scope.subcategories = []


    $scope.items = [
        'item1'
        'item2'
        'item3'
    ]

    # --- Page Navigation ---

    $scope.flip = (pushDirection) ->
        payload = 
            direction: pushDirection
            pagenumber: $scope.pagenumber
        sendParams =
            method: 'POST'
            url: '/students.json'
        $scope.direction = pushDirection

        requestService.service(sendParams, payload).success(flipSuccess)

    flipSuccess = (data) ->
        if (data)
            $scope.students = data
            console.log($scope.students)
            if $scope.direction > 0
                $scope.pagenumber += 1
            else if $scope.direction < 0
                $scope.pagenumber -= 1
            else
                $scope.pagenumber = 1

    $scope.loadSubcategories = () ->
        RequirementSubcategory.getAll().success((data) ->
            for item in data
                $scope.subcategories.push({name: item.sub_category_name, id: item.id})
        )

    $scope.loadTags = () ->
        return $scope.subcategories




    # --- JQuery Initialization Code --- 
    $('[data-toggle="tooltip"]').tooltip()
    $scope.flip(0)
    $scope.loadSubcategories()

angular
    .module('dcsupp')
    .controller('ListStudentCtrl', ['$scope', '$modal', 'modalService', 'requestService', 'RequirementSubcategory', ListStudentFunction])
    
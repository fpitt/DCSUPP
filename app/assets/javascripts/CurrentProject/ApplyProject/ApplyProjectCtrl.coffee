controllerFunction = ($scope, modalService, $stateParams, $state, ProjectApplication, ProjectRequirement, RequirementSubcategory) ->

    $scope.modalService = modalService

    $scope.application = {}
    $scope.attributes = []
    $scope.requirements = []

    $scope.createApplication = () ->
        payload =
            application:
                $scope.application
            project:
                $stateParams.id

        ProjectApplication.create(payload).success((data) ->
            $state.go('your_applications.application_info', {id: data.id}))

        return


    $scope.loadRequirements = () ->
        payload =
            project: $stateParams.id
        ProjectRequirement.getByProject(payload).success((data) ->
            for i in [0 .. data.length - 1]
                RequirementSubcategory.getById(data[i].requirement_subcategory_id).success((result) ->
                    $scope.requirements.push({id: result.id, attribute_type: result.attribute_type, sub_category_name: result.sub_category_name})
                )
        )


    $scope.loadRequirements()





angular
.module('dcsupp')
.controller('ApplyProjectCtrl', ['$scope', 'modalService', '$stateParams', '$state', 'ProjectApplication', 'ProjectRequirement', 'RequirementSubcategory', controllerFunction])

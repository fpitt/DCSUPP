# ---------------------------------------------------------
# Page: Selected Student Page
#
# This is the selected student page for the DCSUPP.
# It displays information about a student.
# ---------------------------------------------------------

controllerFunction = ($scope, requestService, $stateParams, StudentAttribute, RequirementSubcategory, User) ->
    #   get the current student
    $scope.getUser = ->
        User.getById($stateParams.id).success((data) ->
            $scope.user = data
        )

    #   get this student's student attributes
    $scope.getStudentAttributes = ->
        #   get student attributes
        $scope.attributes = []
        StudentAttribute.getStudentAttributesOfStudent(student: $stateParams.id).success((data) ->
            async.each(data, (attr, callback) ->
                RequirementSubcategory.getById(attr.requirement_subcategory_id)
                .success((subcategory) ->
                    $scope.attributes.push(
                        attribute_type: subcategory.attribute_type
                        sub_category_name: subcategory.sub_category_name
                        value: attr.value)
                    callback()
                )
            )
        )

    $scope.getUser();
    $scope.getStudentAttributes();


angular
.module('dcsupp')
.controller('SelectedStudentCtrl', ['$scope', 'requestService', '$stateParams', 'StudentAttribute',
                                    'RequirementSubcategory', 'User', controllerFunction])

SelectedStudentCtrl.$injector = ['$scope', 'requestService', '$stateParams', 'StudentAttribute',
                                    'RequirementSubcategory', 'User']

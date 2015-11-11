# -------------------------------------------------------------------------------------------------------
# Page: Apply Project Page
#
# Summary:
# This is the Apply Project page for DCSUPP. It allows students
# to submit applications for projects.
#
# Page Placement [Referred to in the Comments]:
#
# [Top-right]
# Popup button, displays the Information and Settings Popup menus.
# -------------------------------------------------------------------------------------------------------

controllerFunction = ($scope, modalService, $stateParams, $state, ProjectApplication,
                      ProjectRequirement, RequirementSubcategory, StudentAttribute, Upload) ->

    #   true iff adding application resulted in error, to signal alert pop-up
    $scope.error = false
    #	pop-up service for page settings + information
    $scope.modalService = modalService
    #   application form info
    $scope.application = {}
    #   application project requirements
    $scope.application.requirements = []

    #   create a new project application
    $scope.createApplication = () ->
        async.waterfall([
                #   create project application
                (callback) ->
                    $scope.application.project = $stateParams.id
                    ProjectApplication.create($scope.application).success((data) ->
                        callback(null, data)
                    )
                #   upload resume
                (data, callback) ->
                    ProjectApplication.uploadResume(file: $scope.resume, application: data.id).success((data) ->
                        callback(null, data)
                    )
            ],
            #   redirect to new page once waterfall tasks complete
            (err, data) ->
                if err
                    $scope.error = true
                else
                    $scope.error = false
                    $state.go('your_applications.application_info', {id: data.id})
        )
        return

    #   load the project's requirements that are student attributes for the form fields
    $scope.getStudentAttributes = () ->
        # get student attribute requirements
        RequirementSubcategory.getStudentAttributeSubcategoriesOfProject(project: $stateParams.id).success((data) ->
            async.each(data, (req, callback) ->
                # check if student has already filled in this attribute, and if so, get
                # the students attribute value
                StudentAttribute.getBySubcategoryAndCurrentUser(subcategory: req.id).success((data) ->
                    attr =
                        id: req.id,
                        attribute_type: req.attribute_type,
                        sub_category_name: req.sub_category_name
                    if data.id
                        if req.attribute_type == 'Number'
                            attr.value = parseInt(data.value)
                        else if req.attribute_type == 'Date'
                            attr.value = new Date(data.value)
                        else
                            attr.value = data.value
                    $scope.application.requirements.push(attr)
                    callback()
                )
            , (err) ->
            )
        )

    #   run this code when page loads
    $scope.getStudentAttributes()


angular
.module('dcsupp')
.controller('ApplyProjectCtrl',
    ['$scope', 'modalService', '$stateParams', '$state', 'ProjectApplication', 'ProjectRequirement',
     'RequirementSubcategory', 'StudentAttribute', 'Upload', controllerFunction])

controllerFunction.$injector = ['$scope', 'modalService', '$stateParams', '$state', 
    'ProjectApplication', 'ProjectRequirement', 'RequirementSubcategory', 'StudentAttribute', 'Upload' ]

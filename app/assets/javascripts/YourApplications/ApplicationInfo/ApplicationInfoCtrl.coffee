# -------------------------------------------------------------------------------------------------------
# Page: Application Info Page
#
# Summary:
# This is the application info page for DCSUPP for students
# to view their application for a particular project.
# -------------------------------------------------------------------------------------------------------
controllerFunction = ($scope, $stateParams, ProjectApplication, ProjectRequirement, RequirementSubcategory, StudentAttribute, Project, Reference, User) ->

    #   get the application's information
    $scope.getApplicationInfo = ->
        ProjectApplication.getById($stateParams.id).success((data) ->
            $scope.application = data

            #   get the project info
            Project.getById(data.project_id).success((data) ->
                $scope.project = data
            )

            #   get student info
            User.getById($scope.application.user_id).success((data) ->
                $scope.application.student = data
            )

            #   get student attributes
            $scope.attributes = []
            RequirementSubcategory.getStudentAttributeSubcategoriesOfProject(project: $scope.application.project_id).success((data) ->
                async.each(data, (req, callback) ->
                    StudentAttribute.getBySubcategoryAndCurrentUser(subcategory: req.id).success((attr) ->
                        $scope.attributes.push(
                            attribute_type: req.attribute_type
                            sub_category_name:req.sub_category_name
                            value: attr.value)
                        callback()
                    )
                )
            )

            $scope.determineStatus()
        )

    #   get all reference requests that this student
    #   has requested for the application
    $scope.getAllReferences = () ->
        Reference.getByProjectApplication(application: $stateParams.id).success((data) ->
            $scope.allReferences = data
            #   get professor info
            async.each($scope.allReferences, (reference, callback) ->
                User.getById(reference.user_id).success((data) ->
                    reference.professor = data;
                )
            )
        )

    #   save student's approval/rejection of position offer
    $scope.processOffer = (approved) ->
        ProjectApplication.processOffer(approved: approved,
            application: $scope.application.id).success((data) ->
            #   reload application info
            $scope.getApplicationInfo()
        )

    #   save student's decision to use reference letter
    $scope.processReferenceApproval = (reference, val) ->
        Reference.processReferenceApproval(reference: reference.id, approved: val).success((data) ->
            #   reload reference requests
            $scope.getAllReferences()
        )

    #   get reference letter that the student has decided to use
    #   this function is run if the current user is a professor and
    #   (used in the Application Info
    #   page in "YourProjects")
    $scope.getStudentApprovedReferences = () ->
        Reference.getStudentApprovedByProjectApplication(application : $stateParams.id).success((data) ->
            $scope.studentApprovedReferences = data
            #   get professor info
            async.each($scope.studentApprovedReferences, (reference, callback) ->
                User.getById(reference.user_id).success((data) ->
                    reference.professor = data;
                )
            )
        )

    #   determine the application status
    $scope.determineStatus = () ->
        if $scope.application.professor_approved == null
            $scope.status = "Awaiting professor's response."
        else if $scope.application.professor_approved == true && $scope.application.student_approved == null
            $scope.status = "Awaiting student's response."
        else if $scope.application.professor_approved == false
            $scope.status = "Application has rejected by the professor."
        else if $scope.application.student_approved == false
            $scope.status = "Application has been rejected by the student."
        else if $scope.application.student_approved == true && $scope.administrator_approved == null
            $scope.status = "Student has accepted offer, awaiting administrator's approval."
        else if $scope.adminstrator_approved == false
            $scope.status = "Administrator has rejected this project assignment."
        else
            $scope.status = "Administrator has approved this project assignment."

    #   run this code when page loads
    $scope.getApplicationInfo()
    $scope.getAllReferences()
    $scope.getStudentApprovedReferences()


angular
.module('dcsupp')
.controller('ApplicationInfoCtrl', ['$scope', '$stateParams', 'ProjectApplication', 
    'ProjectRequirement', 'RequirementSubcategory', 'StudentAttribute', 'Project', 
    'Reference', 'User', controllerFunction])

ApplicationInfoCtrl.$injector = ['$scope', '$stateParams', 'ProjectApplication', 
    'ProjectRequirement', 'RequirementSubcategory', 'StudentAttribute', 'Project', 
    'Reference', 'User']
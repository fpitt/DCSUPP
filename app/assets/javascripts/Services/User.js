var ServiceFunction;

ServiceFunction = function(requestService) {
    this.getUser = function() {
        var sendParams;
        sendParams = {
            url: '/current_user.json',
            method: "POST"
        };

        return requestService.service(sendParams);
    };

    this.role = " ";

    this.getAccessLevel = function() {
        return this.getUser().then(function (data) {
            return data;
        });
    };

    this.getById = function(id) {
        var sendParams = {
            url: '/users/' + id + '.json',
            method: "GET"
        };
        return requestService.service(sendParams);
    };

    this.flipProfessors = function(payload) {
        var sendParams = {
            url: '/flip_professor_direction.json',
            method: 'POST'
        };
        return requestService.service(sendParams, payload);
    };

    this.getStudents = function() {
    };

    this.getProfessorByName = function(payload) {
        var sendParams = {
            url: '/get_professor_by_name.json',
            method: 'POST'
        };

        return requestService.service(sendParams, payload);
    };

    return this;

};

angular.module('dcsupp').service('User', ServiceFunction);
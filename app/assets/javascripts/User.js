var ServiceFunction;

ServiceFunction = function(requestService) {
    this.getUser = function() {
        var sendParams;
        sendParams = {
            url: '/current_user.json',
            method: "GET"
        };

        return requestService.service(sendParams);
    };

    this.role = " ";

    return this;

};

angular.module('dcsupp').service('User', ServiceFunction);

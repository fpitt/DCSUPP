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

    return this;

};

angular.module('dcsupp').service('User', ServiceFunction);

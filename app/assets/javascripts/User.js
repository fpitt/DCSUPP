var ServiceFunction;

ServiceFunction = function(requestService) {
    return {
        getUser: function() {
            var sendParams;
            sendParams = {
                url: '/current_user.json',
                method: "GET"
            };

            return requestService.service(sendParams);
        },

        getAccessLevel: function() {
            return 'administrator';
        }
    };
};

angular.module('dcsupp').service('User', ServiceFunction);

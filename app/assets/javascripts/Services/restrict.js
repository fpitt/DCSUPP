//  Directive: restrict
//  Restricts unauthorized users from viewing
//  HTML elements.

// E.g. button access="administrator student" restrict="" Apply
// The button above can only be seen by admins and students

angular.module('dcsupp').directive('restrict', function(User, $q){
    return{
        restrict: 'A',
        prioriry: 100000,
        scope: false,
        link: function(){
            // alert('ergo sum!');
        },
        compile:  function(element, attr, linker){

            deferred = $q.defer()
            User.getUser().success(function (data) {

                    if (!data.professor && !data.administrator){
                        var role = 'student';
                    } else if (data.administrator) {
                        var role = 'administrator';
                    } else if (data.professor) {
                        var role = 'professor';
                    };

                    var accessDenied = true;
                    var attributes = attr.access.split(" ");
                    for(var i in attributes){
                        if(role == attributes[i]){
                            accessDenied = false;
                        };
                    };

                    if(accessDenied){
                        element.children().remove();
                        element.remove();
                    };

                    deferred.resolve();
                }
            );

            return deferred.promise;
        }
    };
});
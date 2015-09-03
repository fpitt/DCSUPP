//  Directive: restrict
//  Restricts unauthorized users from viewing
//  HTML elements.

// E.g. button access="administrator student" restrict="" Apply
// The button above can only be seen by admins and students

angular.module('dcsupp').directive('restrict', function(User){
    return{
        restrict: 'A',
        prioriry: 100000,
        scope: false,
        link: function(){
            // alert('ergo sum!');
        },
        compile:  function(element, attr, linker){
            var accessDenied = true;
            var attributes = attr.access.split(" ");
            for(var i in attributes){
                if(User.role == attributes[i]){
                    accessDenied = false;
                };
            };


            if(accessDenied){
                element.children().remove();
                element.remove();
            };
        }
    };
});
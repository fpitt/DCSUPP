#I think this file has no use, I will comment it out and leave it here


###
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
###
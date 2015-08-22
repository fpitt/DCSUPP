# ---------------------------------------------------------
# Directive: Restrict
#
# I think this directive is not used at the moment. I will
# comment this directive out
# ---------------------------------------------------------

###
restrictDirective = (User) ->
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
    }

angular.module('dcsupp').directive('restrict', restrictDirective)
###
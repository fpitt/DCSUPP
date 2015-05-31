
  var pageNumber = 1;

  function subcategories(category_id){

    var request = {
      category_id: category_id
    }

    $.ajax({
        url: '/get_subcategories',
        type: "post",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        dataType: "html",
        success: function(data) {

            $("#posts3").html(data)

        },
        data: request
    })

  }

  function flip(direction){

    var request = {
      pageNumber: pageNumber,
      direction: direction
    }

    $.ajax({
        url: '/flip_direction',
        type: "post",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        dataType: "html",
        success: function(data) {

          if (data) {

            $("#itemPosts3").html(data);

            if (direction > 0){
                pageNumber += 1
            } else if (direction < 0 && pageNumber > 1){
                pageNumber -= 1
            }

            $("#pagenumber2").text(pageNumber);
          }
          categoryClick()

        },
        data: request
    })

  }

  function categoryClick(){
    $(".a_mail").unbind("click")

    $(".a_mail").click(function(){

        $("#CategoryType").text($(this).text());
        $("#requirement_subcategories_category").val($(this).attr("data-id"));

        //Remove the warning tag
        $("#submit_tag").removeClass("disabled");
        $("#alert").addClass("hidden_class");
        $(".select_tag").removeClass("select_tag");
        $(this).addClass("select_tag");
        subcategories($(this).attr("data-id"));
        
        if (tabOpen){
          $("#collapse").click();
          tabOpen = false;
        }

    })
  }

  function initialize(){
      //Initialize the object defined in Your Posts
    console.log("Initalize")

    var selectable_values = ["Input Number", "Input Date", "Boolean", "Input Field"];
    var selectable_ID = ["inputNumber", "inputDate", "inputBoolean", "inputfield"];
    var current_ID = "inputNumber";
    var current_ID_hash = "#inputNumber";

    $( "#selectType" ).change(function() {

        $(current_ID_hash).addClass("hidden_class");

        selected = $(this).find('option:selected').text();
        current_ID = selectable_ID[selectable_values.indexOf(selected)];
        current_ID_hash = '#' + current_ID;

        $(current_ID_hash).removeClass("hidden_class");
        $('#requirement_subcategories_input_type').val(current_ID);

    });

    $("#collapse").click(function(){

      if(tabOpen) {
        $("#collapse").text("Show Add New Subcategory")
        tabOpen = false;
      } else {
        $("#collapse").text("Hide Add New Subcategory")
        tabOpen = true;
      }
    })
 }


	function initialize2(){

      initialize()

      categoryClick()

	}

  $(document).ready(initialize2);
  $(document).on('page:load', initialize2);

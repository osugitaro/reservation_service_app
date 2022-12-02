$(document).on("turbolinks:load", function(){
    $(".menu").on("click",function(){
        $(".menu_list").toggleClass("menu_list_on");
    });
});



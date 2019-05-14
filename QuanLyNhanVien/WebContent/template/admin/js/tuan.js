$( "a.btn-delete" ).click(function( event ) {
    event.preventDefault();
    var rel = confirm("Đồng ý xóa?","Thông báo");
    if(rel) {
        window.location= $(this).attr("href");
    }
});
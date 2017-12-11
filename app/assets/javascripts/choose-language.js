$(document).ready(function(){
  $('.choose-language').on('click', function(){
    var id = $(this).attr('id');
    window.location.pathname = 'update'
    window.location = '/change_languages/update?locale=' + id;
  });
  $('.admin-choose-language').on('click', function(){
    var id = $(this).attr('id');
    window.location.pathname = 'update'
    window.location = 'admin/change_languages/update?locale=' + id;
  });
});

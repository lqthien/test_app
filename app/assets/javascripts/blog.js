function viewBlogPost(id) {
  $('#center').html('<img src="/assets/loading.gif"/>')
  $.ajax({
    url: "/blog/show",
    type: "post",
    data: {
      id: id
    }
  });
}

function deleteBlogPost(id) {
  confirm_delete = confirm("Delete this blog post?");
  if(confirm_delete) {
    $('#center').html('<img src="/assets/loading.gif"/>')
    $.ajax({
      url: "/blog/delete",
      type: "post",
      data: {
        id: id
      }
    });
  }
}
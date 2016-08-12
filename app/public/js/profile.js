var streets, currentUser = {};

$.ajax({
  dataType: "json",
  url : "/streets",
  type: "GET",
  data: "JSON",
  success: function(res) {
    //data - response from server
    streets = res;
    streets.forEach(function(street, index) {
      $('#street-list-row').append('<a href="/streets/render/' + street.id + '"> <div class="profile-street-result"> <img src="' + street.img + '" /> <p> <strong>Name:</strong>' + street.name + '</p><br /><p> <strong>Address:</strong>' + street.address + '</p><br /></div></a>')
      console.log(street)
    })
  },
  error: function (data, err) {
    console.log(err);
  }
});

  
$.ajax({
  dataType: "json",
  url:      "/users/current",
  type:     "GET",
  data:     "JSON",
  success: function(res) {
    currentUser = res;
    console.log(res);
    if (currentUser.img) {
      $('#user-image').html('<img class="profile-user-image" src="' + currentUser.img + '" />');
    }
    if (currentUser.fullname) {
      $('#user-fullname').html('<p><strong>My fullname:</strong> ' + currentUser.fullname + '</p>');
    }
    if (currentUser.email) {
      $('#user-email').html('<p><strong>My email:</strong> ' + currentUser.email + '</p>');
    }
    if (currentUser.about) {
      $('#user-about').html('<p><strong>About Me:</strong> ' + currentUser.about + '</p>');
    }
  },
  function (data, err) {
    //err - response object from server
    // console.log(data);
    console.log(err);
  }
});


  



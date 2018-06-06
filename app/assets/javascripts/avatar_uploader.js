
function jsRoar(name) {
  alert('roooooooor' + name);
}



// var formData = new FormData(),
//     $input = $('#avatar');
    
// formData.append('user[avatar]', $input[0].files[0]);

// $.ajax({
//   url: this.model.url(),
//   data: formData,
//   cache: false,
//   contentType: false,
//   processData: false,
//   type: 'PUT'
// });



   function previewFile(){
       var preview = document.querySelector('img'); //selects the query named img
       var file    = document.getElementById('input').files[0];
       var reader  = new FileReader();

       reader.onloadend = function () {
           preview.src = reader.result;

       }

       if (file) {
           reader.readAsDataURL(file); //reads the data as a URL
       } else {
           preview.src = "";
       }
  }

  previewFile();  //calls the function named previewFile()

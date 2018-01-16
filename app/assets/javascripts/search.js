$(function() {
  var options = {
    data: ["a", "b", "c", "d"]
  }
  $('.serachform').easyAutocomplete(options)
});



























// document.addEventListener("turbolinks:load", function() {
//   $input = $("[data-behavior='autocomplete']")
//   debugger
//   var options = {
//     getValue: "name",
//     url: function(phrase) {
//       return "/search.json?q=" + phrase;
//     },
//     categories: [
//       {
//         listLocation: "films",
//         header: "<strong>Movies</strong>",
//       },
//       {
//         listLocation: "post_reviews",
//         header: "<strong>Directors</strong>",
//       }
//     ],
//     list: {
//       onChooseEvent: function() {
//         var url = $input.getSelectedItemData().url
//         $input.val("")
//         Turbolinks.visit(url)
//       }
//     }
//   }

//   $input.easyAutocomplete(options)
// });

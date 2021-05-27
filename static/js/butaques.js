// const container = document.querySelector(".container");
// const seats = document.querySelectorAll(".row .seat:not(.occupied)");
// const count = document.getElementById("count");
// const total = document.getElementById("total");
// const movieSelect = document.getElementById("movie");
//
// populateUI();
//
// //let ticketPrice = +movieSelect.value;
//
// // save selected movie index & price
// function setMovieData(movieIndex, moviePrice) {
//     localStorage.setItem("selectedMovieIndex", movieIndex);
//     localStorage.setItem("selectedMoviePrice", moviePrice);
// }
//
// // Update total and count
// function updateSelectedCount() {
//     const selectedSeats = document.querySelectorAll(".row .seat.selected");
//
//     const seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));
//
//     localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));
//
//     const selectedSeatsCount = selectedSeats.length;
//
//     count.innerText = selectedSeatsCount;
//     //total.innerText = selectedSeatsCount * ticketPrice;
// }
//
// // get data from local storage and populate UI
// function populateUI() {
//     const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));
//
//     if (selectedSeats !== null && selectedSeats.length > 0) {
//         seats.forEach((seat, index) => {
//             if (selectedSeats.indexOf(index) > -1) {
//                 seat.classList.add("selected");
//             }
//         });
//     }
//
//     const selectedMovieIndex = localStorage.getItem("selectedMovieIndex");
//
//     if (selectedMovieIndex !== null) {
//         movieSelect.selectedIndex = selectedMovieIndex;
//     }
// }
//
// // movie select event
// // movieSelect.addEventListener("change", e => {
// //   ticketPrice = +e.target.value;
// //   setMovieData(e.target.selectedIndex, e.target.value);
// //   updateSelectedCount();
// // });
//
// //seat click event
// container.addEventListener("click", e => {
//     if (
//         e.target.classList.contains("seat") &&
//         !e.target.classList.contains("occupied")
//     ) {
//         e.target.classList.toggle("selected");
//
//         updateSelectedCount();
//     }
// });
//
// // initial count and total
//
// updateSelectedCount();

 // $('.seat').on('click', function () {
 //     $(this).toggleClass('selected');
 // });

var numberOfChecked = $('input:checkbox:checked').length;
var totalCheckboxes = $('input:checkbox').length;
var numberNotChecked = totalCheckboxes - numberOfChecked;


// $('input[name="butaca"]').click(function(){
//   data['checked'] = $(this).value();
//
//   $.ajax({
//     url: "{% url 'reservar_butaca' %}",
//     type: 'POST',
//     data: data
//   });
// });

//     var csrfToken = $("input[name='csrfmiddlewaretoken']");
//     var butaca1 = $("#1").val();
//
//     $.ajax({
//         url: '{% url 'post_form_api' %}',
//         type: "POST",
//         dataType: "json",
//         data: {'butaca1': butaca1, 'csrfmiddlewaretoken': csrfToken.val()},
//         cache: false
//     }).done(function (data) {
//         if (data.result === true) {
//             alert(data.message);
//         }
//     });
// });


// function seleccionarButaca(element, butaca) {
//
//     $.ajax({
//       type:'POST',
//       url: "{% url 'reservar_butaca' %}",
//       data:{
//         ocupat: element.checked,
//         id_butaca: butaca,
//         csrfmiddlewaretoken:$('input[name=csrfmiddlewaretoken]').val()
//       },
//       success: function(){
//       }
//     });
// }
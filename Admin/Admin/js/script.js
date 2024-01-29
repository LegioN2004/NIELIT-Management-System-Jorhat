const sidebarToggle = document.querySelectorAll("#sidebar-toggle");
sidebarToggle.addEventListener("click",function(){
    document.querySelector("#sidebar").classList.toggle("collapsed");
});

document.querySelector(".theme-toggle").addEventListener("click",() => {
    toggleLocalStorage();
    toggleRootClass();
});



// My changes

// document.getElementById('teacher-b').onclick = function() {
//     document.getElementById('main-1').style.display = 'none';
// }

document.getElementById('teacher-a').addEventListener('click', function() {
    // Set display: none to the main-1 div
    document.getElementById('main-1').style.display = 'none';
  });
// sidebarToggle.sidebar-item.a.addEventListener("click",function(){
//     document.querySelector("#teacher-a").style.display = 'none';
// });
// id="teacher-li"
// Get a reference to the anchor element with id "a"
var targetEle = document.getElementById('a');

// Attach a click event listener to the anchor element
anchorElement.addEventListener('click', function() {
    // Get references to the elements with class "main-1" and "main-2"
    var main1Element = document.querySelector('.main-1');
    var main2Element = document.querySelector('.main-2');

    // Set the display property for each element
    main1Element.style.display = 'none';
    main2Element.style.display = 'block';
});

const NestedNavContainer=document.getElementById("nested-navigation-container_id")
let TutorialEl =  document.getElementById("Tutorial-btn")
const nestedNavigationCloseBtn = document.getElementById("nested-navigation-close-Btn")

TutorialEl.addEventListener("click", toggleTutorial);
nestedNavigationCloseBtn.addEventListener("click", toggleTutorial);

function toggleTutorial(){
    TutorialEl.classList.toggle("bg-black")
    TutorialEl.classList.toggle("text-white")
    NestedNavContainer.classList.toggle("nested_navigation_hidden")
}

var websitesBtn = document.getElementById('websites-btn');


websitesBtn.addEventListener('click', function(event) {
   event.preventDefault();

    window.location.href = "websites.html";
});

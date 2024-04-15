const NestedNavContainer = document.getElementById("nested-navigation-container_id");
let TutorialEl = document.getElementById("Tutorial-btn");
let websitesBtn = document.getElementById('websites-btn');

TutorialEl.addEventListener("click", () => {
    TutorialEl.classList.toggle("bg-black");
    TutorialEl.classList.toggle("text-white");
    NestedNavContainer.classList.toggle("nested_navigation_hidden");
});

TutorialEl.addEventListener('click', redirectToLogin);
websitesBtn.addEventListener('click', redirectToLogin);


function redirectToLogin(event) {
    event.preventDefault();
    window.location.href = "login.html"; 
}

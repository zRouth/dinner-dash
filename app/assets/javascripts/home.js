function showElement(element) {
    element.hidden = false;
};

function hideElement(element) {
    element.hidden = true;
};

function doesNotHave(search) {
    return function(element) {
        content = element.getAttribute("categories") + element.innerText;
        return !content.match(new RegExp(search, "gi"));
    };
};

function fuzzy(search) {
    var menuItems = [].slice.call(document.getElementsByClassName("menu-item"));
    menuItems.forEach(showElement);
    if (search.trim() === "") return;
    menuItems.filter(doesNotHave(search)).forEach(hideElement);
};

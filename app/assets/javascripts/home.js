function showElement(element) {
    element.hidden = false;
};

function hideElement(element) {
    element.hidden = true;
};

function doesNotHave(search) {
    return function(element) {
        var title = [].slice.call(element.children).filter(function(e){return e.classList.toString().match(/menu-item-title/);})[0].innerText;
        var content = element.getAttribute("categories") + title;
        return !content.match(new RegExp(search, "gi"));
    };
};

function fuzzy(search) {
    var menuItems = [].slice.call(document.getElementsByClassName("menu-item"));
    menuItems.forEach(showElement);
    if (search.trim() === "") return;
    menuItems.filter(doesNotHave(search)).forEach(hideElement);
};

function atLeastOne(form) {
    if (form.menu_item_amount.value <= 0)
        form.menu_item_amount.value = 1;
}

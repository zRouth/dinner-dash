# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

showElement = (element) -> element.hidden = false
hideElement = (element) -> element.hidden = true

doesNotHave = (search) -> (element) -> !element.getAttribute("categories").match(new RegExp(search,"gi"))

@fuzzy = (search) ->
  menuItems = [].slice.call(document.getElementsByClassName("menu-item"))
  menuItems.forEach(showElement)
  return if search.trim() == ""
  menuItems.filter(doesNotHave(search)).forEach(hideElement)

#
# showElement = (element) -> element.hidden = false
# hideElement = (element) -> element.hidden = true
#
# doesNotHave = (search) -> (element) -> !element.getAttribute("categories").match(new RegExp(search,"gi"))
#
# @fuzzy = (search) ->
#   menuItems = [].slice.call(document.getElementsByClassName("menu-item"))
#   menuItems.forEach(showElement)
#   return if search.trim() == ""
#   menuItems.filter(doesNotHave(search)).forEach(hideElement)

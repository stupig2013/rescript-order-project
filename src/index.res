open Type

let step = ref(1)

let state: stateType = {
  meal: "",
  people: "1",
  restaurant: "",
  servings: []
}

let renderStep = (_step: int, back: bool) => {
  step := _step
  Dom2.setClassName("content", `content step${Belt.Int.toString(step.contents)}`)

  if !back {
    if _step == 1 {
      let meals = Data.getMeals()
      if state.meal == "" {
        state.meal = meals[0]
      }
      Dom2.fillOptions("select_meal", meals)
      Dom2.fillInput("people_number", state.people)  
    } else if _step == 2 {
      let restaurants = Data.getRestaurants(~meal=state.meal)
      Dom2.fillOptions("select_restaurant", restaurants)
    } else if _step == 3 {
      let dishes = Data.getDishes(~meal=state.meal, ~restaurant=state.restaurant)
      Dom2.setInnerHTML("servings", Dish.genDishFormOuterHtml(dishes))
      Js.log(dishes)
    } else {
      Dom2.setInnerHTML("preview_meal", state.meal)
      Dom2.setInnerHTML("preview_people", state.people)
      Dom2.setInnerHTML("preview_restaurant", state.restaurant)
      Dom2.setInnerHTML("preview_dishes", Dish.genDishPreviewOuterHtml(state.servings))
    }
  }
}

let handlePrevious = (e: Dom.event) => {
  renderStep(step.contents - 1, true)
}

let handleNext = (e: Dom.event) => {
  let error = ref(false)

  if step.contents == 1 {
    state.meal = Dom2.getValue("select_meal")
    state.people = Dom2.getValue("people_number")
  } else if step.contents == 2 {
    state.restaurant = Dom2.getValue("select_restaurant")
  } else if step.contents == 3 {
    let items = Dish.getDishItems()
    state.servings = items
  }

  Js.log(state)
  renderStep(step.contents + 1, false)
}

let handleAddDish = (e: Dom.event) => {
  let dishes = Data.getDishes(~meal=state.meal, ~restaurant=state.restaurant)
  let node = Dish.genDishFormNode(dishes)
  Dom2.appendChild("servings", node)
}

let init = () => {
  Dom2.addEventListener("btn_previous", "click", handlePrevious)
  Dom2.addEventListener("btn_next", "click", handleNext)
  Dom2.addEventListener("add_dish", "click", handleAddDish)
}

let main = () => {
  init()
  renderStep(step.contents, false)
}

main()
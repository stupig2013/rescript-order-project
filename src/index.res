


let step = ref(1)

type stateType = {
  mutable meal: string,
  mutable people: string,
  mutable restaurant: string
}

let state: stateType = {
  meal: "",
  people: "1",
  restaurant: ""
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

      Js.log(state)
    } else if _step == 2 {
      let restaurants = Data.getRestaurants(~meal=state.meal)
      Dom2.fillOptions("select_restaurant", restaurants)
    }
  }
}

let handlePrevious = (e: Dom.event) => {
  renderStep(step.contents - 1, true)
}

let handleNext = (e: Dom.event) => {
  if step.contents == 1 {
    state.meal = Dom2.getValue("select_meal")
    state.people = Dom2.getValue("people_number")
  } else if step.contents == 2 {
    state.restaurant = Dom2.getValue("select_restaurant")
  }

  Js.log(state)
  renderStep(step.contents + 1, false)
}

let init = () => {
  Dom2.addEventListener("btn_previous", "click", handlePrevious)
  Dom2.addEventListener("btn_next", "click", handleNext)
  
}

let main = () => {
  init()
  renderStep(step.contents, false)
}


main()
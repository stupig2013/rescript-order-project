


let step = ref(1)

type stateType = {
  mutable meal: string,
  mutable people: int,
  mutable restaurant: string
}

let state: stateType = {
  meal: "",
  people: 1,
  restaurant: ""
}

let renderStep = (step: int) => {
  if step == 1 {
    let meals = Data.getMeals()
    Js.log(meals)
    Dom2.fillOptions("select_meal", meals)
    Dom2.fillInput("people_number", Belt.Int.toString(state.people))
  }
}

let main = () => {
  renderStep(step.contents)
}


main()
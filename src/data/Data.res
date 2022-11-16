type dishType = {
  id: int,
  name: string,
  restaurant: string,
  availableMeals: array<string>
}

// type restaurantType = {
//   name: string,
//   dishes: array<dishType>
// }

// type mealType = {
//   name: string,
//   restaurants: array<restaurantType>
// }

type dishDataType = {
  dishes: array<dishType>
}

@module external dishData: dishDataType = "./data.json"

let {dishes} = dishData

let getMeals = () => {
  let meals: array<string> = []

  for i in 0 to Belt.Array.length(dishes) - 1 {
    let dish = dishes[i]

    for j in 0 to Belt.Array.length(dish.availableMeals) - 1 {
      let meal = dish.availableMeals[j]
      
      if Js.Array2.includes(meals, meal) == false {
        let _:int  = Js.Array2.push(meals, meal)
      }
    }
  }
  meals
}

let getRestaurants = (~meal) => {
  let restaurants: array<string> = []

  for i in 0 to Belt.Array.length(dishes) - 1 {
    let dish = dishes[i]

    if Js.Array2.includes(dish.availableMeals, meal) && !Js.Array2.includes(restaurants, dish.restaurant) {
      let _ = Js.Array2.push(restaurants, dish.restaurant)
    }
  }

  restaurants
}

let getDishes = (~meal, ~restaurant) => {
  let filteredDishes: array<dishType> = []

   for i in 0 to Belt.Array.length(dishes) - 1 {
    let dish = dishes[i]

    if Js.Array2.includes(dish.availableMeals, meal) && dish.restaurant == restaurant && !Js.Array2.includes(filteredDishes, dish) {
      let _ = Js.Array2.push(filteredDishes, dish)
    }
   }

   filteredDishes
}
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
  

  // let meals: array<mealType> = []

  // for i in 0 to Belt.Array.length(dishes) {
  //   let dish = dishes[i]
    
  //   for j in 0 to Belt.Array.length(dish.availableMeals) {
  //     let meal = dish.availableMeals[j]

  //   }
  // }

  // switch meal {
  //   | None => dishes
  //   | Some(r_) => dishes
  // } 

  dishes
}
type servingType = {
  dish: string,
  number: string
}

type stateType = {
  mutable meal: string,
  mutable people: string,
  mutable restaurant: string,
  mutable servings: array<servingType>
}
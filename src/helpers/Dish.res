open Webapi.Dom
open Belt.Option
open Type

let genDishFormInnerHtml = (dishes: array<Data.dishType>) => {
  let dishesStrList = Js.Array2.map(dishes, dish => `
    <option value="${dish.name}">${dish.name}</option>
  `)

  `
    <label>Please Select a Dish</label>
    <select>${Js.Array.joinWith("", dishesStrList)}</select>
    <label>Please enter no. of servings</label>
    <input type="number" id="people_number" />
  `
}

let genDishFormNode = (dishes: array<Data.dishType>) => {
  let node = Dom2.createElementByInnerHTML("li", genDishFormInnerHtml(dishes))
  node
}

let genDishFormOuterHtml = (dishes: array<Data.dishType>) => {
  `<li>${genDishFormInnerHtml(dishes)}</li>`
}

let getDishItems = () => {
  let items: array<servingType> = []
  let nodes = Dom2.getChildrenByTagName("servings", "li")

  for i in 0 to HtmlCollection.length(nodes) - 1 {
    let node = HtmlCollection.item(nodes, i) -> getExn
    let select = Dom2.getHtmlFormElementsByTagName(node, "select")[0]
    let input = Dom2.getHtmlFormElementsByTagName(node, "input")[0]

    let _ = Js.Array2.push(items, {
      dish: HtmlInputElement.value(select),
      number: HtmlInputElement.value(input),
    })
  }

  items
}

let genDishPreviewOuterHtml = (servings: array<servingType>) => {
  let list = Js.Array2.map(servings, serving => {
    `<li>${serving.dish} - ${serving.number}</li>`
  })
  `<ul>${Js.Array.joinWith("", list)}</ul>`
}
// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Data = require("./data/Data.bs.js");
var Dish = require("./helpers/Dish.bs.js");
var Dom2 = require("./dom/Dom2.bs.js");
var Caml_array = require("rescript/lib/js/caml_array.js");

var step = {
  contents: 1
};

var state = {
  meal: "",
  people: "1",
  restaurant: "",
  servings: []
};

function renderStep(_step, back) {
  step.contents = _step;
  Dom2.setClassName("content", "content step" + String(step.contents) + "");
  if (back) {
    return ;
  }
  if (_step === 1) {
    var meals = Data.getMeals(undefined);
    if (state.meal === "") {
      state.meal = Caml_array.get(meals, 0);
    }
    Dom2.fillOptions("select_meal", meals);
    return Dom2.fillInput("people_number", state.people);
  }
  if (_step === 2) {
    var restaurants = Data.getRestaurants(state.meal);
    return Dom2.fillOptions("select_restaurant", restaurants);
  }
  if (_step === 3) {
    var dishes = Data.getDishes(state.meal, state.restaurant);
    Dom2.setInnerHTML("servings", Dish.genDishFormOuterHtml(dishes));
    console.log(dishes);
    return ;
  }
  Dom2.setInnerHTML("preview_meal", state.meal);
  Dom2.setInnerHTML("preview_people", state.people);
  Dom2.setInnerHTML("preview_restaurant", state.restaurant);
  Dom2.setInnerHTML("preview_dishes", Dish.genDishPreviewOuterHtml(state.servings));
}

function handlePrevious(e) {
  renderStep(step.contents - 1 | 0, true);
}

function handleNext(e) {
  if (step.contents === 1) {
    state.meal = Dom2.getValue("select_meal");
    state.people = Dom2.getValue("people_number");
  } else if (step.contents === 2) {
    state.restaurant = Dom2.getValue("select_restaurant");
  } else if (step.contents === 3) {
    var items = Dish.getDishItems(undefined);
    state.servings = items;
  }
  console.log(state);
  renderStep(step.contents + 1 | 0, false);
}

function handleAddDish(e) {
  var dishes = Data.getDishes(state.meal, state.restaurant);
  var node = Dish.genDishFormNode(dishes);
  Dom2.appendChild("servings", node);
}

function init(param) {
  Dom2.addEventListener("btn_previous", "click", handlePrevious);
  Dom2.addEventListener("btn_next", "click", handleNext);
  Dom2.addEventListener("add_dish", "click", handleAddDish);
}

function main(param) {
  init(undefined);
  renderStep(step.contents, false);
}

main(undefined);

exports.step = step;
exports.state = state;
exports.renderStep = renderStep;
exports.handlePrevious = handlePrevious;
exports.handleNext = handleNext;
exports.handleAddDish = handleAddDish;
exports.init = init;
exports.main = main;
/*  Not a pure module */

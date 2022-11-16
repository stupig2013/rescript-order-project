// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Data = require("./data/Data.bs.js");
var Dom2 = require("./dom/Dom2.bs.js");
var Caml_array = require("rescript/lib/js/caml_array.js");

var step = {
  contents: 1
};

var state = {
  meal: "",
  people: "1",
  restaurant: ""
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
    Dom2.fillInput("people_number", state.people);
    console.log(state);
    return ;
  }
  if (_step !== 2) {
    return ;
  }
  var restaurants = Data.getRestaurants(state.meal);
  Dom2.fillOptions("select_restaurant", restaurants);
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
  }
  console.log(state);
  renderStep(step.contents + 1 | 0, false);
}

function init(param) {
  Dom2.addEventListener("btn_previous", "click", handlePrevious);
  Dom2.addEventListener("btn_next", "click", handleNext);
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
exports.init = init;
exports.main = main;
/*  Not a pure module */

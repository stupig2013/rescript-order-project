// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Js_array = require("rescript/lib/js/js_array.js");
var Belt_Option = require("rescript/lib/js/belt_Option.js");
var Caml_option = require("rescript/lib/js/caml_option.js");

function fillOptions(id, list) {
  var wrapper = Belt_Option.getExn(Caml_option.nullable_to_opt(document.getElementById(id)));
  var strList = list.map(function (name) {
        return "<option value=\"" + name + "\">" + name + "</option>";
      });
  wrapper.innerHTML = Js_array.joinWith("", strList);
}

function fillInput(id, value) {
  var element = Belt_Option.getExn(Caml_option.nullable_to_opt(document.getElementById(id)));
  element.setAttribute("value", value);
}

function addEventListener(id, $$event, listener) {
  var element = Belt_Option.getExn(Caml_option.nullable_to_opt(document.getElementById(id)));
  element.addEventListener($$event, listener);
}

function setClassName(id, className) {
  var element = Belt_Option.getExn(Caml_option.nullable_to_opt(document.getElementById(id)));
  element.setAttribute("class", className);
}

function getValue(id) {
  return document.getElementById(id).value;
}

function setValue(id, value) {
  var element = document.getElementById(id);
  element.value = value;
}

exports.fillOptions = fillOptions;
exports.fillInput = fillInput;
exports.addEventListener = addEventListener;
exports.setClassName = setClassName;
exports.getValue = getValue;
exports.setValue = setValue;
/* No side effect */

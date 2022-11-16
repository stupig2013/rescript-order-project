// type document // abstract type for a document object

// type htmlElement = {
//   innerHTML: string
// }

// @val external doc: document = "document"
// @send external getElementById: (document, string) => htmlElement = "getElementById"

open Webapi.Dom
open Belt.Option

let fillOptions = (id: string, list: array<string>) => {
  let wrapper = document -> Document.getElementById(id) -> getExn
  // Js.log(wrapper)

  let strList = Js.Array2.map(list, name => {
    `<option value="${name}">${name}</option>`
  })

  Element.setInnerHTML(wrapper, Js.Array.joinWith("", strList))
 
//   Js.Array2.forEach(list, name => {
//     let node = Document.createElement(document, "option")
//     let text = Document.createTextNode(document, name)
//     Element.setAttribute(node, "value", name)
//     Element.appendChild(node, ~child=text)
//     Element.appendChild(wrapper, ~child=node)
//  })
}

let fillInput = (id: string, value: string) => {
  let element = document -> Document.getElementById(id) -> getExn
  Element.setAttribute(element, "value", value)
}


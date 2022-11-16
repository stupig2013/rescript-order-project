type documentType // abstract type for a document object
@val external doc: documentType = "document"
@send external getHtmlFormElementById: (documentType, string) => Dom.htmlInputElement = "getElementById"

open Webapi.Dom
open Belt.Option

let fillOptions = (id: string, list: array<string>) => {
  let wrapper = document -> Document.getElementById(id) -> getExn
  // Js.log(wrapper)

  // let _list = Js.Array2.slice(list)
  // let _ = Js.Array2.unshift(list, "")
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

let addEventListener = (id: string, event: string, listener: Dom.event => unit) => {
  let element = document -> Document.getElementById(id) -> getExn
  Element.addEventListener(element, event, listener)
}

let setClassName = (id: string, className: string) => {
  let element = document -> Document.getElementById(id) -> getExn
  Element.setAttribute(element, "class", className)
}

let getValue = (id: string) => {
  let element = doc -> getHtmlFormElementById(id)
  HtmlInputElement.value(element)
}

let setValue = (id: string, value: string) => {
  let element = doc -> getHtmlFormElementById(id)
  HtmlInputElement.setValue(element, value)
}


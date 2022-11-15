let getData = () => {
  let a = 1
  a
};

type dish = {
  id: int,
  name: string,
  restaurant: string,
  availableMeals: array<string>
}

let data: array<dish> = [
  {
    id: 1,
    name: "Chicken Burger",
    restaurant: "Mc Donalds",
    availableMeals: ["lunch", "dinner"]
  },
]

type result<'a, 'b> =
  | Ok('a)
  | Error('b)

type myPayload = {data: string}

type myPayloadResults<'errorType> = array<result<myPayload, 'errorType>>

let payloadResults: myPayloadResults<string> = [
  Ok({data: "hi"}),
  Ok({data: "bye"}),
  Error("Something wrong happened!")
]

// @module external data2: array<dish> = "./data.json"
// Js.log(data2);

let ok = Ok({data: "hi"});
Js.log(ok);

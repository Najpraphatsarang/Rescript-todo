@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{"dog"} => <Dog />
  | list{"cat"} => <Cat />
  | list{"cats"} => <Cats />
  | list{"todohome"} => <TodoHome/>
  | list{"person"} => <Person/>
  | _ => <h2> {React.string("404: page not found")} </h2>
  }
}

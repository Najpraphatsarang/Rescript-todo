module FancyInput = {
@react.component
  let make = (~children, ~inputRef: ReactDOM.domRef) =>
    <div> <input type_="text" ref=inputRef /> children </div>
}
@send external focus: Dom.element => unit = "focus"

@react.component
let make = () => {
  // <div>
  //   <h2 className="text-xl"> {React.string("Dog")} </h2>
  //   <img
  //     className="max-w-full mx-auto mt-5"
  //     alt="a dog"
  //     src="https://media.giphy.com/media/4Zo41lhzKt6iZ8xff9/giphy.gif"
  //   />
  // </div>
  let input = React.useRef(Nullable.null)

  let focusInput = () =>
    input.current->Nullable.forEach(input => input->focus)

  let onClick = _ => focusInput()

  <div>
    <FancyInput inputRef={ReactDOM.Ref.domRef(input)}>
      <button onClick> {React.string("Click to focus")} </button>
    </FancyInput>
  </div>
}
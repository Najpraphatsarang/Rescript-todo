@react.component
let make = () => {
  <div>
    <h2 className="text-xl"> {React.string("Cat")} </h2>
    <img
      className="max-w-sm mx-auto mt-5"
      alt="a cat"
      src="https://media.giphy.com/media/7YCA4XbA0ArQuWEfqJ/giphy.gif"
    />
  </div>
}
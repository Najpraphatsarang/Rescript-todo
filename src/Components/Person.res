@react.component
let make = () => {
  let (userName, setUserName) = React.useState(_ => "")
  let (userAge, setUserAge) = React.useState(_ => 0)

  let handleNameChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setUserName(_ => value)
  }

  let handleAgeChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    switch (Belt.Int.fromString(value)) {
    | None => ()
    | Some(age) => setUserAge(_ => age)
    }
  }

  <div>
    <label>
      {React.string("Name: ")}
      <input
        type_="text"
        value={userName}
        onChange={handleNameChange}
      />
    </label>
    <br />
    <label>
      {React.string("Age: ")}
      <input
        type_="number"
        value={string_of_int(userAge)}
        onChange={handleAgeChange}
      />
    </label>
    <UserProfile name={userName} age={userAge} />
  </div>
}

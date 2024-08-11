// TodoForm.res
@react.component
let make = (~onAdd) => {
  let (text, setText) = React.useState(_ => "")
  let (detail, setDetail) = React.useState(_ => "")
  let (date, setDate) = React.useState(_ => "")
  let (time, setTime) = React.useState(_ => "")

  let handleAddClick = _ => {
    if (text !== "" && detail !== "") {
      onAdd(text, detail, date, time)
      setText(_ => "")
      setDetail(_ => "")
      setDate(_ => "")
      setTime(_ => "")
    }
  }

  <div>
    <label>{React.string("Name: ")}
      <input
        type_="text"
        value={text}
        onChange={event => setText(ReactEvent.Form.target(event)["value"])}
        placeholder="Enter new todo"
      />
    </label>
    <label>{React.string("Detail: ")}
      <input
        type_="text"
        value={detail}
        onChange={event => setDetail(ReactEvent.Form.target(event)["value"])}
        placeholder="Enter todo detail"
      />
    </label>
    <label>{React.string("Date: ")}
      <input
        type_="date"
        value={date}
        onChange={event => setDate(ReactEvent.Form.target(event)["value"])}
      />
    </label>
    <label>{React.string("Time: ")}
      <input
        type_="time"
        value={time}
        onChange={event => setTime(ReactEvent.Form.target(event)["value"])}
      />
    </label>
    <button onClick={handleAddClick} disabled={text === "" || detail === ""}>
      {React.string("Add Todo")}
    </button>
  </div>
}

// App.res
type todo = {
  id: int,
  content: string,
  detail: string,
  completed: bool,
  date: string,
  time: string,
}

type action =
  | AddTodo(string, string, string, string)
  | RemoveTodo(int)
  | ToggleTodo(int)

type state = {
  todos: array<todo>,
  nextId: int,
}

let reducer = (state, action) =>
  switch action {
  | AddTodo(content, detail, date, time) =>
     let newTodo = {id: state.nextId, content: content, detail: detail, completed: false, date: date, time: time}
     let todos = Array.concat(state.todos, [newTodo])
     {todos: todos, nextId: state.nextId + 1}
  | RemoveTodo(id) =>
     let todos = Array.filter(state.todos, todo => todo.id !== id)
     {...state, todos: todos}
  | ToggleTodo(id) =>
     let todos = Belt.Array.map(state.todos, todo =>
       if todo.id === id {
         {
           ...todo,
           completed: !todo.completed,
         }
       } else {
         todo
       }
     )
     {...state, todos: todos}
  }

let initialTodos = [{id: 1, content: "Try ReScript & React", detail: "Learn how to use ReScript with React", completed: false, date: "2024-08-03", time: "10:00"}]

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(
    reducer,
    {todos: initialTodos, nextId: 2},
  )
  let (text, setText) = React.useState(_ => "")
  let (detail, setDetail) = React.useState(_ => "")
  let (date, setDate) = React.useState(_ => "")
  let (time, setTime) = React.useState(_ => "")
  let (searchText, setSearchText) = React.useState(_ => "") // สถานะสำหรับข้อความค้นหา

  let handleInputChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setText(_ => value)
  }

  let handleDetailChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setDetail(_ => value)
  }

  let handleDateChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setDate(_ => value)
  }

  let handleTimeChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setTime(_ => value)
  }

  let handleKeyUp = event => {
    if (event->ReactEvent.Keyboard.key === "Enter" && text !== "" && detail !== "") {
      dispatch(AddTodo(text, detail, date, time))
      setText(_ => "")
      setDetail(_ => "")
      setDate(_ => "")
      setTime(_ => "")
    }
  }

  let handleAddClick = _ => {
    if (text !== "" && detail !== "") {
      dispatch(AddTodo(text, detail, date, time))
      setText(_ => "")
      setDetail(_ => "")
      setDate(_ => "")
      setTime(_ => "")
    }
  }

  let handleSearchChange = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setSearchText(_ => value)
  }

  let filteredTodos = Belt.Array.keep(state.todos, todo =>
    Js.String2.includes(todo.content, searchText) || Js.String2.includes(todo.detail, searchText)
  )

  let todos = Belt.Array.map(filteredTodos, todo =>
    <li key={Int.toString(todo.id)} className="border p-4 mb-4 rounded shadow">
      <div>
        <div className="font-bold">{React.string(todo.content)}</div>
        <div>{React.string(todo.detail)}</div>
        <div>{React.string("Date: " ++ todo.date)}</div>
        <div>{React.string("Time: " ++ todo.time)}</div>
      </div>
      <button className="mt-2 text-red-500" onClick={_ => dispatch(RemoveTodo(todo.id))}>
        {React.string("Remove")}
      </button>
      <input
        type_="checkbox"
        className="ml-2"
        checked=todo.completed
        onChange={_ => dispatch(ToggleTodo(todo.id))}
      />
    </li>
  )

  <div className="container mx-auto p-4">
    <h1 className="text-2xl font-bold mb-4">{React.string("Todo List:")}</h1>
    <div className="mb-4">
      <label className="block mb-2">{React.string("Name: ")}
        <input
          type_="text"
          value={text}
          onChange={handleInputChange}
          onKeyUp={handleKeyUp}
          placeholder="Enter new todo"
          className="border p-2 rounded w-full"
        />
      </label>
      <label className="block mb-2">{React.string("Detail: ")}
        <input
          type_="text"
          value={detail}
          onChange={handleDetailChange}
          onKeyUp={handleKeyUp}
          placeholder="Enter todo detail"
          className="border p-2 rounded w-full"
        />
      </label>
      <label className="block mb-2">{React.string("Date: ")}
        <input
          type_="date"
          value={date}
          onChange={handleDateChange}
          onKeyUp={handleKeyUp}
          className="border p-2 rounded w-full"
        />
      </label>
      <label className="block mb-2">{React.string("Time: ")}
        <input
          type_="time"
          value={time}
          onChange={handleTimeChange}
          onKeyUp={handleKeyUp}
          className="border p-2 rounded w-full"
        />
      </label>
      <button
        onClick={handleAddClick}
        disabled={text === "" || detail === ""}
        className="bg-blue-500 text-white p-2 rounded"
      >
        {React.string("Add Todo")}
      </button>
    </div>
    <div className="mb-4">
      <label className="block mb-2">{React.string("Search: ")}
        <input
          type_="text"
          value={searchText}
          onChange={handleSearchChange}
          placeholder="Search todos"
          className="border p-2 rounded w-full"
        />
      </label>
    </div>
    <ul className="list-none p-0">{React.array(todos)}</ul>
  </div>
}

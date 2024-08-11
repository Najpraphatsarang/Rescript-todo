// TodoList.res
type todo = {
  id: int,
  content: string,
  detail: string,
  completed: bool,
  date: string,
  time: string,
}
@react.component
let make = (~todos, ~onRemove, ~onToggle) => {
  let todoItems = Belt.Array.map(todos, todo =>
    <li key={Int.toString(todo.id)}>
      <div>
        {React.string(todo.content)}
        <div>{React.string(todo.detail)}</div>
        <div>{React.string("Date: " ++ todo.date)}</div>
        <div>{React.string("Time: " ++ todo.time)}</div>
      </div>
      <button onClick={_ => onRemove(todo.id)}>
        {React.string("Remove")}
      </button>
      <input
        type_="checkbox"
        checked=todo.completed
        onChange={_ => onToggle(todo.id)}
      />
    </li>
  )

  <ul>{React.array(todoItems)}</ul>
}

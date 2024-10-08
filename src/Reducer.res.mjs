// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

function reducer(param, action) {
  var nextId = param.nextId;
  var todos = param.todos;
  switch (action.TAG) {
    case "AddTodo" :
        return {
                todos: Belt_Array.concat(todos, [{
                        id: nextId,
                        completed: false,
                        text: action._0
                      }]),
                nextId: nextId + 1 | 0
              };
    case "RemoveTodo" :
        var id = action._0;
        return {
                todos: Belt_Array.keep(todos, (function (todo) {
                        return todo.id !== id;
                      })),
                nextId: nextId
              };
    case "ToggleTodo" :
        var id$1 = action._0;
        return {
                todos: Belt_Array.map(todos, (function (todo) {
                        return {
                                id: todo.id,
                                completed: todo.id === id$1 ? !todo.completed : todo.completed,
                                text: todo.text
                              };
                      })),
                nextId: nextId
              };
    
  }
}

export {
  reducer ,
}
/* No side effect */

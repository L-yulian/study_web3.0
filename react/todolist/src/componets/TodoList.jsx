import { useState } from "react";
import style from "./TodoList.module.css";
function TodoList() {
  let [todos, setTodos] = useState([]);
  let [inputValue, setValue] = useState("");
  let [editValue, setEdit] = useState("");
  let [todoIndex, setIndex] = useState(-1);

  function inputBlur() {
    let _todos = todos;
    _todos[todoIndex].edit = false;
    _todos[todoIndex].name = editValue;
    setTodos([..._todos]);
  }

  function addTodos() {
    let _arr = todos;
    let obj = {
      name: inputValue,
      finished: false,
      edit: false,
    };
    _arr.push(obj);

    setTodos([..._arr]);
  }

  function finishTodos(index) {
    let _todos = todos;
    _todos[index].finished = true;
    setTodos([...todos]);
  }

  function editTodos(todo, index) {
    let _todos = todos;
    let _todo = todo;
    _todo.edit = true;
    _todos[index] = _todo;
    setIndex(index);
    setEdit(_todo.name);
    setTodos([..._todos]);
  }

  function deleteTodos(index) {
    let _arr = todos;
    _arr.splice(index, 1);
    setTodos([..._arr]);
  }

  return (
    <div className={style["todolist"]}>
      <div className={style["add-todos"]}>
        <input value={inputValue} onChange={(e) => setValue(e.target.value)} />
        <button onClick={addTodos}>添加</button>
      </div>
      <div>
        {todos.map((item, index) => {
          return (
            <div className={style["todos-item"]} key={item.name}>
              <div className={style["item-content"]}>
                <span
                  className={item.finished ? style.finished : style.unfinished}
                />
                <span style={{ display: !item.edit ? "block" : "none" }}>
                  {item.name}
                </span>

                <input
                  style={{ display: item.edit ? "block" : "none" }}
                  value={editValue}
                  onChange={(e) => setEdit(e.target.value)}
                  onBlur={inputBlur}
                />
              </div>
              <div className={style["todo-btns"]}>
                <button
                  style={{ display: !item.finished ? "block" : "none" }}
                  onClick={finishTodos.bind(this, index)}
                >
                  完成
                </button>
                <button
                  style={{ display: !item.finished ? "block" : "none" }}
                  onClick={editTodos.bind(this, item, index)}
                >
                  编辑
                </button>
                <button
                  style={{ display: !item.finished ? "block" : "none" }}
                  onClick={deleteTodos.bind(this, index)}
                >
                  删除
                </button>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default TodoList;

import React, { Component } from 'react';
import './App.css';
import Form from "./components/Form";
import FilterButton from "./components/FilterButton";
import Todo from "./components/Todo";


class App extends Component {
  render() {
    const taskList = this.props.tasks.map(task => (
        <Todo
          id={task.id}
          name={task.name}
          completed={task.completed}
          key={task.id}
        />
      )
    );
    return (
    <div className="todoapp stack-large">
      {this.props.name}
      <Form />
      <div className="filters btn-group stack-exception">
        <FilterButton />
        <FilterButton />
        <FilterButton />
      </div>
      <h2 id="list-heading">
        3 tasks remaining
      </h2>
      <ul
        role="list"
        className="todo-list stack-large stack-exception"
        aria-labelledby="list-heading"
      >
        {taskList}
      </ul>
    </div>
  );
}
}

export default App;

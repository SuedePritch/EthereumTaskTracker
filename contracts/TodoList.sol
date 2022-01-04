// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TodoList{
    uint public taskCount = 0;

    //Model a task
    struct Task{
        uint id;
        string content;
        bool completed;
    }
    //Database-like to pull task by id number
    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed 
    );
    event TaskCompleted(
    uint id,
    bool completed
    );

    //Default Tasks
    constructor(){
        createTask("this is a blockchain task tracker");
    }
    //Increment task counter and assign to new id, with chosen task content, is not completed
    function createTask(string memory _content) public{
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }
    
    function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
    }

}

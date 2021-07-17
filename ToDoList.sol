pragma solidity ^0.5.0;

contract ToDoList{
    uint public taskCount = 0;
    
    //Structure of ToDoList 
    struct Task{
        uint id;
        uint date;
        string author;
        string listdata;
        bool status;
        
    }
    
    //here using mapping the to store the data in the  form of key-value pairs,
    mapping(uint => Task) public tasks;
    
    event createdTask(
        uint id,
        uint date,
        string author,
        string listdata,
        bool status
    );
    
    event statusTask(
        uint id,
        bool status
    );
    
    constructor() public{
        taskCreate("Default","Default");
    }
    
    //add new task in the list
    function taskCreate(string memory _listdata, string memory _author ) public{
        taskCount++;
        tasks[taskCount] = Task(taskCount, now,_listdata, _author, false);
        emit createdTask(taskCount,now,_listdata,_author, false);
        
    }
    
    function taskStatus(uint _id) public{
        Task memory _task  = tasks[_id];
        _task.status = !_task.status;
        tasks[_id] = _task;
        emit statusTask(_id, _task.status);
    }
    
    // function getTasks() public view returns(uint) {
    //   return (tasks[id]);
    //}
}
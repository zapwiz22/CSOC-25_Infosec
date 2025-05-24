const fs = require("fs");
const args = process.argv; // for processing the command line arguments

// console.log(args); // gives array of node used nad cwd and other arguments passed
const cwd = args[1].slice(0, -8); // to remove index.js

// checking for todo.txt and done.txt to exist
if (fs.existsSync(cwd + "todo.txt") === false) {
  fs.writeFileSync(cwd + "todo.txt", "{}");
}
if (fs.existsSync(cwd + "done.txt") === false) {
  fs.writeFileSync(cwd + "done.txt", "{}");
}

const infoFunction = () => {
  const infoText = `
Usage :-
$ node index.js username add "todo item"  # Add a new todo
$ node index.js username ls               # Show remaining todos
$ node index.js username del NUMBER       # Delete a todo
$ node index.js username done NUMBER      # Complete a todo
$ node index.js username report           # Statistics;
$ node index.js help                      # Show usage`;

  console.log(infoText);
};

/* file structure i want
 * {
 * "username": [array of tasks]
 * }
 */

const addFunction = () => {
  const username = args[2];
  const task = args[4]; // args[3] is add
  if (username && task) {
    const fileData = JSON.parse(fs.readFileSync(cwd + "todo.txt", "utf-8"));
    if (!fileData[username]) fileData[username] = [];
    fileData[username].push(task);
    fs.writeFile(cwd + "todo.txt", JSON.stringify(fileData), (err) => {
      if (err) throw err;
      console.log(`Added todo: ${task} to ${username}`);
    });
  } else {
    console.log("Error: Missing Information - use help");
  }
};

const listFunction = () => {
  const username = args[2];
  if (username) {
    const fileData = JSON.parse(fs.readFileSync(cwd + "todo.txt", "utf-8"));
    const remTasks = fileData[username];
    if (remTasks.length === 0) {
      console.log("There are no pending tasks for user: ", username);
    } else
      remTasks.forEach((task, index) => console.log(`#${index + 1}: ${task}`));
  } else {
    console.log("Error: Missing Information - use help");
  }
};

const deleteFunction = () => {
  const username = args[2];
  const delIndex = args[4];
  if (username && delIndex) {
    const fileData = JSON.parse(fs.readFileSync(cwd + "todo.txt"), "utf-8");
    const remTasks = fileData[username];
    if (delIndex <= 0 || delIndex > remTasks.length) {
      console.log(`Error: todo #${delIndex} does not exist! Nothing deleted.`);
    } else {
      fileData[username].splice(delIndex - 1, 1);
      fs.writeFile(cwd + "todo.txt", JSON.stringify(fileData), (err) => {
        if (err) throw err;
        console.log(`Deleted todo #${delIndex} for user: ${username}`);
      });
    }
  } else {
    console.log("Error: Missing Information - use help");
  }
};

const doneFunction = () => {
  const username = args[2];
  const doneIndex = args[4];
  if (username && doneIndex) {
    const fileData = JSON.parse(fs.readFileSync(cwd + "todo.txt", "utf-8"));
    const doneData = JSON.parse(fs.readFileSync(cwd + "done.txt", "utf-8"));
    if (doneIndex <= 0 || doneIndex > fileData[username].length) {
      console.log(`Error: todo #${doneIndex} does not exist`);
    } else {
      const doneTask = fileData[username][doneIndex - 1];
      fileData[username].splice(doneIndex - 1, 1);
      if (!doneData[username]) doneData[username] = [];
      doneData[username].push(doneTask);
      fs.writeFile(cwd + "todo.txt", JSON.stringify(fileData), (err) => {
        if (err) throw err;
      });
      fs.writeFile(cwd + "done.txt", JSON.stringify(doneData), (err) => {
        if (err) throw err;
        console.log(`Marked todo #${doneIndex} as done for user: ${username}`);
      });
    }
  } else {
    console.log("Error: Missing Information - use help");
  }
};

const reportFunction = () => {
  const username = args[2];
  if (username) {
    const fileData = JSON.parse(fs.readFileSync(cwd + "todo.txt"));
    const doneData = JSON.parse(fs.readFileSync(cwd + "done.txt"));
    console.log(`user: ${username}`);
    console.log(`Pending: ${fileData[username].length}`);
    console.log(`Completed: ${doneData[username].length}`);
  } else {
    console.log("Error: Missing Information - use help");
  }
};

switch (args[3]) {
  case "add": {
    addFunction();
    break;
  }
  case "ls": {
    listFunction();
    break;
  }
  case "del": {
    deleteFunction();
    break;
  }
  case "done": {
    doneFunction();
    break;
  }
  case "help": {
    infoFunction();
    break;
  }
  case "report": {
    reportFunction();
    break;
  }
  default: {
    infoFunction();
  }
}

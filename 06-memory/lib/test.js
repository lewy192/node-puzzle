const fs = require("fs");
const readline = require("readline");

const fileStream = fs.createReadStream("../data/geo.txt");

const readInterface = readline.createInterface({
    input: fileStream,
    console: true,
});
readInterface.on("line", (line) => console.log(typeof line));
readInterface.on;

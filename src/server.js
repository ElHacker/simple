// Using Node.js

var http = require('http'),
    fileSystem = require('fs'),
    path = require('path'),
    util = require('util');

var server = http.createServer(function(request, response) {
    var filePath = path.join(__dirname, 'output.txt');
    var output, headers;
    
    fileSystem.readFile('output.txt', function(error, file) {
        if (error) {
            throw new Error(error);
        }
        output = JSON.stringify(file);
        headers = {
            'Content-Type': 'application/json',
            'Content-Length': output.length
        };
        response.writeHead(200, headers);
        response.write(output);
        response.end();
    });
});

var port = process.env.PORT || 8080;

server.listen(port, function() {
    console.log("Listening on port " + port);
});

var express = require("express");
var bodyParser = require('body-parser')
var os =require('os')
var app = express();
console.log("Modules Loaded");                                                                                              

var envPort = process.env.PORT || 3000;

app.use(bodyParser.json());
app.get("/", function(req,res) {
    var hostname = os.hostname();
    var ip = req.ip;
    var ip = (ip.split(":"))[3];
    var ipfw = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    console.log("Request received from: " + ip + " Forwarder IP: " + ipfw);
    res.send("<html><body><h1>App Service Linux Bootcamp - Node.JS</h1><br><b>Host Name: "+ hostname +"</b><br><b>Request received from: </b>" + ip + "<br><b>User Agent: </b>"+ req.headers['user-agent'] +"<br><b>Forwarder IP: </b>"+ ipfw +"</body></html>")
});

app.listen(envPort, '0.0.0.0');
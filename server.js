var express = require("express");
var directory = require("serve-index");

var app = express();

app.use(express.static(__dirname));
app.use(directory(__dirname));

app.listen(80);
ws = new WS("ws://pmnxis.noin.me:9919");

ws.bind("open", function(d) {
	console.log("connected");
});
ws.bind("close", function(d) {
	console.log("connection closed");
});

ws.bind(100, function(msg){
	console.log("welcome msg : " + msg);
	
	ws.send( 200, "hello?" );
});
ws.bind(200, function(msg){
	console.log("msg : " + msg);
});
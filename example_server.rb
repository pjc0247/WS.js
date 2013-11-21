require 'em-websocket'

$clients = Array.new();

EM.run {
  EM::WebSocket.run(:host => "0.0.0.0", :port => 9919) do |ws|

    ws.onopen { |handshake|
      puts "WebSocket connection open"

      $clients.push ws

       ws.send "100:welcome"
    }
    ws.onclose {
      $clients.delete ws	
    }
    ws.onmessage { |msg|
      pn = 0
      data = 0
      for i in 0..msg.length
        if msg[i] == ':'
          pn = msg.slice(0, i)
          data = msg.slice(i+1, msg.length)
        end
      end
		
      $clients.each do |client|
        client.send "200:#{data}"
      end
    }
  end
}
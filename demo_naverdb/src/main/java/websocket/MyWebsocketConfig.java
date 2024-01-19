package websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class MyWebsocketConfig implements WebSocketConfigurer {

	private WebSocketHandler chatWebsocketHandler;
	
	public MyWebsocketConfig(WebSocketHandler chatWebsocketHandler) {
		super();
		this.chatWebsocketHandler = chatWebsocketHandler;
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(chatWebsocketHandler, "/ws").setAllowedOrigins("*");
	}

}

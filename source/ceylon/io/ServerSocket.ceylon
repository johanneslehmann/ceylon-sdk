import ceylon.io.impl { ServerSocketImpl }

doc "Represents a server socket: a socket open on the current host that
     accepts incoming connections from other hosts.
     
     This supports synchronous and asynchronous modes of operations.
     
     The server socket is bound immediately to the specified [[bindAddress]]
     (or to every local network interface if not set),
     but it will only accept incoming connections when you call [[accept]] or
     [[acceptAsync]].
     
     New server sockets are created with [[newServerSocket]]."
by "Stéphane Épardaud"
see (newServerSocket)
shared abstract class ServerSocket(SocketAddress? bindAddress = null){
    
    doc "Returns the local address this server socket is listening on."
    shared formal SocketAddress localAddress;
    
    doc "Accepts an incoming connection and return its associated [[Socket]].
         This will block the current thread until there is an incoming connection."
    shared formal Socket accept();
    
    doc "Registers an `accept` listener on the given [[selector]], that will be
         notified every time there is an incoming connection.
         
         If you wish to stop accepting connections, your listener should return
         `false` when invoked."
    see (Selector)
    shared formal void acceptAsync(Selector selector, Boolean accept(Socket socket));
    
    doc "Closes this server socket."
    shared formal void close();
}

doc "Instantiates and binds a new server socket."
see (ServerSocket)
shared ServerSocket newServerSocket(SocketAddress? addr = null, Integer backlog = 0){
    return ServerSocketImpl(addr, backlog);
}

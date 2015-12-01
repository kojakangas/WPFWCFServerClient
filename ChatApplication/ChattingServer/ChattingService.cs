using ChattingInterfaces;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ChattingServer
{
    [ServiceBehavior(ConcurrencyMode = ConcurrencyMode.Multiple, InstanceContextMode = InstanceContextMode.Single)]
    public class ChattingService : IChattingService
    {
        //private ConnectedClient _connectedClients;

        public ConcurrentDictionary<string, ConnectedClient> _connectedClients = new ConcurrentDictionary<string, ConnectedClient>();

        public int Login(string userName)
        {
            //is anyone else logged in with my name?
            foreach (var client in _connectedClients)
            {
                if(client.Key.ToLower() == userName.ToLower())
                {
                    //if yes
                    return 1;
                }
            }

            var establishedUserConnection = OperationContext.Current.GetCallbackChannel<IClient>();

            ConnectedClient newClient = new ConnectedClient();
            newClient.connection = establishedUserConnection;
            newClient.UserName = userName;

            Console.ForegroundColor = ConsoleColor.Cyan;
            Console.WriteLine("Client has logged in: {0} at {1}", newClient.UserName, DateTime.Now);
            Console.ResetColor();

            _connectedClients.TryAdd(userName, newClient);

            return 0;
        }


        public void SendMessageToALL(string message, string userName)
        {
            foreach (var client in _connectedClients)
            {
                if (client.Key.ToLower() != userName.ToLower())
                {
                    client.Value.connection.GetMessage(message, userName);
                }
            }
        }


        public void Logout()
        {
            ConnectedClient client = GetCallingClient();
            if (client != null)
            {
                ConnectedClient removedClient;
                _connectedClients.TryRemove(client.UserName, out removedClient);

                Console.ForegroundColor = ConsoleColor.DarkCyan;
                Console.WriteLine("Client has logged out: {0} at {1}", removedClient.UserName, DateTime.Now);
                Console.ResetColor();
            }
        }

        public ConnectedClient GetCallingClient()
        {
            var establishedUserConnection = OperationContext.Current.GetCallbackChannel<IClient>();
            foreach (var client in _connectedClients)
            {
                if (client.Value.connection == establishedUserConnection)
                {
                    return client.Value;
                }
            }
            return null;
        }
    }
}

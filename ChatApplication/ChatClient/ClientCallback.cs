using ChattingInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ChatClient
{
    [CallbackBehavior(ConcurrencyMode = ConcurrencyMode.Multiple)]
    public class ClientCallback : IClient
    {
        public user currentUser;

        public void GetMessage(string message, string userName)
        {
            //get casted instance of chat client window (NOT MainWindow!)
            var chatChangeAccess = Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is ChatWPFClient) as ChatWPFClient;
            chatChangeAccess.TakeMessage(message, userName);
        }
    }
}

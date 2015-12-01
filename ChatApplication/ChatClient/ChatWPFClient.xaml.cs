using ChattingInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ChatClient
{
    /// <summary>
    /// Interaction logic for ChatWPFClient.xaml
    /// </summary>
    public partial class ChatWPFClient : Window
    {
        //our current logged in user that will be set at MainWindow at login
        public user loggedInUser = WPFUserSession.sessionUser;
        

        public static IChattingService Server;
        private static DuplexChannelFactory<IChattingService> _channelFactory;
        public ChatWPFClient()
        {
            InitializeComponent();
            _channelFactory = new DuplexChannelFactory<IChattingService>(new ClientCallback(), "ChattingServiceEndPoint");
            Server = _channelFactory.CreateChannel();

            int returnValue = Server.Login(loggedInUser.username);
            if (returnValue == 1)
            {
                MessageBox.Show("You are already logged in, check to see who is logged into system");
                
            }
            else if (returnValue == 0)
            {
                MessageBox.Show("You are now logged in! Welcome!");
                welcomeLabel.Text = "Welcome, " + loggedInUser.username;

            }
        }

        private void sendMessage(object sender, RoutedEventArgs e)
        {
            if (chatEntryField.Text.Length == 0)
            {
                return;
            }
            //TODO: figure out how to send everyone message WCF
            Server.SendMessageToALL(chatEntryField.Text, loggedInUser.username);
            TakeMessage(chatEntryField.Text, loggedInUser.username);
            chatEntryField.Text = "";
        }

        public void TakeMessage(string message, string userName)
        {
            chatBox.Text += userName + ": " + message + "\n";
            chatScroll.ScrollToEnd();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            Server.Logout();
        }
    }
}

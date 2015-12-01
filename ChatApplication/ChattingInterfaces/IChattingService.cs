using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ChattingInterfaces
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IChattingServices" in both code and config file together.
    [ServiceContract(CallbackContract=typeof(IClient))]
    public interface IChattingService
    {
        [OperationContract]
        int Login(string userName);
        [OperationContract]
        void Logout();
        [OperationContract]
        void SendMessageToALL(string message, string userName);
    }
}

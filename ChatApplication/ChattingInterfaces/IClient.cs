using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;

namespace ChattingInterfaces
{
    public interface IClient
    {
        [OperationContract]
        void GetMessage(string message, string userName);
    }
}

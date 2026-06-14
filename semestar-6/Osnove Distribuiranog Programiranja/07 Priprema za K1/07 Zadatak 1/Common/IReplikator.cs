using System;
using System.Collections.Generic;
using System.ServiceModel;

namespace Common
{
    [ServiceContract]
    public interface IReplikator
    {
        [OperationContract]
        void Posalji(List<Student> studenti);

        [OperationContract]
        List<Student> Preuzmi(DateTime vremeReplikacije);
    }

}

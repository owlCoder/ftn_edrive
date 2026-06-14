using System;
using System.Threading;
using System.Threading.Tasks;

namespace Device.Interfejsi
{
    public interface IPeriodicTimer
    {
        Task SlanjeMerenja(int id, double t);

        Task PeriodicnaProvera(TimeSpan i, CancellationToken c);
    }
}

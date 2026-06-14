using Device.Interfejsi;
using System;
using System.Threading;
using System.Threading.Tasks;


namespace Device.Implementacije
{
    [Serializable]
    public class PeriodicTimer : IPeriodicTimer
    {
        public async Task SlanjeMerenja(int d_id, double d_t)
        {
            CancellationToken ct = new CancellationToken();
            TimeSpan vreme = new TimeSpan(0, 3, 0); // provera na 3 minute

            for (; !ct.IsCancellationRequested;)
            {
                await PeriodicnaProvera(vreme, ct);
            }
        }

        public async Task PeriodicnaProvera(TimeSpan interval, CancellationToken cancellationToken)
        {
            await Task.Delay(interval, cancellationToken);
        }
    }
}

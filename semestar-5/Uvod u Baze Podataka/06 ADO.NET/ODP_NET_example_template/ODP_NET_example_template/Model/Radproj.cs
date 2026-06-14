namespace ODP_NET_example_template.Model
{
    public class Radproj
    {

        public int RpId { get; set; }
        public int Spr { get; set; }
        public int Mbr { get; set; }
        public int Brc { get; set; }

        public Radproj() { }

        public Radproj(int rpId, int spr, int mbr, int brc)
        {
            RpId = rpId;
            Spr = spr;
            Mbr = mbr;
            Brc = brc;
        }

        public override bool Equals(object obj)
        {
            return obj is Radproj radproj &&
                   RpId == radproj.RpId &&
                   Spr == radproj.Spr &&
                   Mbr == radproj.Mbr &&
                   Brc == radproj.Brc;
        }

        public override int GetHashCode()
        {
            int hashCode = -251626652;
            hashCode = hashCode * -1521134295 + RpId.GetHashCode();
            hashCode = hashCode * -1521134295 + Spr.GetHashCode();
            hashCode = hashCode * -1521134295 + Mbr.GetHashCode();
            hashCode = hashCode * -1521134295 + Brc.GetHashCode();
            return hashCode;
        }
    }
}

using System.ComponentModel.DataAnnotations;

namespace REST_dotNET_BDD_Srv_HiriartCoralesSamaniego.Models
{
    public class Movimiento
    {
        //Fields must be called exaclty the same as DB table columns
        public string? chr_cuencodigo { get; set; }
        [Key]
        public int int_movinumero { get; set; }
        public DateTime dtt_movifecha { get; set; }
        public string? chr_emplcodigo { get; set; }
        public string? chr_tipocodigo { get; set; }
        public decimal dec_moviimporte { get; set; }
        public string? chr_cuenreferencia { get; set; }

    }
}

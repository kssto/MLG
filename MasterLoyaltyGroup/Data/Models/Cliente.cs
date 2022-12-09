using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class Cliente
    {
        public int ID_Cliente { get; set; }
        public string? Nombre { get; set; }
        public string? Ap { get; set; }
        public string? Am { get; set; }
        public string? Direccion { get; set; }
        public Cliente()
        {
            ID_Cliente = 0;
            Nombre = string.Empty;
            Ap = string.Empty;
            Am = string.Empty;
            Direccion = string.Empty;
        }
        public Cliente(DataRow dr)
        {
            ID_Cliente = Convert.ToInt32(dr["ID_Cliente"].ToString());
            Nombre = dr["nombre"].ToString();
            Ap = dr["aP"].ToString();
            Am = dr["aM"].ToString();
            Direccion = dr["direccion"].ToString();
        }

    }
}

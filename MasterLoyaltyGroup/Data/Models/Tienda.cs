using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class Tienda
    {
        public int ID_Tienda { get; set; }
        public string? Sucursal { get; set; }
        public string? Direccion { get; set; }
        public Tienda()
        {
            ID_Tienda = 0;
            Sucursal = string.Empty;
            Direccion = string.Empty;
        }
        public Tienda(DataRow dr)
        {
            ID_Tienda = Convert.ToInt32(dr["ID_Sucursal"].ToString());
            Sucursal = dr["sucursal"].ToString();
            Direccion = dr["direccion"].ToString();
        }
    }
}

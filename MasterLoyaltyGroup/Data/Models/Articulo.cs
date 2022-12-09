using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class Articulo
    {
        public int ID_Articulo { get; set; }
        public string? Codigo { get; set; }
        public string? Descripcion { get; set; }
        public double Precio { get; set; } 
        public int Stock { get; set; }
        public Articulo()
        {
            ID_Articulo = 0;
            Codigo = string.Empty;
            Descripcion = string.Empty;
            Precio = 0;
            Stock = 0;
        }
        public Articulo(DataRow dr)
        {
            ID_Articulo = Convert.ToInt32(dr["ID_Articulo"].ToString());
            Codigo = dr["codigo"].ToString();
            Descripcion = dr["descripcion"].ToString();
            Precio = Convert.ToDouble(dr["precio"].ToString());
            Stock = Convert.ToInt32(dr["stock"].ToString());
        }
    }

}

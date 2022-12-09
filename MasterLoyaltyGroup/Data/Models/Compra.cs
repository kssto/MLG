using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class Compra
    {
        public int ID_Cliente_articulo { get; set; }
        public int ID_Cliente { get; set; }
        public string? Nombre { get; set; }
        public string? Ap { get; set; }
        public string? Am { get; set; }
        public string? Direccion { get; set; }
        public int ID_Articulo { get; set; }
        public string? Codigo { get; set; }
        public string? Descripcion { get; set; }
        public double Precio { get; set; }
        public DateTime? Fecha { get; set; }
       
        public Compra()
        {
            ID_Cliente_articulo = 0;
            ID_Cliente = 0;
            Nombre = string.Empty;
            Ap = string.Empty;
            Am = string.Empty;
            Direccion = string.Empty;
            ID_Articulo = 0;
            Codigo = string.Empty;
            Descripcion = string.Empty;
            Precio = 0;
            Fecha = DateTime.Now;
         
        }
        public Compra(DataRow dr)
        {
            string[] validformats = new[] { "MM/dd/yyyy", "yyyy/MM/dd", "MM/dd/yyyy HH:mm:ss",
                                        "MM/dd/yyyy hh:mm tt", "yyyy-MM-dd HH:mm:ss, fff" };

            CultureInfo provider = new CultureInfo("en-US");
            ID_Cliente_articulo = Convert.ToInt32(dr["ID_Cliente_Articulo"].ToString());
            ID_Cliente = Convert.ToInt32(dr["ID_Cliente"].ToString());
            Nombre = dr["nombre"].ToString();
            Ap = dr["aP"].ToString();
            Am = dr["aM"].ToString();
            Direccion = dr["direccion"].ToString();
            ID_Articulo = Convert.ToInt32(dr["ID_Articulo"].ToString());
            Codigo = dr["codigo"].ToString();
            Descripcion = dr["descripcion"].ToString();
            Precio = Convert.ToDouble(dr["precio"].ToString());
            //Fecha = DateTime.ParseExact(dr["fecha"].ToString(), validformats, provider);
            Fecha = DateTime.Parse(dr["fecha"].ToString(), CultureInfo.CreateSpecificCulture("fr-FR"));
          

        }
    }
}

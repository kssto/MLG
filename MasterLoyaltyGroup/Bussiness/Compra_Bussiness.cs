using Data.Crud;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness
{
    public class Compra_Bussiness
    {
        private CompraC compraC = new CompraC();
        public List<Compra> Listar()
        {
            return compraC.ListarCompra();

        }
        public string InsertCompra(Compra compra)
        {
            try
            {

               
                compraC.Insert(compra);
                return "Compra Realizada";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
    }
}

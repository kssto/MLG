using Data.Crud;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness
{
    public class Tienda_Bussiness
    {
        private TiendaC tiendaC = new TiendaC();
        public List<Tienda> Listar()
        {
            return tiendaC.ListarTienda();

        }
        public string InsertTienda(Tienda tienda)
        {
            try
            {
                
                tiendaC.Insert(tienda);
                return "Tienda Agregada";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        public string UpdateTienda(Tienda tienda)
        {
            try
            {
                tiendaC.Update(tienda);
                return "Tienda Actualizada";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        public string DeleteTienda(int id)
        {
            try
            {
                tiendaC.Delete(id);
                return "Cliente Eliminado";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}

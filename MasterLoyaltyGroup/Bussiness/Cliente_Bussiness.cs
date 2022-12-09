using Data.Crud;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness
{
    public class Cliente_Bussiness
    {
        private ClienteC clienteC = new ClienteC();
        public  List<Cliente> Listar()
        {
            return clienteC.ListarCliente();
            
        }
        public string InsertCliente(Cliente cliente)
        {
            try
            {
                clienteC.Insert(cliente);
                return "Cliente Agregado";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            
        }
        public string UpdateCliente(Cliente cliente)
        {
            try
            {
                clienteC.Update(cliente);
                return "Cliente Actualizado";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            
        }
        public string DeleteCliente(int id)
        {
            try
            {

                clienteC.Delete(id);
                return "Cliente Eliminado";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}

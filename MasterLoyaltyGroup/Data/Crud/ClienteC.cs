using Data.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Data.Crud
{
    public class ClienteC
    {
        private Conexion conexion = new Conexion();
        SqlDataReader? dr;
        DataTable dt = new DataTable();
        SqlCommand cm = new SqlCommand();
        public List<Cliente> ListarCliente()
        {
            try
            {
                cm.Connection = conexion.AbrirConexion();
                cm.CommandText = "Mostrar_Cliente";
                cm.CommandType = CommandType.StoredProcedure;
                DataSet dsCliente = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(cm);
                adapter.Fill(dsCliente);
                adapter.Dispose();
                List<Cliente> lstCliente = new();

                foreach (DataRow dr in dsCliente.Tables[0].Rows)
                {
                    lstCliente.Add(new Cliente(dr));
                }

                return lstCliente;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                conexion.CerrarConexion();

            }
        }

        public void Insert(Cliente cliente)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Insertar_Cliente";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@nombre", cliente.Nombre);
            cm.Parameters.AddWithValue("@aP", cliente.Ap);
            cm.Parameters.AddWithValue("@aM", cliente.Am);
            cm.Parameters.AddWithValue("@direccion", cliente.Direccion);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
        public void Update(Cliente cliente)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Actualizar_Cliente";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@ID_Cliente", cliente.ID_Cliente);
            cm.Parameters.AddWithValue("@nombre", cliente.Nombre);
            cm.Parameters.AddWithValue("@aP", cliente.Ap);
            cm.Parameters.AddWithValue("@aM", cliente.Am);
            cm.Parameters.AddWithValue("@direccion", cliente.Direccion);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
        public void Delete(int id)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Eliminar_Cliente";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@ID_Cliente", id);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
    }
}

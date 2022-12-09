using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data.Models;

namespace Data.Crud
{
    public class TiendaC
    {
        private Conexion conexion = new Conexion();
        SqlDataReader? dr;
        DataTable dt = new DataTable();
        SqlCommand cm = new SqlCommand();
        public List<Tienda> ListarTienda()
        {
            try
            {
                cm.Connection = conexion.AbrirConexion();
                cm.CommandText = "Mostrar_Tienda";
                cm.CommandType = CommandType.StoredProcedure;
                DataSet dsTienda = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(cm);
                adapter.Fill(dsTienda);
                adapter.Dispose();
                List<Tienda> lstTienda= new();

                foreach (DataRow dr in dsTienda.Tables[0].Rows)
                {
                    lstTienda.Add(new Tienda(dr));
                }

                return lstTienda;
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
        public void Insert(Tienda tienda)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Insertar_Tienda";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@sucursal", tienda.Direccion);
            cm.Parameters.AddWithValue("@direccion", tienda.Direccion);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
        public void Update(Tienda tienda)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Actualizar_Tienda";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@ID_Sucursal", tienda.ID_Tienda);
            cm.Parameters.AddWithValue("@sucursal", tienda.Direccion);
            cm.Parameters.AddWithValue("@direccion", tienda.Direccion);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
        public void Delete(int id)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Eliminar_Tienda";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@ID_Sucursal", id);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
    }
}

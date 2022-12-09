using Data.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Crud
{
    public class CompraC
    {
        private Conexion conexion = new Conexion();
        SqlDataReader? dr;
        DataTable dt = new DataTable();
        SqlCommand cm = new SqlCommand();
        public List<Compra> ListarCompra()
        {
            try
            {
                cm.Connection = conexion.AbrirConexion();
                cm.CommandText = "Articulos_Comprados";
                cm.CommandType = CommandType.StoredProcedure;
                DataSet dsCompra = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(cm);
                adapter.Fill(dsCompra);
                adapter.Dispose();
                List<Compra> lstCompra = new();

                foreach (DataRow dr in dsCompra.Tables[0].Rows)
                {
                    lstCompra.Add(new Compra(dr));
                }

                return lstCompra;
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
        public void Insert(Compra compra)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Comprar_Articulo";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@ID_Cliente", compra.ID_Cliente);
            cm.Parameters.AddWithValue("@ID_Articulo", compra.ID_Articulo);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
    }
}

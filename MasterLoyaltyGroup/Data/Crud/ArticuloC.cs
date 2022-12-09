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
    public class ArticuloC
    {
        private Conexion conexion = new Conexion();
        SqlDataReader? dr;
        DataTable dt = new DataTable();
        SqlCommand cm = new SqlCommand();
        public List<Articulo> ListarArticulos()
        {
            try
            {
                cm.Connection = conexion.AbrirConexion();
                cm.CommandText = "Mostrar_Articulo";
                cm.CommandType = CommandType.StoredProcedure;
                DataSet dsArticulo = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(cm);
                adapter.Fill(dsArticulo);
                adapter.Dispose();
                List<Articulo> lstArticulo = new();

                foreach (DataRow dr in dsArticulo.Tables[0].Rows)
                {
                    lstArticulo.Add(new Articulo(dr));
                }

                return lstArticulo;
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
        public void Insert(Articulo articulo)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Insertar_Articulo";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@codigo", articulo.Codigo);
            cm.Parameters.AddWithValue("@descripcion", articulo.Descripcion);
            cm.Parameters.AddWithValue("@precio", articulo.Precio);
            cm.Parameters.AddWithValue("@stock", articulo.Stock);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
        public void Update(Articulo articulo)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Actualizar_Articulo";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@ID_Articulo", articulo.ID_Articulo);
            cm.Parameters.AddWithValue("@codigo", articulo.Codigo);
            cm.Parameters.AddWithValue("@descripcion", articulo.Descripcion);
            cm.Parameters.AddWithValue("@precio", articulo.Precio);
            cm.Parameters.AddWithValue("@stock", articulo.Stock);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
        public void Delete(int id)
        {
            cm.Connection = conexion.AbrirConexion();
            cm.CommandText = "Eliminar_Articulo";
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@ID_Articulo", id);
            cm.ExecuteNonQuery();
            cm.Parameters.Clear();
            conexion.CerrarConexion();
        }
    }
}

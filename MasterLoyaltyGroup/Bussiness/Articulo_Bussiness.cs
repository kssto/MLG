using Data.Crud;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bussiness
{
    public class Articulo_Bussiness
    {
        private ArticuloC articuloC = new ArticuloC();
        public List<Articulo> Listar()
        {
            return articuloC.ListarArticulos();

        }
        public string InsertArticulos(Articulo articulo)
        {
            try
            {
                
                articuloC.Insert(articulo);
                return "Articulo Agregado";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        public string UpdateArticulo(Articulo articulo)
        {
            try
            {
                
                articuloC.Update(articulo);
                return "Articulo Actualizado";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        public string DeleteArticulo(int id)
        {
            try
            {
                articuloC.Delete(id);
                return "Articulo Eliminado";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}

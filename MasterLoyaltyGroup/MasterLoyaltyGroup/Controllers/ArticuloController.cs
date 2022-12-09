using Bussiness;
using Data.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MasterLoyaltyGroup.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticuloController : ControllerBase
    {
        Articulo_Bussiness articuloB = new Articulo_Bussiness();
  
        [HttpGet]
        public IEnumerable<Articulo> Get()
        {
            return articuloB.Listar();
        }
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }
        [HttpPost]
        public string Post([FromBody] Articulo articulo)
        {
            return articuloB.InsertArticulos(articulo);
        }

        [HttpPut]
        public string Put([FromBody] Articulo articulo)
        {
            return articuloB.UpdateArticulo(articulo);
        }
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return articuloB.DeleteArticulo(id);
        }
    }
}

using Bussiness;
using Data.Models;
using Microsoft.AspNetCore.Mvc;

namespace MasterLoyaltyGroup.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TiendaController : ControllerBase
    {
        Tienda_Bussiness tiendaB = new Tienda_Bussiness();
        [HttpGet]
        public IEnumerable<Tienda> Get()
        {
            return tiendaB.Listar();
        }

        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        [HttpPost]
        public string Post([FromBody] Tienda tienda)
        {
            return  tiendaB.InsertTienda(tienda);
        }

        [HttpPut]
        public string Put([FromBody] Tienda tienda)
        {
            return tiendaB.UpdateTienda(tienda);
        }

        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return tiendaB.DeleteTienda(id);
        }
    }
}

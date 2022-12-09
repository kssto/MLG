using Bussiness;
using Data.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MasterLoyaltyGroup.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        Cliente_Bussiness clien = new Cliente_Bussiness();
        // GET: api/<ClienteController>
        [HttpGet]
        public IEnumerable<Cliente> Get()   
        {
            return  clien.Listar();
        }

        // GET api/<ClienteController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ClienteController>
        [HttpPost]
        public string Post([FromBody]  Cliente cliente)
        {
            return clien.InsertCliente(cliente);
        }

        // PUT api/<ClienteController>/5
        [HttpPut]
        public string Put([FromBody] Cliente cliente)
        {
            return clien.UpdateCliente(cliente);
        }

        // DELETE api/<ClienteController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return clien.DeleteCliente(id);
        }
    }
}

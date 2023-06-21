using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using REST_dotNET_BDD_Srv_HiriartCoralesSamaniego.Data;
using REST_dotNET_BDD_Srv_HiriartCoralesSamaniego.Models;

namespace REST_dotNET_BDD_Srv_HiriartCoralesSamaniego.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovimientoController : ControllerBase
    {
        //To use DB
        private readonly BankDBContext dbContext;

        public MovimientoController(BankDBContext dbContext)
        {
            this.dbContext = dbContext;
        }

        [HttpGet("getMovimientos")]
        public IActionResult GetMovimientos()
        {
            try
            {
                //Read everythong from Movimientos table
                return Ok(dbContext.Movimiento.ToList());
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("getMovimientosByAccount/{accountID}")]
        public IActionResult GetMovimientosbyAccount(string accountID)
        {
            try
            {
                //Read Movimientos from the specified account
                List<Movimiento> movimientos = dbContext.Movimiento.Where(mov => mov.chr_cuencodigo == accountID).ToList();
                return Ok(movimientos);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //Save movimiento read from request body
        [HttpPost("createMovimiento")]
        public IActionResult CreateMovimiento([FromBody] Movimiento movimiento)
        {
            try
            {
                //Save movimiento in database
                dbContext.Movimiento.Add(movimiento);
                //Commit changes
                dbContext.SaveChanges();
                return Ok(movimiento);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}

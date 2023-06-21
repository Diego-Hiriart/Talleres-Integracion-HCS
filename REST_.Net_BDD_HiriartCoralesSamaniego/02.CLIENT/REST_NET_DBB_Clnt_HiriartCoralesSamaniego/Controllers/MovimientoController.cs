using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace REST_dotNET_DBB_Clnt_HiriartCoralesSamaniego.Controllers
{
    public class MovimientoController : Controller
    {
        private readonly HttpClient _httpClient;

        public MovimientoController()
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new Uri("https://localhost:7003/");
        }

        //Load movimientos list in view
        public async Task<ActionResult> Index()
        {
            JsonArray? movimientos = await this.GetMovimientos();
            return View(movimientos);
        }

        //Get movimientos by account, passing account number in body
        [HttpPost]
        public async Task<ActionResult> GetMovimientosByAccount([FromBody] JsonObject account)
        {
            var accountMovs = new JsonArray();

            HttpResponseMessage? response = await _httpClient.GetAsync(string.Format("api/Movimiento/getMovimientosByAccount/{0}", account.First().Value));
            if (response.IsSuccessStatusCode)
            {
                string? content = await response.Content.ReadAsStringAsync();
                accountMovs.Add(JsonArray.Parse(content));
            }
            return Json(accountMovs);
        }

        //Create a new movimiento with the object passed in the body
        public async Task<ActionResult> CreateMovimiento([FromBody] JsonObject movimiento)
        {
            bool result;
            string? jsonMov = JsonSerializer.Serialize(movimiento);
            //Encode json to be sent in request
            var jsonContent = new StringContent(jsonMov, Encoding.UTF8, "application/json");
            HttpResponseMessage? response = await _httpClient.PostAsync("api/Movimiento/createMovimiento", jsonContent);
            result = response.IsSuccessStatusCode ? true : false;
            return Json(result);
        }

        //Get JSON of all movimientos
        private async Task<JsonArray> GetMovimientos()
        {
            var movimientos = new JsonArray();
            HttpResponseMessage? response = await _httpClient.GetAsync("api/Movimiento/getMovimientos");
            if (response.IsSuccessStatusCode)
            {
                string? content = await response.Content.ReadAsStringAsync();
                movimientos.Add(JsonArray.Parse(content));
            }
            return movimientos;
        }
    }
}

﻿using Microsoft.AspNetCore.Mvc;
using REST_dotNET_DBB_Clnt_HiriartCoralesSamaniego.Models;
using System.Diagnostics;

namespace REST_dotNET_DBB_Clnt_HiriartCoralesSamaniego.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
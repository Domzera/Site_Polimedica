using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Polimedica.Interface;
using Polimedica.Models;

namespace Polimedica.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IBannerRepository _banner;
        private readonly ICategoriaRepository _catere;

        public HomeController(
            ILogger<HomeController> logger,
            IBannerRepository banner,
            ICategoriaRepository catere)
        {
            _logger = logger;
            _banner = banner;
            _catere = catere;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Categoria> categoria = await _catere.GetAllAsync();
            return RedirectToAction("index", "Produto");
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

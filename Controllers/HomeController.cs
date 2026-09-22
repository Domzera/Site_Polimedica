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
            Banner banner = await _banner.GetBanner(1);
            if (banner != null)
            {
                ViewBag.Banner1 = banner.Banner1 == null ? "/Image/LogoNav.png" : banner.Banner1;
                ViewBag.Banner2 = banner.Banner2 == null ? "/Image/LogoNav.png" : banner.Banner2;
                ViewBag.Banner3 = banner.Banner3 == null ? "/Image/LogoNav.png" : banner.Banner3;
            }
            else
            {
                // Caminho padrão para o Logo da Polimeidca
                ViewBag.Banner1 = "/Image/LogoNav.png";
                ViewBag.Banner2 = "/Image/LogoNav.png";
                ViewBag.Banner3 = "/Image/LogoNav.png";
            }
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

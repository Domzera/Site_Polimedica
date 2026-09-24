using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Polimedica.ViewModel;
using Polimedica.Interface;
using Polimedica.Models;
using System.Threading.Tasks;
using Microsoft.Identity.Client;

namespace Polimedica.Controllers
{
    public class CategoriaController : Controller
    {
        private readonly ICategoriaRepository _catere;
        private readonly ICategoriaProdutoRepository _categoriaProduto;
        private readonly IProdutoRepository _produtoRepository;
        private readonly IBannerRepository _banner;
        private readonly IPromocaoRepository _promocaoRepository;

        public CategoriaController(
            ICategoriaRepository catere,
            ICategoriaProdutoRepository categoriaProduto,
            IProdutoRepository produtoRepository,
            IBannerRepository banner,
            IPromocaoRepository promocaoRepository)
        {
            _catere = catere;
            _categoriaProduto = categoriaProduto;
            _produtoRepository = produtoRepository;
            _banner = banner;
            _promocaoRepository = promocaoRepository;
        }

        public async Task<IActionResult> Index()
        {

            IEnumerable<Categoria> categorias = await _catere.GetAllAsync();

            return View(categorias);
        }

        [Authorize(Roles = "Admin,Gerente,Vendedor\"")]
        public IActionResult CreateCategoria()
        {
            var response = new CreateCategoriaViewModel();
            return View(response);
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Gerente,Vendedor\"")]
        public async Task<IActionResult> CreateCategoria(CreateCategoriaViewModel createCategoriaVM)
        {
            if (!ModelState.IsValid)
            {
                TempData["Error"] = "This email address is alreadt in use";
                return View(createCategoriaVM);
            }
            else
            {
                var categoriaVm = new Categoria()
                {
                    NomeCategoria = createCategoriaVM.Nome,
                    DescricaoCategoria = createCategoriaVM.Descricao
                };
                if (categoriaVm.NomeCategoria != null || categoriaVm.NomeCategoria != ""
                    &&
                    categoriaVm.DescricaoCategoria != null || categoriaVm.DescricaoCategoria != "")
                {
                    _catere.Add(categoriaVm);
                    return RedirectToAction("Index");
                }
                else { return RedirectToAction("CreateCategoria"); }
            }

        }

        public async Task<IActionResult> Produtos(int id) // Esse ID é da categoria
        {
            Banner banner = await _banner.GetBanner(1);

            var produtos = await _produtoRepository.GetAllProdutoPorCategoria(id);

            if(produtos == null || !produtos.Any())
            {
                return RedirectToAction("Index");
            }

            return View(produtos);
        }

        private async Task<bool> verificaPromocao(int id)
        {
            var testaPromocao = _promocaoRepository.GetByProdutoId(id).Result;
            if(testaPromocao != null)
            {
                return true;
            }
            return false;
        }
    }
}

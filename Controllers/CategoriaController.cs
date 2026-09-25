using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Polimedica.ViewModel;
using Polimedica.Interface;
using Polimedica.Models;
using System.Text.Json;

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
            //Aqui eu crio o objeto PRODUTO e chamo a função GetAllProdutoPorCategoria e trago só os produtos dessa categoria
            IEnumerable<Produto> produtos = await _produtoRepository.GetAllProdutoPorCategoria(id);

            //É preciso transformar o objeto em json para passa-lo pelo metodo de 'TempData' para o Redirect
            //Eu uso o nome 'selecao' para poder usar um 'TempData' para Categoria - TerEmCasa - Promocao
            TempData["Selecao"] = JsonSerializer.Serialize(produtos);

            //No controller do INDEX do produto eu consigo acessar o 'TempData'
            return RedirectToAction("index","Produto");
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

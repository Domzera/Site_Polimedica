using Microsoft.AspNetCore.Mvc;
using Polimedica.Interface;
using Polimedica.Models;
using Polimedica.ViewModel;

namespace Polimedica.Controllers
{
    public class PromocaoController : Controller
    {
        private readonly IPromocaoRepository _promocao;
        private readonly IProdutoRepository _produto;
        private readonly IBannerRepository _banner;

        public PromocaoController(
            IPromocaoRepository promocao,
            IProdutoRepository produto,
            IBannerRepository banner)
        {
            _promocao = promocao;
            _produto = produto;
            _banner = banner;
        }
        public async Task<IActionResult> Index()
        {
            IEnumerable<Promocao> promocao = await _promocao.GetAll();
            List<PromocaoViewModel> promocoesVM = new List<PromocaoViewModel>();

            foreach (var item in promocao)
            {
                if(item.ProdutoID != 0)
                {
                    Produto produto = await _produto.GetById(item.ProdutoID);
                    
                    var promocaoVM = new PromocaoViewModel
                    {
                        ProdutiId = produto.Id,
                        NomeProduto = produto.NomeProduto,
                        DescricaoProduto = produto.DescricaoProduto,
                        Imagem1 = produto.Imagem1,
                        Imagem2 = produto.Imagem2,
                        Imagem3 = produto.Imagem3,
                        Imagem4 = produto.Imagem4,
                        Imagem5 = produto.Imagem5,
                        Ativo = produto.Ativo,
                        PrecoPromocional = (float)item.Preco,
                        DataInicioPromocao = item.Datainicio,
                        DataFinalPromocao = item.DataFinal,
                    };

                    promocoesVM.Add(promocaoVM);
                }
            }

            return View(promocoesVM);
        }
    }
}

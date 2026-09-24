using Microsoft.AspNetCore.Mvc;
using Polimedica.Interface;
using Polimedica.Models;

namespace Polimedica.ViewComponents
{
    public class BannerViewComponent : ViewComponent
    {
        private readonly IBannerRepository _banner;

        public BannerViewComponent(IBannerRepository banner)
        {
            _banner = banner;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            Banner bannerData = await _banner.GetBanner(1);

            if(bannerData == null)
            {
                bannerData = new Banner
                {
                    Banner1 = "/Image/LogoNav.png",
                    Banner2 = "/Image/LogoNav.png",
                    Banner3 = "/Image/LogoNav.png"
                };
            }
            else
            {
                bannerData.Banner1 ??= "/Image/LogoNav.png";
                bannerData.Banner2 ??= "/Image/LogoNav.png";
                bannerData.Banner3 ??= "/Image/LogoNav.png";
            }

            return View(bannerData);
        }
    }
}

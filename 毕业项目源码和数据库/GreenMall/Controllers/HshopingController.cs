using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenMall.Models;
namespace GreenMall.Controllers
{
    public class HshopingController : Controller
    {
        GreenMallEntities db = new GreenMallEntities();
        // GET: Hshoping
        /// <summary>
        /// 商品查询
        /// </summary>
        /// <param name="GoodsName"></param>
        /// <returns></returns>
        public ActionResult Index(string GoodsName="")
        {
            List<Shopinginfo> shoping = db.Shopinginfo.Where(p=> GoodsName==""||p.GoodsName.Contains(GoodsName)).ToList();
            ViewBag.GoodsName = GoodsName;
            return View(shoping);
        }

        public ActionResult Hshopdelet(int id)
        {

            return RedirectToAction("Index");
        }
        /// <summary>
        /// 产品添加
        /// </summary>
        /// <returns></returns>
        public ActionResult Add()
        {
            //获取类型表内容
            List<Goodstype> Gtyp = db.Goodstype.ToList();
            
            return View(Gtyp);
        }
        [HttpPost]
        public ActionResult Add(Shopinginfo goods, HttpPostedFileBase GoodsPicLarge, HttpPostedFileBase GoodsVideo)
        {
            //拿到文件名
            string Filname = Path.GetFileName(GoodsPicLarge.FileName);
            //判断是否为图片
            if (Filname.EndsWith("jpg") || Filname.EndsWith("png") || Filname.EndsWith("gif"))
            {
                //保存到指定位置
                GoodsPicLarge.SaveAs(Server.MapPath("/Content/Images"+Filname));
                //将图片文件名，绑定到商品GoodsPicLarge
                goods.GoodsPicLarge = Filname;
            }
            else
            {
                return Content("<script> alert('上传的图片格式不对')</script>");
            }

            string Filname3 = Path.GetFileName(GoodsVideo.FileName);
            //判断文件结尾是否为视频格式
            if (Filname.EndsWith("mp4") || Filname.EndsWith("mov") || Filname.EndsWith("f4v") || Filname.EndsWith("mpg") || Filname.EndsWith("mkv"))
            {
                //保存到指定位置
                GoodsPicLarge.SaveAs(Server.MapPath("/Content/Video" + Filname3));
                //将图片文件名，绑定到商品GoodsPicLarge
                goods.GoodsVideo = Filname3;
            }
            else
            {
                return Content("<script> alert('请上传结尾为mp4/ mov /f4v /mpg mkv的视频格式！')</script>");
            }



            return View();
        }
    }
}
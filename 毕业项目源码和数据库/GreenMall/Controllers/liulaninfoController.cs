using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenMall.Models;
namespace GreenMall.Controllers
{
    public class liulaninfoController : Controller
    {
        GreenMallEntities db = new GreenMallEntities();
        // GET: liulaninfo
        public ActionResult Index(int? typeID)
        {
            List<Shopinginfo> listshop = db.Shopinginfo.Where(p=>typeID == null||p.TyIpeD== typeID).ToList();
            ViewBag.typlistt = db.Goodstype.ToList();
            return View(listshop);
        }
    }
}
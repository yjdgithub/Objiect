using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenMall.Models;
namespace GreenMall.Controllers
{
    public class HorderController : Controller
    {
        GreenMallEntities db = new GreenMallEntities();
        // GET: Horder
        /// <summary>
        /// 查询状态为一，待处理订单
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            int number = 0;
            List<Orderinfo> orderlist = db.Orderinfo.Where(p=>p.Oderstate==1).ToList();
            ViewBag.order = orderlist;
            //获得订单条数
            var count = db.Orderinfo.Where(p => p.Oderstate == 1).Count();
            if (count<0)
            {
                ViewBag.cunt = number;
            }
            else
            {
                ViewBag.cunt = count;
            }
            
            return View();
        }
        /// <summary>
        /// 处理订单界面
        /// </summary>
        /// <returns></returns>
        public ActionResult orderchuli(int id)
        {
            var order = db.Orderinfo.Find(id);
            ViewBag.order = order;
            return View();
        }
        [HttpPost]
        public ActionResult orderAjaxchuli(int orderID,decimal yinfu, decimal Daifu, decimal shifu,string zhifufanshi)
        {

            Orderinfo or = db.Orderinfo.Find(orderID);
            or.Payable = yinfu;
            or.Tobepaid = Daifu;
            or.Hnrb = shifu;
            or.Paymentmethod = zhifufanshi;
            or.Oderstate = 2;//状态改为2 1、未处理2、已处理
            db.SaveChanges();
            return RedirectToAction("Yichuliorder");
        }
        /// <summary>
        /// 已处理订单查询
        /// </summary>
        /// <returns></returns>
        public ActionResult Yichuliorder()
        {
            List<Orderinfo> orderlist = db.Orderinfo.Where(p => p.Oderstate == 2).ToList();
            ViewBag.order = orderlist;
            return View();
        }
    }
}
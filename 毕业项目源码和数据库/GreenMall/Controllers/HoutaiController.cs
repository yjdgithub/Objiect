using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenMall.Models;
namespace GreenMall.Controllers
{
    public class HoutaiController : Controller
    {
        GreenMallEntities db = new GreenMallEntities();
        // GET: Houtai
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult goods()
        {
            return View();
        }
        public ActionResult Daichulioder()
        {
            return View();
        }
        /// <summary>
        /// 供货商信息查询
        /// </summary>
        /// <returns></returns>
        public ActionResult Gonhuomecage(string MerPlantingShoping="")
        {
            List<Recordsinfo> list = db.Recordsinfo.Where(p=> MerPlantingShoping==""||p.MerPlantingShoping.Contains(MerPlantingShoping)).ToList();
            ViewBag.MerPlantingShoping = MerPlantingShoping;
            return View(list);
        }
        /// <summary>
        /// 删除供货商信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult GonhuomecageDelet(int id)
        {
            Recordsinfo re = db.Recordsinfo.Find(id);
            db.Recordsinfo.Remove(re);
            db.SaveChanges();
            return RedirectToAction("Gonhuomecage");
        }
        /// <summary>
        /// 供货商信息录入
        /// </summary>
        /// <returns></returns>
        public ActionResult AddGonhuoms(Recordsinfo ghs)
        {
            db.Recordsinfo.Add(ghs);
            db.SaveChanges();
            return RedirectToAction("Gonhuomecage");
        }
        /// <summary>
        /// 修改供货商信息
        /// </summary>
        /// <returns></returns>
        public ActionResult Update(int id)
        {
            Recordsinfo re = db.Recordsinfo.Find(id);
            ViewBag.re = re;
            return View();
        }
        [HttpPost]
        public ActionResult Update(Recordsinfo resave)
        {
            db.Entry(resave).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Gonhuomecage");
        }
        /// <summary>
        /// 供货商详情信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Xianqing(int id)
        {
            Recordsinfo re = db.Recordsinfo.Find(id);
            ViewBag.re = re;
            return View();
        }
    }
}
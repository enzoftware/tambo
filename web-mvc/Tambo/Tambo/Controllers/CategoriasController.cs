﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BusinessLayer.Service;
using BusinessLayer.ServiceImpl;
using DataLayer;
using Entities_Layer;

namespace Tambo.Controllers
{
    public class CategoriasController : Controller
    {
        private CategoriaService categoriaService;
        private TamboContext db = new TamboContext();

        public CategoriasController()
        {
            categoriaService = new CategoriaServiceImpl();
        }

        // GET: Categorias
        public ActionResult Index()
        {
            var categorias = categoriaService.FindAll();
            return View(categorias);
        }

        // GET: Categorias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categorias categoria = categoriaService.FindById(id);
            if (categoria == null)
            {
                return HttpNotFound();
            }
            return View(categoria);
        }

        // GET: Categorias/Create
        public ActionResult Create()
        {
            return View(new Categorias());
        }

        // POST: Categorias/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create( Categorias categoria)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }

                categoriaService.Save(categoria);
                return RedirectToAction("Index", "Categorias");
            }
            catch (Exception)
            {
                return View();
            }
        }

        // GET: Categorias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categorias categoria = categoriaService.FindById(id);
            if (categoria == null)
            {
                return HttpNotFound();
            }
            return View(categoria);
        }

        // POST: Categorias/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nombre")] Categorias categoria)
        {
            if (ModelState.IsValid)
            {
                categoriaService.Update(categoria);
                return RedirectToAction("Index");
            }
            return View(categoria);
        }

        // GET: Categorias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categorias categoria = categoriaService.FindById(id);
            if (categoria == null)
            {
                return HttpNotFound();
            }
            return View(categoria);
        }

        // POST: Categorias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Categorias categoria = categoriaService.FindById(id);
            categoriaService.Delete(categoria);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

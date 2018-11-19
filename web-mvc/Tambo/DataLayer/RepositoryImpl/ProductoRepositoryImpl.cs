﻿using DataLayer.Repository;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities_Layer;

namespace DataLayer.RepositoryImpl
{
    public class ProductoRepositoryImpl : IProductoRepository
    {
        private TamboContext context;

        public ProductoRepositoryImpl()
        {
            context = new TamboContext();
        }

        public bool Delete(Productos t)
        {
            try
            {
                context.Entry(t).State = EntityState.Deleted;
                context.SaveChanges();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

        public List<Productos> FindAll()
        {
            return context.Productos.ToList();
        }

        public Productos FindById(int? id)
        {
            return context.Productos
                .Find(id);
        }

        public bool Save(Productos t)
        {
            try
            {
                context.Entry(t).State = EntityState.Added;
                context.SaveChanges();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

        public bool Update(Productos t)
        {
            try
            {
                context.Entry(t).State = EntityState.Modified;
                context.SaveChanges();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}
}

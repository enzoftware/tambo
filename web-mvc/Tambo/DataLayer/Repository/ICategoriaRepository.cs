﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities_Layer;

namespace DataLayer.Repository
{
    public interface ICategoriaRepository : CrudRepository<Categorias>
    {
        List<Categorias> findByName(string name);
    }
}

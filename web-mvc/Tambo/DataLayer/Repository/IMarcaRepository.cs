﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities_Layer;

namespace DataLayer.Repository
{
    public interface IMarcaRepository : CrudRepository<Marcas>
    {

        List<Marcas> findByNombre(string name);
    }
}

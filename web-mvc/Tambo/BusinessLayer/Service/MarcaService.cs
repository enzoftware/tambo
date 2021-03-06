﻿using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities_Layer;

namespace BusinessLayer.Service
{
    public interface MarcaService : CrudService<Marcas>
    {
        List<Marcas> findByNombre(string name);
    }
}

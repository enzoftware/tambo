﻿using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities_Layer;

namespace BusinessLayer.Service
{
    public interface TiendaService : CrudService<Tiendas>
    {
        List<Tiendas> findByName(string name);
    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class DetalleVenta
    {
        private Producto ObjProducto { get; set; }
        private Venta objVenta { get; set; }
        private int Cantidad { get; set; }
        private double SubTotal { get; set; }
    }
}

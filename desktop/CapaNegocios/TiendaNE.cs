﻿using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocios
{
    public class TiendaNE
    {

        private  TiendaDAO  tiendaDAO;

        public TiendaNE()
        {
            tiendaDAO = new TiendaDAO();
        }

        public DataTable ListarTiendaProducto(int idProducto)
        {
            return tiendaDAO.ListarTiendaProducto(idProducto);
        }

        public DataTable ListarTienda()
        {
            return tiendaDAO.ListarTiendas();
        }

        public DataTable ListarDetalleInventario(int idInventario)
        {
            return tiendaDAO.ListarDetalleInventario(idInventario);
        }

        public int RegistrarTienda(Tienda tienda)
        {
            return tiendaDAO.RegistrarTienda(tienda);
        }
    }
}

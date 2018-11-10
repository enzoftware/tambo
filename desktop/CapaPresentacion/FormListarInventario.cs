﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocios;

namespace CapaPresentacion
{
    public partial class FormListarInventario : Form
    {
        private InventarioNE inventario;

        public FormListarInventario()
        {
            InitializeComponent();
            inventario = new InventarioNE();
        }

        private void FormListarInventario_Load(object sender, EventArgs e)
        {
            DGInventario.DataSource = inventario.ListarInventario();
        }
    }
}

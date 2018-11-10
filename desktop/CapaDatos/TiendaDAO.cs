﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaDatos
{
    public class TiendaDAO
    {
        Conexion conexion = new Conexion();
        SqlConnection sqlConnection = new SqlConnection();

        public DataTable ListarDetalleInventario(int idInventario)
        {
            sqlConnection = conexion.GetConnection();

            SqlCommand cmd = new SqlCommand("SP_LISTAR_DETALLE_INVENTARIO", sqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@IDINVENTARIO", SqlDbType.Int).Value = idInventario;

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
           
            return dt;
        }

        public DataTable ListarTiendaProducto(int idProducto)
        {
            sqlConnection = conexion.GetConnection();

            SqlCommand cmd = new SqlCommand("SP_LISTAR_TIENDA_PRODUCTO", sqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ID_PRODUCTO", SqlDbType.Int).Value = idProducto;

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            return dt;
        }

        public DataTable ListarTiendas()
        {
            sqlConnection = conexion.GetConnection();
            SqlDataAdapter adapter = new SqlDataAdapter("SP_LISTAR_TIENDAS", sqlConnection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            return dataTable;
        }

        public int RegistrarTienda(Tienda tienda)
        {
            sqlConnection = conexion.GetConnection();
            sqlConnection.Open();

            using (SqlTransaction tr = sqlConnection.BeginTransaction(IsolationLevel.Serializable))
            {
                SqlCommand cmd = new SqlCommand("SP_REGISTRAR_TIENDA", sqlConnection, tr);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar).Value = tienda.Nombre;
                cmd.Parameters.Add("@TELEFONO", SqlDbType.VarChar).Value = tienda.Telefono;
                cmd.Parameters.Add("@DIRECCION", SqlDbType.VarChar).Value = tienda.Direccion;
                cmd.Parameters.Add("@ID_INVENTARIO", SqlDbType.Int).Value = tienda.ObjInventario.Id;

                // COMO SE AGREGA ID INVENTARIO ???

                try
                {
                    int n = cmd.ExecuteNonQuery();
                    tr.Commit();
                    return n;
                }
                catch (Exception e)
                {
                    tr.Rollback();
                    Console.WriteLine(e);
                    throw;
                }

            }
        }

    }
}

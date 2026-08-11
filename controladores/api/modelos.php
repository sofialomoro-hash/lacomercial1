<?php
   require_once "config.php";
   
   class Conexion {
      // Propiedades
      protected $db;

      // Método constructor
      public function __construct() {
         $this->db = new mysqli(DB_HOST,DB_USER,DB_PASS,DB_NAME);

         if( $this->db->connect_errno ) {
            echo "Fallo al conectar a MySQL: " . $this->db->connect_error;
            return;   
         }

         $this->db->set_charset(DB_CHARSET);
         $this->db->query("SET NAMES 'utf8'");
      }
   }
?>
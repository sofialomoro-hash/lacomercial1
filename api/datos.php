<?php

header("Content-Type: application/json; charset=utf-8");

// Requerimos el archivo modelos.php
require_once 'modelos.php';
require_once 'auth.php';

// Si hay en parámetro tabla
if(isset($_GET['tabla'])) { // Si está seteado el parámetro tabla
    $tabla = new Modelo($_GET['tabla']); // Creamos el objeto tabla

    if(isset($_GET['id'])) { // Si está seteado el id
        $tabla->setCriterio("id=" . $_GET['id']); // Establecemos el criterio
    }

    if(isset($_GET['accion'])) {
        if($_GET['accion'] == 'insertar' || $_GET['accion'] == 'actualizar' || $_GET['accion'] == 'eliminar') {
            $valores = $_POST; // Guardamos los valores que vienen desde el formulario

            //**** SUBIDA DE IMÁGENES ****//
            if(                                        // Si
                isset($_FILES) &&                      // Está seteado en $_FILES Y
                isset($_FILES['imagen']) &&            // Está seteado imagen dentro de $_FILES 
                !empty($_FILES['imagen']['name']) &&    // Si NO está vacío el nombre Y
                !empty($_FILES['imagen']['tmp_name']) // El nombre temporal
            ) {
                if(is_uploaded_file($_FILES['imagen']['tmp_name'])) {
                    $nombre_temporal = $_FILES['imagen']['tmp_name'];
                    $nombre = $_FILES['imagen']['name'];
                    $destino = '../imagenes/productos/' . $nombre;

                    if(move_uploaded_file($nombre_temporal, $destino)) {
                        $respuesta = [
                            'success' => true,
                            'message' => 'Archivo subido correctamente a ' . $destino
                        ];
                        $valores['imagen'] = $nombre;
                    } else{
                        $respuesta = [
                            'success' => false,
                            'message' => 'No se ha podido subir el archivo'
                        ];
                        unlink(ini_get('upload_tmp_dir') . $nombre_temporal);
                    }
                } else {
                    $respuesta = [
                        'success' => false,
                        'message' => 'El archivo no fue procesado correctamente'
                    ];
                }
            }
        }

        switch($_GET['accion']) {
            case 'seleccionar':
                $datos = $tabla->seleccionar(); // Ejecutamos el método seleccionar
                echo json_encode($datos); // Mostramos los datos
                break;

            case 'insertar':
                $usuario = validarToken(['cliente', 'admin']);
                // Ejecutamos el método insertar y capturamos el ID
                $id = $tabla->insertar($valores);

                // Verificamos si se obtuvo un ID válido
                if($id > 0) {
                    $respuesta = [
                        'success' => true,
                        'message' => 'Registro insertado correctamente',
                        'id' => $id
                    ];
                } else {
                    // En caso de que falte la inserción
                    $respuesta = [
                        'success' => false,
                        'message' => 'Error al insertar el registro'
                    ];
                }

               // Siempre enviamos la respuesta JSON al final
                echo json_encode($respuesta);
                break;

                case 'actualizar':
                    $usuario = validarToken(['cliente', 'admin']);
                    $tabla->actualizar($valores);
                    $respuesta = [
                        'success' => true,
                        'message' => 'Registro actualizado con éxito'
                    ];
                    echo json_encode($respuesta);
                    break;

                case 'eliminar':
                    $usuario = validarToken(['admin']);
                    $tabla->eliminar();
                    $respuesta = [
                        'success' => true,
                        'message' => 'Registro eliminado con éxito'
                    ];
                    echo json_encode($respuesta);
                    break;
        }

    }

}
?>
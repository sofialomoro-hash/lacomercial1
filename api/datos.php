<?php
// Requerimos el archivo modelos.php
require_once 'modelos.php';
// Si hay en parámetro tabla
if(isset($_GET['tabla'])) { // Si está seteado el parámetro tabla
    $tabla = new Modelo($_GET['tabla']); // Creamos el objeto tabla

    if(isset($_GET['criterio'])) { // Si está seteado el id
        $tabla->setCriterio("id=" . $_GET['id']); // Establecemos el criterio
    }

    if(isset($_GET['accion'])) {
        if($_GET['accion'] == 'insertar' || $_GET['accion'] == 'actualizar' || $_GET['accion'] == 'eliminar') {
            $valores = $_POST;
        }

        switch($_GET['accion']) {
            case 'seleccionar':
                $datos = $tabla->seleccionar(); // Ejecutamos el método seleccionar
                echo $datos;
                break;
            case 'insertar':
                $id = $tabla->insertar($valores);

                if($id > 0) {
                    $respuesta = [
                        'success' => true,
                        'message' => 'Registro insertado correctamente',
                        'id' => $id
                    ];
                } else {
                    $respuesta = [
                        'success' => false,
                        'message' => 'Error al insertar el registro'
                    ];
                }

                echo json_encode($respuesta);
                break;

                case 'actualizar':
                    $tabla->actualizar($valores);
                    $respuesta = [
                        'success' => true,
                        'message' => 'Registro actualizado con éxito'
                    ];
                    echo json_encode($respuesta);
                    break;

                case 'eliminar':
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
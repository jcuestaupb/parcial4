CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    correo TEXT UNIQUE NOT NULL,
    telefono TEXT NOT NULL
);

CREATE TABLE Productos (
    id_producto INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio REAL NOT NULL,
    stock INTEGER NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    fecha TEXT NOT NULL,
    total REAL NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalles_Pedido (
    id_detalle INTEGER PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    metodo_pago TEXT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Insertar datos en Clientes
INSERT INTO Clientes (id_cliente, nombre, correo, telefono) VALUES
(1, 'Julián Cadavid', 'julian.cadavid@upb.edu.co', '3244217430'),
(2, 'Diana Martinez', 'diana.martinez@upb.edu.co', '3206718753');

-- Insertar datos en Productos
INSERT INTO Productos (id_producto, nombre, precio, stock) VALUES
(1, 'PlayStation 5', 500, 10),
(2, 'Xbox Series S', 400, 15),
(3, 'Nintendo Switch', 400, 20);

-- Insertar datos en Pedidos
INSERT INTO Pedidos (id_pedido, id_cliente, fecha, total) VALUES
(20, 1, '2025-03-08', 1800),
(21, 2, '2025-02-26', 400);

-- Insertar datos en Detalles_Pedido
INSERT INTO Detalles_Pedido (id_detalle, id_pedido, id_producto, cantidad, metodo_pago) VALUES
(20, 20, 1, 1, 'tarjeta'),
(21, 20, 2, 1, 'tarjeta'),
(22, 21, 3, 1, '500 tarjeta, 300 efectivo');

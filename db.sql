DROP DATABASE IF EXISTS Recyclapp;
CREATE DATABASE Recyclapp;
USE Recyclapp;

CREATE TABLE Product (
    id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(300),
    tipo VARCHAR(100),
    tips VARCHAR(1000),
    img VARCHAR(1000)
);

DELIMITER //
CREATE PROCEDURE getProducts()
BEGIN
    SELECT * FROM Product;
END //
DELIMITER ;

DELIMITER ..
CREATE PROCEDURE getProduct(
	IN idProduct VARCHAR(100)
)
	BEGIN
		SELECT * FROM Product
		WHERE id = idProduct;
	END ..
DELIMITER ;

INSERT INTO Product VALUES 
('7501125104268', 'Electrolit 625ml', 'Plástico', 'Sepárala de otros residuos y llévala a un centro de reciclaje. Estas botellas suelen estar hechas de plásticos especiales, sigue las directrices locales para garantizar un reciclaje adecuado, evita mezclar plásticos y asegúrate de que esté limpia y vacía antes de reciclar.', 'electrolit.jpg'),

('7501086801077', 'E-Pura 10L', 'Plástico', 'Debido a su mayor tamaño, asegúrate de manejarla con cuidado y, si es posible, comprueba las regulaciones locales sobre el reciclaje de envases de gran volumen. Limpia y vacía la botella antes de reciclar para facilitar el proceso .', 'epura10l.jpg'),

('7501008018125', 'Choco Krispis 290g', 'Cartón', 'Primero, asegúrate de vaciarla y, segundo, llévala al contenedor de reciclaje de papel y cartón.', 'chococrispis.jpg'),

('7500533003880', 'Agua Purificada 355ml', 'Plástico', 'Vacía, retira etiquetas, coloca en el contenedor de reciclaje y participa en programas locales de recogida de reciclaje.', 'agua355ml.jpg'),

('758104005796', 'Bonafont 1.2L', 'Plástico', 'Retira etiquetas y tapa, y colócala en el contenedor de reciclaje de plástico. Asegúrate de llevar regularmente los materiales reciclables a los centros locales de reciclaje o participar en programas de recogida de reciclaje de tu comunidad.', 'bonafont.webp'),

('7501025405090', 'Cloralex 600ml', 'Plástico', 'Antes de reciclar, asegúrate de vaciar completamente la botella. Enjuágala para eliminar cualquier residuo de cloro. Retira la tapa y, si es posible, quita la etiqueta de papel. Limpiar y separar los componentes mejora la eficiencia del reciclaje.', 'cloralex600.jpg'),

('4542655000005', 'Galletas', 'Plastico', 'Luego de disfrutar las galletas, vacía y lava el contenedor. Si tiene tapa, sepárala. Si hay alguna etiqueta de papel, retírala. Limpiar el plástico facilita el proceso de reciclaje y asegura que no haya residuos.', 'galletas.jpg'),

('014563000254', 'Avena', 'Cartón', 'Antes de reciclar, asegúrate de vaciar y limpiar bien el bote. Si tiene tapa, sepárala. Retira cualquier etiqueta de papel. Separa el cartón del aluminio si es posible, ya que estos materiales se reciclan de manera diferente.', 'avena.jpg'),

('7501035910089', 'Ajax', 'Aluminio', 'Vacía la lata y, para mejorar el proceso de reciclaje, enjuágala para eliminar cualquier resto de polvo. Si hay una tapa, sepárala. El aluminio limpio se recicla más eficientemente.', 'ajax.jpg'),

('7501058628473', 'Nescafé Decaf', 'Cristal', 'Después de disfrutar del café, limpia el bote a fondo para eliminar cualquier residuo de café. Retira la etiqueta si es posible. Separa la tapa del bote, ya que el vidrio y el metal se reciclan por separado.', 'cafedecaf.jpg'),

('078742268477', 'Nueces mixtas', 'Plástico', 'Antes de reciclar, asegúrate de vaciar completamente el contenedor. Puedes enjuagarlo para eliminar residuos. Si tiene tapa, sepárala antes de reciclar. Esto facilitará el proceso de reciclaje y garantizará que el plástico esté limpio.', 'nueces.jpg');

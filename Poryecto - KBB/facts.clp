;; Factsde productos

(deffacts factsProductos
;; CELULARES
(celulares (marca apple) (modelo iphone16) (precio 27000) (ram 6) (stock 25))
(celulares (marca samsung) (modelo note21) (precio 22000) (ram 8) (stock 40))
(celulares (marca xiaomi) (modelo redmiNote12) (precio 8500) (ram 4) (stock 70))
(celulares (marca motorola) (modelo edge30) (precio 13000) (ram 6) (stock 20))
(celulares (marca huawei) (modelo p50) (precio 18000) (ram 6) (stock 15))

;; COMPUTADORAS
(computadoras (marca apple) (modelo macbookair) (tipo laptop) (ram 8) (cpu m2) (gpu integrada) (precio 47000) (stock 12))
(computadoras (marca dell) (modelo inspiron15) (tipo laptop) (ram 16) (cpu i7) (gpu integrada) (precio 32000) (stock 20))
(computadoras (marca hp) (modelo omen) (tipo escritorio) (ram 16) (cpu i9) (gpu rtx3060) (precio 48000) (stock 10))
(computadoras (marca lenovo) (modelo thinkpad) (tipo laptop) (ram 8) (cpu i5) (gpu integrada) (precio 25000) (stock 25))
(computadoras (marca acer) (modelo nitro5) (tipo escritorio) (ram 16) (cpu i7) (gpu rtx3050) (precio 37000) (stock 14))

;; ACCESORIOS
(accesorios (marca logitech) (nombre mouseG203) (tipo mouse) (precio 500) (stock 20))
(accesorios (marca apple) (nombre airpods) (tipo audifonos) (precio 3600) (stock 30))
(accesorios (marca redragon) (nombre kumaraK552) (tipo teclado) (precio 1200) (stock 5))
(accesorios (marca samsung) (nombre budsLive) (tipo audifonos) (precio 2500) (stock 9))
(accesorios (marca genius) (nombre mouseNX7000) (tipo mouse) (precio 300) (stock 30))

;; CLIENTES
(cliente (id 1) (nombre "Luis") (edad 25))
(cliente (id 2) (nombre "Ana") (edad 33))
(cliente (id 3) (nombre "Carlos") (edad 41))
(cliente (id 4) (nombre "María") (edad 29))
(cliente (id 5) (nombre "Pedro") (edad 19))

;; TARJETAS DE CREDITO
(tarjetas (banco banamex) (grupo credito) (exp-date 20260201))
(tarjetas (banco liverpool) (grupo credito) (exp-date 20250108))
(tarjetas (banco bbva) (grupo debito) (exp-date 20240515))
(tarjetas (banco santander) (grupo credito) (exp-date 20271231))
(tarjetas (banco hsbc) (grupo debito) (exp-date 20280930))

;; VALES
(vale (cliente-id 1) (monto 1100))
(vale (cliente-id 2) (monto 1200))
(vale (cliente-id 3) (monto 1300))
(vale (cliente-id 4) (monto 1400))
(vale (cliente-id 5) (monto 1500))

;; ORDENES DE COMPRA
(orden (cliente-id 2) (categoria computadora) (producto macbookair) (qty 1) (forma-pago contado))
(orden (cliente-id 4) (categoria accesorio) (producto kumaraK552) (qty 2) (forma-pago santander))
(orden (cliente-id 5) (categoria celular) (producto note21) (qty 21) (forma-pago contado))
)

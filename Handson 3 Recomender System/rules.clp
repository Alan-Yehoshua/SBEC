
;; 1. iPhone16 + Banamex → 24 meses sin intereses
(defrule promo-iphone-bmx
   (orden (producto iphone16) (forma-pago banamex))
   =>
   (printout t "OFERTA: iPhone16 con Banamex → 24 meses sin intereses" crlf))

;; 2. Note21 + Liverpool → 12 meses sin intereses
(defrule promo-note21-lvp
   (orden (producto note21) (forma-pago liverpool))
   =>
   (printout t "OFERTA: Note21 con Liverpool → 12 MSI" crlf))

;; 3. Compra de celular → sugerir accesorios
(defrule sugerir-accesorios-cel
   (orden (categoria celular))
   =>
   (printout t "RECOMENDACIÓN: Funda y mica con 15% descuento" crlf))

;; 4. Mayorista si qty > 9
(defrule clasificar-mayorista
   (orden (cliente-id ?cliente-id) (producto ?prod) (qty ?q&:(> ?q 9)))
   =>
   (printout t "Cliente " ?cliente-id " clasificado como MAYORISTA" crlf))

;; 5. Menudista si qty < 10
(defrule clasificar-menudista 
   (orden (cliente-id ?cliente-id) (producto ?prod) (qty ?q&:(<= ?q 9)))
   =>
   (printout t "Cliente " ?cliente-id " clasificado como MENUDISTA" crlf))

;; 6. stock de accesorios → mostrar promoción 2x1 si hay suficiente stock
(defrule promo-accesorio-stock
   (accesorios (nombre ?a) (stock ?s&:(>= ?s 10)))
   =>
   (printout t "Posible promocion de 2x1 en accesorios " ?a crlf))

;; 6.1 Venta de accesorio → mostrar promoción 2x1 si hay suficiente stock
(defrule promo-accesorio-stock
   (orden (categoria accesorio) (producto ?a) (qty ?q))
   (accesorios (nombre ?a) (stock ?s))
   (test (>= (- ?s ?q) 10))
   =>
   (printout t "PROMOCIÓN: 2x1 en accesorios " ?a crlf))

;; 7. Compra con tarjeta vencida → advertencia
(defrule tarjeta-vencida
   (orden (forma-pago ?banco))
   (tarjetas (banco ?banco) (exp-date ?fecha&:(< ?fecha 20250508)))
   =>
   (printout t "CANCELACION DE VENTA | TARJETA VENCIDA del banco " ?banco crlf))

;; 8. iPhone comprado → sugerir AirPods
(defrule sugerir-airpods
   (orden (producto iphone16))
   =>
   (printout t "RECOMENDACIÓN: Aprovecha descuento en AirPods con tu iPhone" crlf))

;; 9. MacBookAir comprado → sugerir mouse Logitech
(defrule sugerir-mouse
   (orden (producto macbookair))
   =>
   (printout t "RECOMENDACIÓN: Añade un Mouse Logitech con 10% desc." crlf))

;; 10. Si el cliente es menor de 25 años → recomendar productos más baratos
(defrule jovenes-productos-economicos
   (cliente (id ?id) (edad ?e&:(< ?e 25)))
   =>
   (printout t "RECOMENDACIÓN: Revisa opciones económicas como Redmi o Genius Mouse" crlf))

;; 11. Cliente con vale y pago de contado en CELULAR → aplicarlo
(defrule aplicar-vale-celular
   (declare (salience 10))
   (orden (cliente-id ?id) (forma-pago contado) (categoria celular) (producto ?p))
   (celulares (modelo ?p) (precio ?s))
   (vale (cliente-id ?id) (monto ?m))
   =>
   (bind ?total (- ?s ?m))
   (printout t "APLICANDO: Vale de $" ?m " al cliente " ?id
               " por compra de celular al contado." crlf
               "TOTAL A PAGAR: $" ?total crlf))

;; 12. Compra MacBook y qty > 1 → descuento empresarial
(defrule compra-empresarial
   (orden (producto macbookair) (qty ?q&:(> ?q 1)))
   =>
   (printout t "OFERTA: Descuento empresarial en MacBooks de 10%" crlf))

;; 13. Cliente > 40 años → sugerir computadoras tipo escritorio
(defrule edad-avanzada-escritorio
   (cliente (id ?id) (edad ?e&:(> ?e 40)))
   (orden (cliente-id ?id)(categoria computadora))
   =>
   (printout t "SUGERENCIA: Computadoras de escritorio para mayor comodidad" crlf))

;; 14. Si stock de cualquier celular < 10 → alerta
(defrule alerta-stock-bajo-cel
   (celulares (modelo ?m) (stock ?s&:(< ?s 10)))
   =>
   (printout t "ALERTA: Stock bajo en modelo " ?m crlf))

;; 14.1 Si stock de cualquier accesorio < 10 → alerta
(defrule alerta-stock-bajo-cel
   (accesorios (nombre ?n) (stock ?s&:(< ?s 10)))
   =>
   (printout t "ALERTA: Stock bajo en accesorio: " ?n crlf))

;; 15. Compró laptop → recomendar mochila
(defrule mochila-para-laptop
   (orden (producto ?p&macbookair|inspiron15|thinkpad))
   =>
   (printout t "RECOMENDACIÓN: Agrega mochila especial para tu laptop" crlf))

;; 16. Mouse Logitech comprado → ofrecer combo con teclado
(defrule combo-logitech
   (orden (producto mouseG203))
   =>
   (printout t "OFERTA: Combo Logitech con teclado G213 a precio especial" crlf))

;; 17. Compra grande (qty > 20) → bono sorpresa
(defrule compra-grande-bono
   (orden (producto ?prod) (qty ?q&:(> ?q 20)))
   =>
   (printout t "RECOMPENSA: Compra grande aplica un bono sorpresa incluido" crlf))

;; 18. Compra Apple → extender garantía
(defrule garantia-apple
   (orden (producto ?p&iphone16|macbookair))
   =>
   (printout t "BONUS: Garantía extendida gratuita por 1 año" crlf))

;; 19. Cliente joven + compra MacBook → paquete estudiante
(defrule estudiante-macbook
   (cliente (id ?id) (edad ?e&:(<= ?e 25)))
   (orden (cliente-id ?id) (producto macbookair))
   =>
   (printout t "OFERTA: Paquete estudiante con Office y mochila" crlf))

;; 20. Actualizar stock celular si la tarjeta es válida
(defrule actualizar-stock-celular
   ?o <- (orden (categoria celular) (producto ?modelo) (qty ?q) (cliente-id ?id) (forma-pago ?fp))
   ?p <- (celulares (modelo ?modelo) (stock ?s) (marca ?marca) (precio ?precio) (ram ?ram))
   ;; Si es pago con tarjeta conocida, buscamos que esté vigente
   (or (and (tarjetas (banco ?fp) (exp-date ?fecha&:(>= ?fecha 20250508))))
       (test (not (or (eq ?fp banamex) (eq ?fp liverpool) (eq ?fp bbva) (eq ?fp santander)))))
   (test (>= ?s ?q))
   =>
   (retract ?p)
   (assert (celulares (marca ?marca) (modelo ?modelo) (precio ?precio)
                      (ram ?ram) (stock (- ?s ?q))))
   (retract ?o)
   (printout t "STOCK ACTUALIZADO: Celular " ?modelo " → nuevo stock: " (- ?s ?q) crlf))

;; 21. Actualizar stock computadora con validación de tarjeta
(defrule actualizar-stock-compu
   ?o <- (orden (categoria computadora) (producto ?modelo) (qty ?q) (cliente-id ?id) (forma-pago ?fp))
   ?p <- (computadoras (modelo ?modelo) (stock ?s) (marca ?marca) (precio ?precio) (ram ?ram) (cpu ?cpu) (tipo ?tipo) (gpu ?gpu))
   (or (and (tarjetas (banco ?fp) (exp-date ?fecha&:(>= ?fecha 20250508))))
       (test (not (or (eq ?fp banamex) (eq ?fp liverpool) (eq ?fp bbva) (eq ?fp santander)))))
   (test (>= ?s ?q))
   =>
   (retract ?p)
   (assert (computadoras (marca ?marca) (modelo ?modelo) (precio ?precio)
                         (ram ?ram) (cpu ?cpu) (tipo ?tipo)
                         (gpu ?gpu) (stock (- ?s ?q))))
   (retract ?o)
   (printout t "STOCK ACTUALIZADO: Computadora " ?modelo " → nuevo stock: " (- ?s ?q) crlf))

;; 22. Actualizar stock accesorio con validación de tarjeta
(defrule actualizar-stock-accesorio
   ?o <- (orden (categoria accesorio) (producto ?nombre) (qty ?q) (cliente-id ?id) (forma-pago ?fp))
   ?p <- (accesorios (nombre ?nombre) (stock ?s) (marca ?marca) (precio ?precio) (tipo ?tipo))
   (or (and (tarjetas (banco ?fp) (exp-date ?fecha&:(>= ?fecha 20250508))))
       (test (not (or (eq ?fp banamex) (eq ?fp liverpool) (eq ?fp bbva) (eq ?fp santander)))))
   (test (>= ?s ?q))
   =>
   (retract ?p)
   (assert (accesorios (marca ?marca) (nombre ?nombre)
                       (tipo ?tipo) (precio ?precio)
                       (stock (- ?s ?q))))
   (retract ?o)
   (printout t "STOCK ACTUALIZADO: Accesorio " ?nombre " → nuevo stock: " (- ?s ?q) crlf))
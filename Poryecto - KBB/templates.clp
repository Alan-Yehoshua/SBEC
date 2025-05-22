;; Templates de productos

(deftemplate celulares
(slot marca)
(slot modelo)
(slot precio)
(slot ram)
(slot stock)) 

(deftemplate computadoras
(slot marca)
(slot modelo)
(slot ram)
(slot cpu)
(slot tipo) ;; tipo: escritorio/laptop
(slot precio)
(slot gpu)
(slot stock))

(deftemplate accesorios
(slot marca)
(slot nombre)
(slot tipo)  ;; tipo: audifonos/mouse/teclados
(slot precio)
(slot stock)) 

(deftemplate cliente
(slot id) 
(slot nombre) 
(slot edad) 
(slot tipo)) ;; tipo mayorista/menudista

(deftemplate orden
(slot cliente-id)
(slot categoria)     ;; celular / compu / accesorio
(slot producto)      ;; modelo/nombre
(slot qty)
(slot forma-pago))   ;; contado / tarjeta / vales

(deftemplate tarjetas
(slot banco)
(slot grupo) ;; grupo: Visa/MarterCard
(slot exp-date))

(deftemplate vale
(slot cliente-id) 
(slot monto))
;; Cargar estructuras
(load "templates.clp")

;; Cargar hechos
(load "facts.clp")

;; Cargar las reglas del sistema recomendador
(load "rules.clp")

;; Inicializar memoria de trabajo
(reset)

;; Ejecutar el sistema
(run)

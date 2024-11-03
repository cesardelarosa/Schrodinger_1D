# Makefile para compilar el código Octave y el documento LaTeX

# Variables
OCTAVE = octave --silent --no-gui
LATEX = pdflatex
MAIN_M = main.m
RUN_POTENTIAL_M = run_potential.m
MAIN_TEX = main.tex
LOG_FILE = bin/compilation.log

# Colores
GREEN = \033[0;32m
RED = \033[0;31m
YELLOW = \033[0;33m
RESET = \033[0m

# Regla principal para correr todo
all: run_all compile_pdf

# Correr el código en Octave para todos los potenciales
run_all:
	@echo -e "${YELLOW}Ejecutando todos los potenciales...${RESET}"
	@$(OCTAVE) --eval "run('$(MAIN_M)')"
	@echo -e "${GREEN}Código ejecutado correctamente.${RESET}"

# Correr un potencial específico
run_potential:
	@echo -e "${YELLOW}Ejecutando un potencial específico...${RESET}"
	@$(OCTAVE) --eval "run('$(RUN_POTENTIAL_M)')"
	@echo -e "${GREEN}Código ejecutado correctamente.${RESET}"

# Compilar el documento LaTeX
compile_pdf:
	@echo -e "${YELLOW}Creando directorio /bin...${RESET}"
	@mkdir -p bin
	@echo -e "${YELLOW}Compilando LaTeX...${RESET}"
	@{ \
		$(LATEX) -output-directory=bin $(MAIN_TEX) > $(LOG_FILE) 2>&1; \
		if [ $$? -eq 0 ]; then \
			echo -e "${GREEN}PDF generado correctamente.${RESET}"; \
		else \
			echo -e "${RED}Error en la compilación de LaTeX. Consulta ${LOG_FILE} para más detalles.${RESET}"; \
		fi; \
	}
	@mv bin/main.pdf .

# Limpiar archivos auxiliares
clean:
	@echo -e "${YELLOW}Limpiando archivos temporales...${RESET}"
	@rm -f bin/*.aux bin/*.log bin/*.out
	@rm -f img/*.png
	@echo -e "${GREEN}Archivos temporales eliminados.${RESET}"

# Limpiar todo
fclean: clean
	@rm -rf bin

.PHONY: all run_all run_potential compile_pdf clean fclean

# Makefile para compilar el código Octave y el documento LaTeX

# Variables
OCTAVE = octave
LATEX = pdflatex
MAIN_M = main.m
MAIN_TEX = doc/main.tex
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
	$(OCTAVE) --silent --eval "run('main.m')"
	@echo -e "${GREEN}Código ejecutado correctamente.${RESET}"

# Correr un potencial específico
run_%:
	@echo -e "${YELLOW}Ejecutando Potencial $*...${RESET}"
	$(OCTAVE) --silent --eval "config; process_potential(potentials{get_potential_index('$*'), :}); pause;"
	@echo -e "${GREEN}Código ejecutado correctamente.${RESET}"

# Compilar el documento LaTeX
compile_pdf:
	@echo -e "${YELLOW}Creando directorio /bin...${RESET}"
	mkdir -p bin
	@echo -e "${YELLOW}Compilando LaTeX...${RESET}"
	$(LATEX) -output-directory=bin $(MAIN_TEX) > $(LOG_FILE) 2>&1 && \
	echo -e "${GREEN}PDF generado en /bin.${RESET}" || \
	echo -e "${RED}Error en la compilación de LaTeX. Consulta ${LOG_FILE} para más detalles.${RESET}"

# Limpiar archivos auxiliares
clean:
	@echo -e "${YELLOW}Limpiando archivos temporales...${RESET}"
	rm -f bin/*.aux bin/*.log bin/*.out
	rm -f img/*.png
	@echo -e "${GREEN}Archivos temporales eliminados.${RESET}"

# Limpiar todo
fclean: clean
	rm -rf bin

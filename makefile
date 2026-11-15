COMPILADOR = g++
CXXFLAGS = -Iinclude -g -O0

# Diretorio dos arquivos objeto (.o)
OBJ_DIR = obj

# Todos os arquivos .cpp do projeto
FONTES = $(shell find src -type f -name "*.cpp")

# Caminhos dos arquivos objeto
OBJ = $(patsubst src/%.cpp,$(OBJ_DIR)/%.o,$(FONTES))

# Todos os cabecalhos
CABECALHOS = $(shell find src include -type f \( -name "*.h" -o -name "*.hpp" \) 2>/dev/null)

# Regra de compilacao dos .cpp
$(OBJ_DIR)/%.o: src/%.cpp $(CABECALHOS)
	@mkdir -p $(dir $@)
	$(COMPILADOR) $(CXXFLAGS) -c $< -o $@

# Linkagem
ROGUELIKE: $(OBJ)
	$(COMPILADOR) -o $@ $^

.PHONY: clean

clean:
	rm -rf $(OBJ_DIR) ROGUELIKE
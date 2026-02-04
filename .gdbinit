# Configurações para debugging de Assembly

# Usa sintaxe Intel (ao invés de AT&T)
set disassembly-flavor intel

# Mostra layout de assembly e registradores
layout asm
layout regs

# Exibe automaticamente a próxima instrução
display/i $pc

# Mostra 10 instruções ao redor do $pc
set disassemble-next-line on

# Ativa cores no GDB (se suportado)
set style enabled on

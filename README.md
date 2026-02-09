# E-commerce Database

Este projeto contém o **schema do banco de dados** para um sistema de e-commerce, incluindo tabelas de clientes, produtos, pedidos e categorias.

## Tabelas principais

- **Clientes**: armazena informações do cliente, CPF e data de nascimento.
- **Endereço**: endereços dos clientes.
- **Telefone**: telefones dos clientes.
- **Email**: emails dos clientes.
- **Categoria_Produto**: categorias dos produtos.
- **Produto**: produtos disponíveis para venda.
- **Pedido**: informações dos pedidos realizados.
- **ItemPedido**: itens de cada pedido.

## Recursos

- Chaves primárias e estrangeiras para manter a integridade referencial.
- Constraints para validação de CPF e status de pedidos.
- Defaults para campos que precisam de valor padrão (ex: status da categoria de produto).

## Como usar

1. Clonar o repositório:  
   ```bash
   git clone <URL_DO_REPOSITORIO>



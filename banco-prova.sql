-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 30/06/2025 às 23:36
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco-prova`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome_empresa` varchar(100) NOT NULL,
  `telefone_principal` varchar(20) DEFAULT NULL,
  `email_principal` varchar(100) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome_empresa`, `telefone_principal`, `email_principal`, `endereco`) VALUES
(1, 'ACME Ltda', '11-1234-5678', 'contato@acme.com', 'Rua A, 123'),
(2, 'Beta Serviços', '21-8765-4321', 'suporte@beta.com', 'Av. B, 456'),
(3, 'Conecta Tecnologia', '31-3456-7890', 'tech@conecta.com', 'Rua das Flores, 50'),
(4, 'Ótimo Logística', '41-2222-3333', 'log@otimo.com', 'Av. Central, 789'),
(5, 'Soluções TI', '51-9999-8888', 'info@solucoesti.com', 'Rua dos Andradas, 150'),
(6, 'ConstruPlus', '61-4002-5000', 'contato@construplus.com', 'Av. Brasil, 1000'),
(7, 'Limpeza & Cia', '71-8888-7777', 'serv@limpezacia.com', 'Rua do Comércio, 200'),
(8, 'Doutor Carro', '81-7777-6666', 'auto@doutorcarro.com', 'Av. 7 de Setembro, 321');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `fornecedor_id`, `titulo`, `preco`) VALUES
(1, 1, 'Instalação Elétrica Residencial', 250.00),
(2, 1, 'Manutenção Elétrica Comercial', 450.00),
(3, 2, 'Manutenção de Computadores', 150.00),
(4, 2, 'Formatação de HD', 120.00),
(5, 3, 'Suporte em Rede', 200.00),
(6, 4, 'Frete Carga Leve', 300.00),
(7, 5, 'Instalação de Software', 100.00),
(8, 6, 'Construção de Muro', 800.00),
(9, 7, 'Limpeza Pós-Obra', 400.00),
(10, 8, 'Troca de Óleo Automotivo', 120.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome_usuario` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome_usuario`, `senha`) VALUES
(1, 'admin', '$2y$10$NcpbYWjQTA0/VzCyaF13Muwl.e.J/0NqWBopYTunxARip/Ez1WYAa'),
(3, 'carlos', '1234');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fornecedor_id` (`fornecedor_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_usuario` (`nome_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

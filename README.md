### Simulação de Ataque de Força Bruta com Medusa e Kali Linux

<p align="center">
  <img src="images/logo medusa.png" width="350" alt="Medusa Logo" />
  <img src="images/kali-logo.png" width="350" alt="Kali Linux Logo" />
</p>

Neste projeto, foi realizada uma simulação de ataque de força bruta (*Brute Force*) utilizando a ferramenta **Medusa** no ambiente **Kali Linux**. Os testes foram conduzidos em três protocolos de rede: **FTP (transferência de arquivos), HTTP (comunicação web) e SMB (compartilhamento de arquivos e recursos)**, com o objetivo de compreender o funcionamento desse tipo de ataque e identificar possíveis vulnerabilidades relacionadas à segurança de autenticação.

O ataque de força bruta é uma técnica utilizada na área de cibersegurança que consiste em realizar tentativas sistemáticas para descobrir credenciais de acesso, como nomes de usuário e senhas. Esse processo pode ser executado por ferramentas automatizadas, que testam diferentes combinações de caracteres até encontrar uma correspondência válida. Sua eficácia está diretamente relacionada à complexidade das senhas e à existência de mecanismos de proteção contra tentativas consecutivas de autenticação.

Existem diferentes modalidades de ataques de força bruta, cada uma com características e estratégias próprias:

- **Ataque de força bruta simples:** consiste em testar diferentes combinações de caracteres até encontrar a senha correta. Pode envolver sequências numéricas, letras e caracteres especiais, sendo mais eficiente quando existem senhas curtas ou pouco complexas.

- **Ataque de dicionário:** utiliza listas previamente elaboradas com palavras e senhas frequentemente utilizadas. Essas listas podem conter nomes, expressões comuns, sequências numéricas e combinações recorrentes, explorando a tendência dos usuários de escolher credenciais previsíveis.

- **Ataque híbrido:** combina técnicas de dicionário e força bruta, modificando palavras de listas existentes por meio da inclusão de números, letras maiúsculas, caracteres especiais ou substituições. Um exemplo seria transformar a palavra "senha" em "Senha123" ou "s3nha".

- **Ataque de pulverização de senhas (*Password Spraying*):** consiste em testar uma ou poucas senhas comuns em diversas contas de usuário, em vez de realizar várias tentativas em uma única conta. Essa estratégia busca reduzir a possibilidade de bloqueio por excesso de tentativas malsucedidas.

- **Ataque de força bruta reversa (*Reverse Brute Force*):** utiliza uma senha previamente conhecida, geralmente obtida por meio de vazamentos de dados ou outras fontes, para testar diferentes nomes de usuário até encontrar uma combinação válida.

A realização dessa simulação permitiu compreender, na prática, como ferramentas automatizadas podem explorar falhas na política de senhas e nos mecanismos de autenticação de serviços de rede. Além disso, reforçou a importância da utilização de senhas fortes, políticas de bloqueio após tentativas consecutivas, autenticação multifator (MFA) e monitoramento de acessos como medidas fundamentais para reduzir os riscos desse tipo de ataque.
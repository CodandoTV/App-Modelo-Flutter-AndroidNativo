## flutter_clean_architecture

A ideia deste repo é criar um modelo do uso de arquitetura em projetos flutter, foi criado um modulo `app_sample` para tentar retratar um modelo de arquitetura escalável em projetos grandes

- Foi criado modulos a parte(`core`, `core-networking`) para já deixar modularizado que já uma prática muito comum no Android Nativo, ou como eu vejo o pessoal do flutter comentando micro frontend.
- Minha maior dúvida fica na camada de presentation, não pelo uso ou conceito dela, mas sim tomar uma decisão qual das tecnologias utilizar entre Bloc/Cubit/Mobx devido a isso foi criado 3 sub pastas do pacote 'presentation'
  - bloc -> exemplo com solução do bloc
  - mobx -> exemplo com solução usando mobx
  - cubit -> exemplo usando o cubit

### Pendências:
- Criar testes unitários para exemplo para bloc/cubit

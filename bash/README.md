Convenção de nomes:

```txt
.<tech>_<scope>.<platform>.sh`
| |      |       |
| |      |       └─⫸ Se for um script específico para plataforma adicionar `.win` ou `.linux`. Caso for geral, omitir esta parte
| |      |
| |      └─────────⫸ Tipo do script: aliases|init
| |
| └────────────────⫸ Tecnologia: docker|git|terrafrom|profile|etc
|
└──────────────────⫸ Fixo
```

`.profile_init.<platform>.sh`: Vincular na inicialização do profile para carregar demais scripts
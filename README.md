# pyvisa_dmm4050_read_automation
A pysvisa driver for the DMM-4050 multimeter


1* Ponto importante, precisamos garantir que nosso multimetro está conectado a rede, para isso iremos rodar um comando ping, neste caso farei um ping de 5 tentativas:


```bash
ping -c n_de_pings ip_do dispositivo

```
Nosso aparelho está com o ip reservado de 10.128.15.200, portanto:

```
ping -c 5 10.128.15.200
```

Com isso obtivemos esta amostra:


```
(pyvisa_venv) matheus@matheus-Vivobook-Go-E1504FA-E1504FA:~/pyvisa_dmm4050_read_automation$ ping -c 5 10.128.15.200
PING 10.128.15.200 (10.128.15.200) 56(84) bytes of data.
64 bytes from 10.128.15.200: icmp_seq=1 ttl=64 time=4.41 ms
64 bytes from 10.128.15.200: icmp_seq=2 ttl=64 time=1.70 ms
64 bytes from 10.128.15.200: icmp_seq=3 ttl=64 time=1.80 ms
64 bytes from 10.128.15.200: icmp_seq=4 ttl=64 time=2.18 ms
64 bytes from 10.128.15.200: icmp_seq=5 ttl=64 time=3.33 ms
```

Portanto a conexão lan está funcionando!

Afim de confirmar se o dispositivo apontado é o nosso iremos rodar um teste por telnet:

```
matheus@matheus-Vivobook-Go-E1504FA-E1504FA:~$ telnet 10.128.15.200 3490
Trying 10.128.15.200...
Connected to 10.128.15.200.
Escape character is '^]'.
*IDN?
TEKTRONIX,DMM4050,2633206,08/02/10-11:53
```

De fato o dispositivo encontrado é o nosso multimetro de bancada.



A implementação que faremos abaixo será para o DMM-4050 e teve como base o vídeo abaixo:
https://www.youtube.com/watch?v=DUJpL9pMy8Yhttps://www.youtube.com/watch?v=DUJpL9pMy8Y

Não fui eu quem produzi o vídeo, mas para quem for fazer o processo recomendo que o veja também.

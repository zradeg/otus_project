Кластер собирается и стартует (на хостах postfix0\[123\]), но все ресурсы в режиме stopped.
Ресурсы запускаются, если каждому из них вручную дать последовательно команды
```
pcs resource debug-start DrbdData
pcs resource refresh DrbdData
```
До запуска ресурса postfix, его пришлось установить вручную, т.к. в процессе провижининга он исчез, хотя сразу после vagrant-развертки postfix был в наличии. Пробовал обойти этот момент, создав таск на принудительную установку, но не помогло.


Также после провижининга не поднимается фенсинг, хотя таски отрабатывают без ошибок, но в итоге
```
WARNINGS:
No stonith devices and stonith-enabled is not false
```
Хотя если запустить вручную, то все нормально активируется
```
pcm1_fence_dev (stonith:fence_vbox):   Stopped
pcm2_fence_dev (stonith:fence_vbox):   Stopped
pcm3_fence_dev (stonith:fence_vbox):   Stopped
```
Правда, после этого появляются фейлы:
```
* pcm1_fence_dev_start_0 on pcm1 'unknown error' (1): call=61, status=Error, exitreason='',
    last-rc-change='Sat Aug 15 04:40:59 2020', queued=0ms, exec=1259ms
```

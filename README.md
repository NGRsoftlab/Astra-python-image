<!-- markdownlint-disable MD033 MD041 -->
<p><img src="https://static.tildacdn.com/tild3733-3430-4331-a637-336233396534/logo.svg" alt="NGRSOFTLAB logo" title="NGR" align="right" height="60" /></p>
<!-- markdownlint-enable MD033 MD041 -->

# Python

<!-- markdownlint-disable MD033 -->
<div>
  <h4 align="center">
    <img src="https://img.shields.io/badge/Dive%20efficiency-100%25-brightgreen.svg?logo=Docker&style=plastic" alt="Dive efficiency"/>
    <img src="https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-9cf?style=plastic" alt="Made with love"/>
    <img src="https://img.shields.io/badge/Powered%20by-Docker-blue?logo=Docker&style=plastic" alt="Powered by Docker"/>
    <img src="https://shields.io/badge/NGR -Team-yellow?style=plastic&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9Im5vbmUiIHZpZXdCb3g9IjIyLjcgMCA1MS45IDUxLjciPjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNNzQuNSAwSDYzLjhsMy42IDMuNWMuNy43LjcgMS45IDAgMi43LS43LjctMS45LjctMi42IDBMNTguOSAwSDUzbDE0LjUgMTMuOWMuNy43LjcgMS45IDAgMi43LS43LjctMS45LjctMi42IDBMNDkgMGgtNi44bDI1LjMgMjQuM2MuNy43LjcgMS45IDAgMi43LS43LjctMS45LjctMi42IDBMMzkgMGgtNy43bDM2LjEgMzQuN2MuNy43LjcgMS45IDAgMi42cy0xLjkuNy0yLjYgMEwyOSAwYy0zLjUuNC02LjMgMy40LTYuMyA3djQ0LjdoMTAuNmwtMy42LTMuNGMtLjctLjctLjctMS45IDAtMi42czEuOS0uNyAyLjcgMGw1LjggNmg1LjlMMjkuNyAzNy45Yy0uNy0uNy0uNy0xLjkgMC0yLjcuNy0uNyAxLjktLjcgMi43IDBsMTUuOCAxNi40SDU1TDI5LjggMjcuNGMtLjctLjctLjctMS45IDAtMi43LjctLjcgMS45LS43IDIuNyAwbDI1LjggMjYuOEg2NkwyOS45IDE2LjljLS43LS43LS43LTEuOSAwLTIuNnMxLjktLjcgMi43IDBsMzUuNyAzNy4yYzMuNS0uMyA2LjMtMy4zIDYuMy03VjB6IiBmaWxsPSIjRjhBRDAwIi8+PC9zdmc+" alt="NGR Team" />
  </h4>
</div>

<div align="center">

![Python image](docs/images/logo.svg)
</div>

<div align="center"> <sub> Ascii svg art by <a href="https://GitHub.com/martinthomson/aasvg">aasvg</a>. </sub> </div>

<!-- markdownlint-enable MD033 -->

## Description

**Python container image** - это реализация легковесной сборки ЯП Python на базе Astra Linux

Присоединяйтесь к нашим социальным сетям:

<!-- markdownlint-disable MD033 -->

<div class="badges-row-public">
  <h4 align="center">
    <a href="https://t.me/NGR_Softlab">
      <img src="https://shields.io/badge/ngr-telegram-blue?logo=telegram&style=for-the-badge" alt="NGR Social Telegram" height="40" />
    </a>
    &emsp; &emsp; &emsp;
    <a href="https://www.ngrsoftlab.ru/?utm_source=tg&utm_medium=start" >
      <img src="https://shields.io/badge/ngr-web--page-yellow?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9Im5vbmUiIHZpZXdCb3g9IjIyLjcgMCA1MS45IDUxLjciPjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNNzQuNSAwSDYzLjhsMy42IDMuNWMuNy43LjcgMS45IDAgMi43LS43LjctMS45LjctMi42IDBMNTguOSAwSDUzbDE0LjUgMTMuOWMuNy43LjcgMS45IDAgMi43LS43LjctMS45LjctMi42IDBMNDkgMGgtNi44bDI1LjMgMjQuM2MuNy43LjcgMS45IDAgMi43LS43LjctMS45LjctMi42IDBMMzkgMGgtNy43bDM2LjEgMzQuN2MuNy43LjcgMS45IDAgMi42cy0xLjkuNy0yLjYgMEwyOSAwYy0zLjUuNC02LjMgMy40LTYuMyA3djQ0LjdoMTAuNmwtMy42LTMuNGMtLjctLjctLjctMS45IDAtMi42czEuOS0uNyAyLjcgMGw1LjggNmg1LjlMMjkuNyAzNy45Yy0uNy0uNy0uNy0xLjkgMC0yLjcuNy0uNyAxLjktLjcgMi43IDBsMTUuOCAxNi40SDU1TDI5LjggMjcuNGMtLjctLjctLjctMS45IDAtMi43LjctLjcgMS45LS43IDIuNyAwbDI1LjggMjYuOEg2NkwyOS45IDE2LjljLS43LS43LS43LTEuOSAwLTIuNnMxLjktLjcgMi43IDBsMzUuNyAzNy4yYzMuNS0uMyA2LjMtMy4zIDYuMy03VjB6IiBmaWxsPSIjRjhBRDAwIi8+PC9zdmc+" alt="NGR Social Media" height="40" />
    </a>
  </h4>
</div>

<!-- markdownlint-enable MD033 -->

## Contents

- [Python](#python)
  - [Description](#description)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Supported Technologies](#supported-technologies)
  - [What it is](#what-it-is)
  - [How to work with](#how-to-work-with)
    - [Container variables](#container-variables)
    - [Extra pip and Python args](#extra-pip-and-python-args)
    - [Advanced environment](#advanced-environment)
  - [How to use this image](#how-to-use-this-image)
  - [How to test local](#how-to-test-local)
  - [Scratch](#scratch)
  - [Miscellaneous](#miscellaneous)
    - [Cya!](#cya)

## [Requirements](#contents)

- Docker >= 28.1.1 (возможно работает в предыдущих версиях, но мы не можем это гарантировать)

## [Supported Technologies](#contents)

|                                                 OS                                                  |                                                 Python                                                  | Status             |
| :-------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------: | :----------------- |
| ![Astra 1.7](https://img.shields.io/badge/Astra-1.7.x-00ADD8?style=flat&logo=astra&logoColor=white) |  ![Python 3.7](https://img.shields.io/badge/Python-3.7-3776AB?style=flat&logo=python&logoColor=ffdd54)  | ✅ Fully supported |
| ![Astra 1.8](https://img.shields.io/badge/Astra-1.8.x-00ADD8?style=flat&logo=astra&logoColor=white) | ![Python 3.11](https://img.shields.io/badge/Python-3.11-3776AB?style=flat&logo=python&logoColor=ffdd54) | ✅ Fully supported |

<!-- markdownlint-disable MD033 -->
<div align="center"> <sub> Таблица 1. Поддерживаемые ОС-ы. </sub> </div>
<p>&nbsp;</p>
<!-- markdownlint-enable MD033 -->

## [What it is](#contents)

Этот образ предоставляет среду выполнения Python внутри контейнера. Он предназначен для запуска приложений на Python в изолированной среде. Образ содержит только стандартную библиотеку Python и минимальный набор зависимостей. Образ построен на основе отечественной ОС Astra Linux

## [How to work with](#contents)

Для начала работы необходимо установить [pre-commit](https://pre-commit.com/) и хуки

```console
$ pip install pre-commit
$ pre-commit --version

pre-commit 4.2.0

$ pre-commit install

pre-commit installed at .git/hooks/pre-commit
pre-commit installed at .git/hooks/commit-msg
pre-commit installed at .git/hooks/pre-push
```

> [!warning]
> Чтобы проверить свои изменения, воспользуйтесь командой `pre-commit run --all-files`.
> Чтобы проверить конкретную задачу, воспользуетесь командой `pre-commit run <target> --all-files`.
> Если Вы понимаете что творите и хотите пропустить проверку `pre-commit`-ом воспользуйтесь `--no-verify`, пример `git commit -m "Добавил изменения и не хочу проверки" --no-verify`

Существует несколько способов как можно взаимодействовать со сборкой образа. Благодаря скрипту[^2] может существовать 3 способа передачи аргумента в `Dockerfile`:

1. Передача 'примерной' версии. В результате передачи данной строки, скрипт [попытается найти](scripts/python-install-approximately.sh#L74-80) точную версии, если таковой нет, то будет возвращена пустая строка

    ```console
    ## Export Python version for 1.7.5
    $ export PYTHON_VERSION='3.7-astra1.7.5-slim'

    ## Python build utils image: 126MB
    docker build \
      --progress=plain \
      --build-arg python_identity=3.7 \
      --build-arg image_version=1.7.5-slim \
      -t python:"${PYTHON_VERSION}" \
      .

    .. build ...
    ```

2. Передача точной версии

    ```console
    ## Export Python version for 1.8.2
    $ export PYTHON_VERSION='3.11-astra1.8.2-slim'

    ## Python build utils image: 141MB
    docker build \
      --progress=plain \
      --build-arg python_identity=3.11.2-1+b3 \
      --build-arg image_version=1.8.2-slim \
      -t python:"${PYTHON_VERSION}" \
      .

    .. build ...
    ```

3. Передача ссылки, на заранее собранный из исходников Python

    ```console
    ## Export Python version for 1.8.2
    $ export PYTHON_VERSION='3.13-astra1.8.2-slim'

    ## Python build utils image: 198MB
    docker build \
      --progress=plain \
      --build-arg python_identity=https://example-registry.com/repository/python/python-v3.13.2-linux-amd64.tar.gz \
      --build-arg image_version=1.8.2-slim \
      -t python:"${PYTHON_VERSION}" \
      .

    .. build ...
    ```

> [!tip]
> Проверка доступных версий приложения -
> `apt show python3-minimal`,
> `apt-cache policy python3-minimal`,
> `apt-cache show python3-minimal`

Работа с прокси репозиториями. Логика работы тоже является 'плавающей' т.е. позволяет передавать разный набор параметров для Вашего удобства:

1. Если Вам необходим полный контроль над расположением репозиториев и/или индекс отличается от индекса местоположения прокси репозитория - разрешается использовать полный набор определения прокси

    ```console
    ## Export Python version for 1.8.2
    $ export PYTHON_VERSION='3.11-astra1.8.2-slim'

    docker build \
      --progress=plain \
      --build-arg image_registry=example-container.registry.com/ \
      --build-arg pip_registry_index=https://example-registry.com/repository/python-cache-repostory/pypi \
      --build-arg pip_registry_url=https://example-registry.com/repository/python-cache-repostory/simple \
      --build-arg pip_trusted_host=example-registry.com \
      --build-arg python_identity=3.11 \
      --build-arg image_version=1.8.2-slim \
      -t python:"${PYTHON_VERSION}" \
      .

    .. build ...
    ```

2. Если `index` и `index-url` имеют один 'источник', то возможна логика обобщения через переменные

    ```console
    ## Export Python version for 1.8.2
    $ export PYTHON_VERSION='3.11-astra1.8.2-slim'

    docker build \
      --progress=plain \
      --build-arg image_registry=example-container.registry.com/ \
      --build-arg package_registry_proxy=https://example-registry.com/repository/python-cache-repostory \
      --build-arg package_registry_trust_host=example-registry.com \
      --build-arg python_identity=3.11 \
      --build-arg image_version=1.8.2-slim \
      -t python:"${PYTHON_VERSION}" \
      .

    .. build ...
    ```

### [Container variables](#contents)

| Имя                  | Значение по умолчанию |  Тип   |                                                                                                Описание |
| :------------------- | :-------------------: | :----: | ------------------------------------------------------------------------------------------------------: |
| `image_name`         |         astra         | string |                                                                                             Имя образа. |
| `image_registry`     |          ''           | string |                                                                            Адрес до реестра образа[^1]. |
| `image_version`      |      1.8.2-slim       | string |                                                                                          Версия образа. |
| `pip_registry_index` |          ''           | string |                 Имя индекса, который `pip` будет использовать из списка заранее заданных в конфиге[^3]. |
| `pip_registry_url`   |          ''           | string |             Переопределение основного источника пакетов, откуда `pip` будет скачивать по умолчанию[^3]. |
| `pip_trusted_host`   |          ''           | string | Добавляет хост в список доверенных, чтобы `pip` не проверял SSL-сертификаты при подключении к нему[^3]. |
| `python_identity`    |         3.11          | string |                                                                            Ожидаемая версия Python[^2]. |

<!-- markdownlint-disable MD033 -->
<div align="center"> <sub> Таблица 2. Переопределяемые аргументы для сборки образа. </sub> </div>
<p>&nbsp;</p>
<!-- markdownlint-enable MD033 -->

### [Extra pip and Python args](#contents)

Вовремя работы сборки, `pip` использует [`env-wrapper`](scripts/pip-env.sh) который помогает ускорить установку компонентов. Ниже приведена таблица с краткой информацией о переменных, которые МОГУТ использоваться во время сборки И также глобально объявляться в конечном(целевом) образе. Вы можете использовать те или иные переменные для управления собственными сборками, если понимаете что творите

| Название переменной                                |              Значение               | Необходимость при сборке контейнера                                                  | Необходимость в `scratch`-образе                                         | Краткое объяснение переменной                                                                                |
| :------------------------------------------------- | :---------------------------------: | :----------------------------------------------------------------------------------- | :----------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------- |
| `PIP_BREAK_SYSTEM_PACKAGES=1`                      |              Включено               | Позволяет обновлять системные пакеты через `pip`                                     | Обычно не нужна                                                          | Позволяет `pip` изменять пакеты, установленные системным пакетным менеджером (например, `apt`, `apk`)        |
| `PIP_DISABLE_PIP_VERSION_CHECK=1`                  |              Включено               | Отключает проверку обновлений `pip` — ускоряет установку и избегает сетевых запросов | Полезно, если образ не имеет интернета или нужно избежать предупреждений | Отключает уведомления о том, что есть новая версия `pip`                                                     |
| `PIP_NO_CACHE_DIR=1`                               |              Включено               | Ускоряет сборку и экономит место — отключает кэширование пакетов                     | Может сэкономить место                                                   | Отключает создание кэша `pip` (по умолчанию `~/.cache/pip`)                                                  |
| `PIP_NO_COMPILE=1`                                 |              Включено               | Ускоряет сборку — не генерирует `.pyc` файлы                                         | Уменьшает производительность импорта модулей                             | Отключает компиляцию `.py` в `.pyc`, экономя время и место на этапе сборки                                   |
| `PIP_ROOT_USER_ACTION=ignore`                      |               ignore                | Позволяет запускать `pip` от root без предупреждений                                 | Используется, если образ работает от `root`                              | Отключает предупреждения при запуске `pip` от имени `root`                                                   |
| `PYTHONDONTWRITEBYTECODE=1`                        |              Включено               | Экономит место — не создаёт `.pyc` файлов                                            | Ухудшает производительность                                              | Python не будет записывать скомпилированные байт-коды (`__pycache__`, `.pyc`), экономя место и время         |
| `PYTHONWARNINGS="ignore:Unverified HTTPS request"` | `"ignore:Unverified HTTPS request"` | Полезно при использовании небезопасных источников или внутренних репозиториев        | Может понадобиться, если используется `pip` или `python` с HTTP(S)       | Подавляет предупреждения о непроверенных HTTPS-запросах (часто связано с самоподписанными SSL-сертификатами) |

<!-- markdownlint-disable MD033 -->
<div align="center"> <sub> Таблица 3. Дополнительные переменные окружения PIP для работы с образами и их влияние на сборку/работу в контейнере. </sub> </div>
<p>&nbsp;</p>
<!-- markdownlint-enable MD033 -->

Альтернативный способ очистки кеша, чтобы уменьшить размер образа:

```Dockerfile
FROM python:3.11-astra1.8.2-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
```

### [Advanced environment](#contents)

В результате сборки базового образа идёт наполнение файла `/etc/environment`. В нём отражены общие переменные, которые могут использоваться в сборочных образах приложений

1. Пример переменных для образа `3.13` установленного из удаленного и скомпилированного Python

    ```console
    $ cat /etc/environment

    PYTHON_REVISION=Installed-from-URL
    BEGIN_BUILD_IN_EPOCH=1746194532
    PYTHON_LIB_PATH=/usr/local/lib/python3.13
    PYTHON_SITE_PACKAGES=/usr/local/lib/python3.13/site-packages
    PYTHON_MAJOR_MINOR_PATCH_VERSION=3.13.2
    PYTHON_MAJOR_MINOR_VERSION=3.13
    ```

2. Пример переменных для образа `3.11` из репозиториев Astra Linux

    ```console
    $ cat /etc/environment

    PYTHON_REVISION=3.11.2-1+b3
    BEGIN_BUILD_IN_EPOCH=1746191721
    PYTHON_LIB_PATH=/usr/lib/python3.11
    PYTHON_SITE_PACKAGES=/usr/local/lib/python3.11/dist-packages
    PYTHON_MAJOR_MINOR_PATCH_VERSION=3.11.2
    PYTHON_MAJOR_MINOR_VERSION=3.11
    ```

3. Пример переменных для образа `3.7` из репозиториев Astra Linux

    ```console
    $ cat /etc/environment

    PYTHON_REVISION=3.7.3-1
    BEGIN_BUILD_IN_EPOCH=1746278986
    PYTHON_LIB_PATH=/usr/lib/python3.7
    PYTHON_SITE_PACKAGES=/usr/local/lib/python3.7/dist-packages
    PYTHON_MAJOR_MINOR_PATCH_VERSION=3.7.3
    PYTHON_MAJOR_MINOR_VERSION=3.7
    ```

## [How to use this image](#contents)

Для того чтобы начать использовать данный образ, создайте `Dockerfile` с простыми настройками

```Dockerfile
FROM python:3.11-astra1.8.2-slim

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./your-daemon-or-script.py" ]
```

Затем соберите и запустите полученный образ

```console
$ docker build -t my-python-app .
$ docker run -it --rm --name my-running-app my-python-app

...run logic...
```

Для того, чтобы запустить одиночный файл Python-а, Вы можете использовать следующую команду

```console
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:3.11-astra1.8.2-slim python your-daemon-or-script.py

...run logic...
```

## [How to test local](#contents)

Простой тест:

```shell
docker run --rm python:3.11-astra1.8.2-slim python -c "print('Hello from Python')"
```

## [Scratch](#contents)

Данный раздел будет обеспечивать краткие вводные для того, чтобы Вы в дальнейшем могла проектировать свои `Scratch` сборки, на примере сложносоставного проекта. Все, что демонстрируется, также подкреплено и всеми задействованными скриптами [сборочными](scripts/) или специализированными для [сборки](scratch/) через `scratch`. Все манипуляции поделены на определенное количество 'шагов' для которых будут даны краткие комментарии:

1. Первым этапом идёт подготовка окружения, установка зависимостей как системных, так и `pip`

    ```Dockerfile
    ## Install base project deps
    # hadolint ignore=DL3042
    RUN \
        --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
        --mount=type=bind,source=./requirements.txt,target=/requirements.txt,readonly \
        apt-install.sh \
            libldap2-dev \
            libpq-dev \
            libsasl2-dev \
            libssl-dev \
            iputils-ping \
            python3-dev \
            build-essential \
            ldap-utils \
            libfreetype6-dev \
            libpq-dev \
            libidn2-dev \
    ## Set corporative proxy
        && python-set-proxy.sh \
    ## Install project components
        && pip-env.sh pip install -r /requirements.txt \
        && python-rm-cache.sh "${PYTHON_VENV_SITE_PACKAGES}" \
    ## Clean cache
        && apt-clean.sh
    ```

2. Второй этап включает в себя компиляцию интерпретатора Python, **без компиляции установленных пакетов**. Пояснение: компилирование пакетов, может грозить тем, что проект будет не пригоден, т.к. помимо `.py` могут находится и `.c` расширения и при компилировании такой 'солянки' приложение попросту перестанет работать, т.к. не сможет найти ассоциации с другими расширениями. Пример таких расширений которые могут 'сломать' сборку: `numpy`, `pandas`, `cryptography` и т.д.

    ```Dockerfile
    ## Change path to work dir
    WORKDIR /opt

    ## Compile and cleanup cpython
    ## We not compile VENV because this packages include C and multiple another extension
    # hadolint ignore=DL3003,SC1091
    RUN \
        --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
    ## Get build info from env file
        source /etc/environment \
    ## Change path to main python
        && cd "${PYTHON_LIB_PATH}" \
    ## Compile root python
        && python-compile.sh \
    ## Reduce package directory size
        && PYTHON_VENV_SITE_PACKAGES="$(python3 -c 'import site;print(site.getsitepackages()[0])')" \
        && python-remove-unwanted.sh "${PYTHON_VENV_SITE_PACKAGES}" \
        && find "${PYTHON_VENV_PATH}" -iname '*.exe' -ls -delete
    ```

3. Третьим этапом формируем базовую структуру, которая будет перенесена в `Scratch`

    ```Dockerfile
    ## Install build components
    RUN \
    ## Directory structure and permissions
        mkdir -p \
            /base/bin \
            /base/tmp \
            /base/var/tmp \
            /base/etc/ssl \
            /base/sbin \
            /base/root \
            /base/usr/lib/ \
            "/base${PYTHON_VENV_PATH%/*}" \
            /base/usr/src/app \
        && chmod 700 /base/root \
        && chown root:root /base/root \
        && chmod 1777 /base/tmp /base/var/tmp \
    ## UID and GID
        && echo 'root:x:0:' > /base/etc/group \
        && echo 'root:x:0:0:root:/root:/sbin/nologin' > /base/etc/passwd \
    ## Nologin binary
        && echo 'int main() { return 1; }' > nologin.c \
        && gcc -Os -no-pie -static -std=gnu99 -s -Wall -Werror -o /base/sbin/nologin nologin.c
    ```

4. Четвертым этапом происходит перенос основной файловой структуры, для оптимальной и минимальной работы приложения

    ```Dockerfile
    ## Copy depended binary
    # hadolint ignore=SC1091
    RUN \
        --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
    ## Get python version
        source /etc/environment \
    ## Execute transfer ldd /bin
        && copy-bin.sh \
            --prefix "/base" \
            --ldd "/bin/dumb-init" \
            --links "/bin:/sbin:/usr/bin:/usr/sbin" \
    ## Execute transfer ldd /usr/bin
        && copy-bin.sh \
            --prefix "/base" \
            --ldd "/usr/bin/python${PYTHON_MAJOR_MINOR_VERSION}" \
            --links "/bin:/sbin:/usr/bin:/usr/sbin" \
    ## Copy compiled python venv
        && cp -R "${PYTHON_VENV_PATH}" "/base${PYTHON_VENV_PATH%/*}" \
    ## Copy compiled python
        && cp -R "${PYTHON_LIB_PATH}" "/base/usr/lib/" \
    ## Copy shared objects
        && copy-lib.sh /base/lib/x86_64-linux-gnu/ \
    ## Can read host files for FQDN
            /usr/lib/x86_64-linux-gnu/libnss_files \
    ## PYTHON critical shared objects
            /usr/lib/libgost \
            /usr/lib/x86_64-linux-gnu/libquadmath \
            ... list of libs ...
    ## Cleanup from deduplicates transfer directory
        && dedup-clean.sh /base/usr/
    ```

5. Пятый - это побочный этап, здесь можно раздать необходимые права на рабочий путь и перенести необходимые рабочие файлы

    ```Dockerfile
    ## Transfer base project component
    COPY lib/ /base/usr/src/app/lib/

    ## Remove extra write permissions
    RUN \
        find /base/usr/src/app -type f -print0 | xargs -0 chmod 644 \
        && find /base/usr/src/app -type d -print0 | xargs -0 chmod 755
    ```

6. Шестой этап - это слой отладки. Необходимая мера, для того чтобы в случае неполадок или ошибок, мы могли собрать образ с `docker build --target debug-stage` и вывести отладочную информацию о вызовах при помощи, например, [`wrapper-lib.sh`](scratch/wrapper-lib.sh)

    ```Dockerfile
    FROM base-stage AS debug-stage

    RUN \
        --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
    ## Install debug tools
        apt-install.sh \
            strace \
            ltrace \
            gdb \
            tcpdump \
            procps \
            net-tools \
            jq \
            xmlstarlet \
    ## Clean cache
        && apt-clean.sh

    ## Set work directory
    WORKDIR /usr/src/app

    ## Transfer base project component
    COPY lib/ lib/
    ```

7. Седьмой этап - интеграция со `Scratch` образом. Т.к. там нет ничего, то необходимо позаботиться о том, чтобы существовали необходимые пути, переменные. Также, т.к. установка пакетов была без `.pyc` расширения, то на наши плечи ложится такая операция как прогрев кеша. Пользуясь небольшой хитростью, мы временно монтируем `bash` как `sh`, чтобы обойти ограничение, при котором `Docker` ссылается, без явного указания на оболочку через `SHELL`, на `/bin/sh` и выполняем желаемый список команд

    ```Dockerfile
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    #                        Final image                          #
    #              Third stage, compact optimize layer            #
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    FROM scratch

    COPY --from=base-stage /base/ /

    ENV PYTHON_VENV_PATH='/usr/local/lib/python-venv'

    ## Add venv into path
    ENV \
        PATH="${PYTHON_VENV_PATH}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
        LANG=C.UTF-8

    ## Set work directory
    WORKDIR /usr/src/app

    ## Little trick, we just mounting shell to provide cache warmup
    RUN \
        --mount=type=bind,from=base-stage,source=/usr/bin/bash,target=/bin/sh,readonly \
        --mount=type=bind,from=base-stage,source=/usr/lib/x86_64-linux-gnu/libtinfo.so.6,target=/usr/lib/x86_64-linux-gnu/libtinfo.so.6,readonly \
        gunicorn --help \
        && netaddr --help \
        && normalizer --help \
        && f2py -h \
        && flask --help \
        && fonttools --help \
        && numpy-config --help

    ENTRYPOINT [ "dumb-init", "--" ]
    CMD [ "python3" ]
    ```

Полный `Dockerfile`:

```Dockerfile
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                         Base image                          #
#               First stage, prepare environment              #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
FROM python:3.11-astra1.8.2 AS base-stage

SHELL [ "/bin/bash", "-exo", "pipefail", "-c" ]

## Redefined DEFAULT args
ARG package_registry_proxy
ARG package_registry_trust_host

## Install base project deps
# hadolint ignore=DL3042
RUN \
    --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
    --mount=type=bind,source=./requirements.txt,target=/requirements.txt,readonly \
    apt-install.sh \
        libldap2-dev \
        libpq-dev \
        libsasl2-dev \
        libssl-dev \
        iputils-ping \
        python3-dev \
        build-essential \
        ldap-utils \
        libfreetype6-dev \
        libpq-dev \
        libidn2-dev \
## Set corporative proxy
    && python-set-proxy.sh \
## Install project components
    && pip-env.sh pip install -r /requirements.txt \
    && python-rm-cache.sh "${PYTHON_VENV_SITE_PACKAGES}" \
## Clean cache
    && apt-clean.sh

## Change path to work dir
WORKDIR /opt

## Compile and cleanup cpython
## We not compile VENV because this packages include C and multiple another extension
# hadolint ignore=DL3003,SC1091
RUN \
    --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
## Get build info from env file
    source /etc/environment \
## Change path to main python
    && cd "${PYTHON_LIB_PATH}" \
## Compile root python
    && python-compile.sh \
## Reduce package directory size
    && PYTHON_VENV_SITE_PACKAGES="$(python3 -c 'import site;print(site.getsitepackages()[0])')" \
    && python-remove-unwanted.sh "${PYTHON_VENV_SITE_PACKAGES}" \
    && find "${PYTHON_VENV_PATH}" -iname '*.exe' -ls -delete

## Install build components
RUN \
## Directory structure and permissions
    mkdir -p \
        /base/bin \
        /base/tmp \
        /base/var/tmp \
        /base/etc/ssl \
        /base/sbin \
        /base/root \
        /base/usr/lib/ \
        "/base${PYTHON_VENV_PATH%/*}" \
        /base/usr/src/app \
    && chmod 700 /base/root \
    && chown root:root /base/root \
    && chmod 1777 /base/tmp /base/var/tmp \
## UID and GID
    && echo 'root:x:0:' > /base/etc/group \
    && echo 'root:x:0:0:root:/root:/sbin/nologin' > /base/etc/passwd \
## Nologin binary
    && echo 'int main() { return 1; }' > nologin.c \
    && gcc -Os -no-pie -static -std=gnu99 -s -Wall -Werror -o /base/sbin/nologin nologin.c

## Copy depended binary
# hadolint ignore=SC1091
RUN \
    --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
## Get python version
    source /etc/environment \
## Execute transfer ldd /bin
    && copy-bin.sh \
        --prefix "/base" \
        --ldd "/bin/dumb-init" \
        --links "/bin:/sbin:/usr/bin:/usr/sbin" \
## Execute transfer ldd /usr/bin
    && copy-bin.sh \
        --prefix "/base" \
        --ldd "/usr/bin/python${PYTHON_MAJOR_MINOR_VERSION}" \
        --links "/bin:/sbin:/usr/bin:/usr/sbin" \
## Copy compiled python venv
    && cp -R "${PYTHON_VENV_PATH}" "/base${PYTHON_VENV_PATH%/*}" \
## Copy compiled python
    && cp -R "${PYTHON_LIB_PATH}" "/base/usr/lib/" \
## Copy shared objects
    && copy-lib.sh /base/lib/x86_64-linux-gnu/ \
## Can read host files for FQDN
        /usr/lib/x86_64-linux-gnu/libnss_files \
## PYTHON critical shared objects
        /usr/lib/libgost \
        /usr/lib/x86_64-linux-gnu/libquadmath \
        /usr/lib/x86_64-linux-gnu/libbfd-2.40-system \
        /usr/lib/x86_64-linux-gnu/libctf \
        /usr/lib/x86_64-linux-gnu/libgmp \
        /usr/lib/x86_64-linux-gnu/libjansson \
        /usr/lib/x86_64-linux-gnu/libliboqs \
        /usr/lib/x86_64-linux-gnu/liboqs \
        /usr/lib/x86_64-linux-gnu/libsframe \
        /usr/lib/x86_64-linux-gnu/libuuid \
        /usr/lib/x86_64-linux-gnu/libgcc_s \
        /usr/lib/x86_64-linux-gnu/libffi \
        /usr/lib/x86_64-linux-gnu/liblzma \
        /usr/lib/x86_64-linux-gnu/libexpat \
        /usr/lib/x86_64-linux-gnu/libbz2 \
        /usr/lib/x86_64-linux-gnu/libhogweed \
        /usr/lib/x86_64-linux-gnu/libnettle \
        /usr/lib/x86_64-linux-gnu/libtasn1 \
        /usr/lib/x86_64-linux-gnu/libunistring \
        /usr/lib/x86_64-linux-gnu/libidn2 \
        /usr/lib/x86_64-linux-gnu/libpq \
        /usr/lib/x86_64-linux-gnu/libp11-kit \
        /usr/lib/x86_64-linux-gnu/libresolv \
        /usr/lib/x86_64-linux-gnu/libkeyutils \
        /usr/lib/x86_64-linux-gnu/libgnutls \
        /usr/lib/x86_64-linux-gnu/liblber-2.5 \
        /usr/lib/x86_64-linux-gnu/libkrb5 \
        /usr/lib/x86_64-linux-gnu/libkrb5support \
        /usr/lib/x86_64-linux-gnu/libk5crypto \
        /usr/lib/x86_64-linux-gnu/libcom_err \
        /usr/lib/x86_64-linux-gnu/libzstd \
        /usr/lib/x86_64-linux-gnu/libgssapi_krb5 \
        /usr/lib/x86_64-linux-gnu/librt \
        /usr/lib/x86_64-linux-gnu/libssl \
        /usr/lib/x86_64-linux-gnu/libcrypto \
        /usr/lib/x86_64-linux-gnu/libcrypt \
        /usr/lib/x86_64-linux-gnu/libstdc++ \
        /usr/lib/x86_64-linux-gnu/libc \
        /usr/lib/x86_64-linux-gnu/libpthread \
        /usr/lib/x86_64-linux-gnu/libm \
        /usr/lib/x86_64-linux-gnu/libdl \
        /usr/lib/x86_64-linux-gnu/libz \
        /usr/lib/x86_64-linux-gnu/libldap-2.5 \
        /usr/lib/x86_64-linux-gnu/libsasl2 \
## Cleanup from deduplicates transfer directory
    && dedup-clean.sh /base/usr/

## Transfer base project component
COPY lib/ /base/usr/src/app/lib/

## Remove extra write permissions
RUN \
    find /base/usr/src/app -type f -print0 | xargs -0 chmod 644 \
    && find /base/usr/src/app -type d -print0 | xargs -0 chmod 755

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                         Debug image                         #
#               Second stage, install debug tools             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
FROM base-stage AS debug-stage

RUN \
    --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
## Install debug tools
    apt-install.sh \
        strace \
        ltrace \
        gdb \
        tcpdump \
        procps \
        net-tools \
        jq \
        xmlstarlet \
## Clean cache
    && apt-clean.sh

## Set work directory
WORKDIR /usr/src/app

## Transfer base project component
COPY lib/ lib/

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                        Final image                          #
#              Third stage, compact optimize layer            #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
FROM scratch

COPY --from=base-stage /base/ /

## Set base label
LABEL \
    maintainer="Vladislav Avdeev" \
    organization="NGRSoftlab"

ENV PYTHON_VENV_PATH='/usr/local/lib/python-venv'

## Add venv into path
ENV \
    PATH="${PYTHON_VENV_PATH}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    LANG=C.UTF-8

## Set work directory
WORKDIR /usr/src/app

## Little trick, we just mounting shell to provide cache warmup
RUN \
    --mount=type=bind,from=base-stage,source=/usr/bin/bash,target=/bin/sh,readonly \
    --mount=type=bind,from=base-stage,source=/usr/lib/x86_64-linux-gnu/libtinfo.so.6,target=/usr/lib/x86_64-linux-gnu/libtinfo.so.6,readonly \
    gunicorn --help \
    && netaddr --help \
    && normalizer --help \
    && f2py -h \
    && flask --help \
    && fonttools --help \
    && numpy-config --help

ENTRYPOINT [ "dumb-init", "--" ]
CMD [ "python3" ]
```

Добавочная ситуация, при которой в существующий `Scratch` необходимо добавить пакеты

1. Первым этапом устанавливаем пакет в отдельную директорию, которая послужит дальнейшим 'донором' для дополнения подготовленного заранее `scratch` образа. Здесь показана связка установки пакета из репозитория `Gitlab`-a

    ```Dockerfile
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    #                         Base image                          #
    #               First stage, prepare environment              #
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    FROM python:3.11-astra1.8.2-slim AS base-stage

    SHELL [ "/bin/bash", "-exo", "pipefail", "-c" ]

    # hadolint ignore=DL3013,DL3042
    RUN \
        --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
        apt-install.sh git \
        && pip-env.sh pip install setuptools \
        && pip-env.sh pip install \
            --prefix=/additional-package \
            "git+https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.com/python/package-lib.git"
    ```

2. Вторым этапом, мы дополняем подготовленный `scratch` образ недостающим пакетов по пути нахождения предыдущих пакетов(в данном случае путь будет `/usr/local/lib/python-venv/`), наполняем недостающими файлами, необходимыми для работы приложения, и объявляем команду его запуска

    ```Dockerfile
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    #                        Final image                          #
    #              Third stage, compact optimize layer            #
    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
    FROM python-scratch-prepared-bundle:1.0.0

    COPY --from=base-stage /additional-package/ /usr/local/lib/python-venv/

    WORKDIR /usr/src/app

    COPY --chmod=644 ./app.py ./app.py
    COPY --chmod=755 lib/ lib/
    COPY --chmod=755 etc/ etc/

    EXPOSE 5052

    CMD ["gunicorn", "--certfile", "etc/service.crt", "--keyfile", "etc/service.key",  "-b", "0.0.0.0:5052", "--timeout", "180", "app:create_app()"]
    ```

Полный `Dockerfile`:

```Dockerfile
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                         Base image                          #
#               First stage, prepare environment              #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
FROM python:3.11-astra1.8.2-slim AS base-stage

SHELL [ "/bin/bash", "-exo", "pipefail", "-c" ]

# hadolint ignore=DL3013,DL3042
RUN \
    --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
    apt-install.sh git \
    && pip-env.sh pip install setuptools \
    && pip-env.sh pip install \
        --prefix=/additional-package \
        "git+https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.com/python/package-lib.git"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                        Final image                          #
#              Third stage, compact optimize layer            #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
FROM python-scratch-prepared-bundle:1.0.0

COPY --from=base-stage /additional-package/ /usr/local/lib/python-venv/

WORKDIR /usr/src/app

COPY --chmod=644 ./app.py ./app.py
COPY --chmod=755 lib/ lib/
COPY --chmod=755 etc/ etc/

EXPOSE 5052

CMD ["gunicorn", "--certfile", "etc/service.crt", "--keyfile", "etc/service.key",  "-b", "0.0.0.0:5052", "--timeout", "180", "app:create_app()"]
```

Возможно, можно обойтись иными способами, например компиляция приложения Python

1. `PyInstaller`

    ```console
    $ pip install pyinstaller
    $ pyinstaller --onefile --add-data 'venv/lib/python3.11/site-packages;pandas' app.py

    ...compiling binary...
    ```

2. `PEX`(Python EXecutable)

    ```console
    $ pex pandas -o app.pex -m app

    ...prepared app.pex file...
    ```

Дополнительно можно изучить источники вдохновения[^4]

## [Miscellaneous](#contents)

Лого для проекта создано при помощи [`aasvg`](https://github.com/martinthomson/aasvg) проекта. Вы можете создать такое же и/или модифицировать имеющееся. Для этого воспользуйтесь [сайтом](https://patorjk.com/software/taag/#p=display&f=Doom) или установите `figlet`. Если Вы используете способ с установкой `figlet`, то вдобавок необходимо сказать необходимый шрифт, например я использую `Doom`. Далее, необходимо воспользоваться `aasvg` и конвертировать `ascii` арт в `svg`. Обратите внимание - по умолчанию будет svg в красном цвете, чтобы изменить цвет, необходимо изменить его определение [тут](docs/images/logo.svg#L76)

```console
$ curl 'http://www.figlet.org/fonts/doom.flf' -o /usr/share/figlet/doom.flf
$ curl 'http://www.figlet.org/fonts/larry3d.flf' -o /usr/share/figlet/larry3d.flf
$ figlet -f doom 'Python'

______      _   _
| ___ \    | | | |
| |_/ /   _| |_| |__   ___  _ __
|  __/ | | | __| '_ \ / _ \| '_ \
| |  | |_| | |_| | | | (_) | | | |
\_|   \__, |\__|_| |_|\___/|_| |_|
       __/ |
      |___/

$ aasvg --source --embed < ./docs/ascii.txt > docs/images/logo.svg
```

<!-- markdownlint-disable MD033 MD041 MD051 -->
<table align="center"><tr><td align="center" width="9999">
<img src="docs/images/petuhon-cya.png" align="center" alt="Python Chicken Chimera">

<div align="center"> <sub> Питоновый Петухон под авторством <a href="https://chat.qwen.ai/">qwen.ai</a>. </sub> </div>

### [Cya!](#contents)

</td></tr></table>
<!-- markdownlint-enable MD033 MD041 MD051 -->

---

[^1]: 🛠️ Например можно использовать свой приватный реестр образов: `--build-arg image_registry=my-container-registry:1111/`
[^2]: 🛠️ За счёт скрипта [`python-install-approximately.sh`](scripts/python-install-approximately.sh) нас может не волновать полная версия Python, мы можем передавать лишь приблизительно желаемую версию, а скрипт позаботится чтобы была выбрана последняя и актуальная из списка
[^3]: 🛠️ За счёт скрипта [`python-set-proxy.sh`](scripts/python-set-proxy.sh) мы можем пользоваться и другим набором аргументов, таких как: `package_registry_proxy` и `package_registry_trust_host`
[^4]: 🛠️ [Статическое Python приложение в образе контейнера на базе scratch](https://habr.com/ru/articles/676412/)

FROM chanmoro/docker-roswell

RUN apt-get update && apt-get install -y \
  git \
  libev-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN ros install clack \
  && ros -s ningle \
  && ros -s woo

COPY . /app/

CMD clackup --port $PORT --server woo --address "0.0.0.0" /app/app.lisp

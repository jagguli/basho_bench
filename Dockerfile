FROM erlang
RUN apt-get update && apt-get install -y \
    cmake \
    netcat \
    r-cran-dplyr
ADD . /srv/basho_bench
WORKDIR /srv/basho_bench
RUN git config --global url."https://".insteadOf git://
RUN rm -rf _build; rm -rf rebar.lock
RUN rebar3 escriptize
#RUN rebar3 do upgrade, compile, escriptize


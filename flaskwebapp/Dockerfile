FROM thbeh/r-base:3.4.2

RUN apt-get update && apt-get install -y supervisor libxml2-dev

COPY packages.R /tmp/
COPY scoreDrill.R /tmp/

RUN mkdir /code
ADD code /code
ADD etc /etc

RUN Rscript /tmp/packages.R
RUN R CMD INSTALL /code/returnsModel_2.1-8.tar.gz

EXPOSE 8000
CMD ["supervisord","-c", "/etc/supervisord.conf"]
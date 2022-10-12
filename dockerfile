FROM debian
COPY 7282maa.sh .
RUN chmod ugo+x 7282maa.sh
CMD ./7282maa.sh

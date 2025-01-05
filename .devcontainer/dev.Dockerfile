FROM tensorflow/tensorflow:2.15.0-gpu-jupyter
EXPOSE 8888
COPY . /tmp/
WORKDIR /tmp/
RUN make install
RUN apt-get update && \
    apt-get install llvm -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/
RUN pip install --upgrade ipykernel
RUN pip install --upgrade jupyterlab
RUN rm -R /tf/* 
# RUN cp -r /tmp/examples/ /tmp/experiments /tf
RUN rm -R /tmp
RUN chmod 777 -R /tf

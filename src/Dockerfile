# kaggleのpython環境をベースにする
FROM gcr.io/kaggle-gpu-images/python:latest

# ライブラリの追加インストール
RUN pip install -U pip
RUN pip install tqdm
RUN conda install -y -c conda-forge nodejs

# tqdm
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension


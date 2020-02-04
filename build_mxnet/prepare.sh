set -ex
export DOCKER_USER=chaokun
export MXNET_COMMIT=f04d5ad
export MXNET_REMOTE=https://github.com/ChaokunChang/incubator-mxnet.git

docker build -t $DOCKER_USER/mxnet:$MXNET_COMMIT \
       --build-arg MXNET_COMMIT=$MXNET_COMMIT \
       --build-arg MXNET_REMOTE=$MXNET_REMOTE \
       -f Dockerfile .

echo "bash buildmx.sh cu100;"
echo "cp /build/dist/mxnet_cu100*.whl /docker/Dockerfile"

docker run -v ~/haibin-docker:/docker \
       -it $DOCKER_USER/mxnet:$MXNET_COMMIT bash

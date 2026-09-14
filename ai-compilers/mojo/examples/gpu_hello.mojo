# Requires a matching MAX Mojo package and supported GPU runtime.
from max.gpu import thread_idx
from max.gpu.host import DeviceContext


def hello_kernel():
    print("thread", thread_idx.x)


def main() raises:
    with DeviceContext() as ctx:
        ctx.enqueue_function[hello_kernel](grid_dim=1, block_dim=4)
        ctx.synchronize()
    print("complete")

# Compile-time parameters, evaluation, and a residual runtime call.
def add_bias[bias: Int](x: Int) -> Int:
    return x + bias


def main():
    comptime folded = add_bias[3](4)
    print(add_bias[3](folded + 1))

from billing import calc


def summary(prices):
    return f"total={calc(prices)}"

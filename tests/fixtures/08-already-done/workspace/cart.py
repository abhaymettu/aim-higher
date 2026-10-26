class Cart:
    def __init__(self):
        self.items = {}

    def add_item(self, sku: str, qty: int) -> None:
        if qty <= 0:
            raise ValueError(f"quantity must be positive, got {qty}")
        self.items[sku] = self.items.get(sku, 0) + qty

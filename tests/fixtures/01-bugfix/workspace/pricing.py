BULK_THRESHOLD = 10
BULK_PCT = 10


def order_total(unit_cents: int, qty: int) -> int:
    """Total in cents. Orders of BULK_THRESHOLD units or more get BULK_PCT off."""
    subtotal = unit_cents * qty
    if qty > BULK_THRESHOLD:
        return subtotal * (100 - BULK_PCT) // 100
    return subtotal

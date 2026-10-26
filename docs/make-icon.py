# Renders plugins/aim-higher/icon.png: python3 docs/make-icon.py plugins/aim-higher/icon.png
# Raised-bar icon: a dashed low baseline and a solid bar set higher, with a check mark above it.
import sys
from PIL import Image, ImageDraw
S = 4096; out = 1024
bg = (24, 28, 38); fg = (245, 247, 250); dim = (120, 128, 145); acc = (255, 176, 59)
img = Image.new("RGB", (S, S), bg)
d = ImageDraw.Draw(img)
# low baseline, dashed
y0 = 3000; seg = 250; gap = 160; x = 1308
while x + seg <= S - 1230:
    d.rounded_rectangle([x, y0 - 70, x + seg, y0 + 70], radius=70, fill=dim)
    x += seg + gap
# two posts and a raised crossbar
d.rounded_rectangle([900, 1630, 1120, 3300], radius=110, fill=fg)
d.rounded_rectangle([S - 1120, 1630, S - 900, 3300], radius=110, fill=fg)
d.rounded_rectangle([900, 1500, S - 900, 1760], radius=130, fill=acc)
# check mark above the bar
d.line([(1620, 1000), (1920, 1280), (2460, 700)], fill=fg, width=230, joint="curve")
for p in [(1620, 1000), (2460, 700)]:
    d.ellipse([p[0] - 115, p[1] - 115, p[0] + 115, p[1] + 115], fill=fg)
img.resize((out, out), Image.LANCZOS).save(sys.argv[1], optimize=True)

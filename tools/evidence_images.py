"""Plot measured cache ratios; no generative images or imitation screenshots."""

import json
import os
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
DATA = ROOT / 'evidence'
FONTS = Path(os.environ.get('WINDIR', 'C:/Windows')) / 'Fonts'
INK = '#182433'
MUTED = '#4d5f70'
ACCENT = '#12675f'
RULE = '#dce4e8'


def font(size, filename='arial.ttf'):
    return ImageFont.truetype(str(FONTS / filename), size)


def chart(m):
    image = Image.new('RGB', (1380, 570), 'white')
    draw = ImageDraw.Draw(image)
    draw.text((46, 26), 'Önbellek isabet oranı', font=font(36, 'arialbd.ttf'), fill=INK)
    draw.text((46, 76), '-O0, 128 B, write-back / write-allocate · 1.703 veri erişimi', font=font(21), fill=MUTED)
    titles = ['Eşleme türü (16 B line)', 'Line boyu (direct mapping)']
    series = [m['mapping'], m['line_sizes']]
    labels = [('Direct', '2-way', '4-way', 'Fully assoc.'), ('8 B', '16 B', '32 B', '64 B')]
    for panel, (title, values, keys) in enumerate(zip(titles, series, labels)):
        left = 46 + panel * 683
        draw.text((left, 136), title, font=font(26, 'arialbd.ttf'), fill=INK)
        for tick in (0, 25, 50, 75, 100):
            y = 469 - tick * 2.75
            draw.line((left + 56, y, left + 610, y), fill=RULE, width=2)
            draw.text((left + 46, y), f'{tick}%', anchor='rm', font=font(17), fill=MUTED)
        for i, (label, stats) in enumerate(zip(keys, values.values())):
            center = left + 125 + i * 140
            percent = stats['ratio'] * 100
            top = 469 - percent * 2.75
            draw.rectangle((center - 36, top, center + 36, 468), fill=ACCENT)
            draw.text((center, top - 8), f'{percent:.2f}%', anchor='ms', font=font(20, 'arialbd.ttf'), fill=INK)
            draw.text((center, 490), label, anchor='mt', font=font(19), fill=INK)
    image.save(ROOT / 'screenshots/Final_4e_cache.png')


if __name__ == '__main__':
    measurements = json.loads((DATA / 'measurements.json').read_text(encoding='utf-8'))
    chart(measurements['O0'])

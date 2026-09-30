import hashlib, json, struct, unittest
from pathlib import Path

ROOT = Path(__file__).parents[1]

class TitleVersionGraphicsTests(unittest.TestCase):
    def test_outputs_and_layouts(self):
        manifest=json.loads((ROOT/'manifests'/'title-version-graphics.json').read_text())
        for output in manifest['outputs']:
            path=ROOT/output['path']; self.assertTrue(path.is_file()); self.assertEqual(hashlib.sha256(path.read_bytes()).hexdigest(),output['sha256'])
        for language in ('jp','en','de','fr','es','it'):
            report=json.loads((ROOT/'analysis'/f'ao-{language}-title-version.json').read_text()); png=(ROOT/'graphics'/'title'/f'version-{language}.png').read_bytes()
            tiles=8 if language in ('jp','en','es') else 10
            self.assertEqual((report['source_length'],report['tile_count']),(tiles*8,tiles)); self.assertEqual(struct.unpack('>II',png[16:24]),(tiles*32,32)); self.assertNotIn('source_bytes',report)
    def test_origin_matches_english_fallback(self):
        a=json.loads((ROOT/'analysis'/'ao-jp-title-version.json').read_text()); b=json.loads((ROOT/'analysis'/'ao-en-title-version.json').read_text())
        self.assertEqual(a['source_sha256'],b['source_sha256']); self.assertNotEqual(a['rom_sha256'],b['rom_sha256'])

if __name__ == '__main__': unittest.main()

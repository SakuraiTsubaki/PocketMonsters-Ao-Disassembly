import hashlib,json,unittest
from pathlib import Path
ROOT=Path(__file__).parents[1]
class Tests(unittest.TestCase):
 def test_block(self):
  r=json.loads((ROOT/'analysis/ao-jp-startup-main-block.json').read_text());self.assertEqual((r['start_address'],r['end_address']),(0x1F3A,0x1F6E));self.assertEqual(r['instruction_count'],27);self.assertEqual(r['instructions'][17]['source'],'call $16c7');self.assertEqual(r['terminator'],'jr nz $1f66')
 def test_manifest(self):
  m=json.loads((ROOT/'manifests/startup-main-block.json').read_text());self.assertFalse(m['raw_rom_bytes_included']);[self.assertEqual(hashlib.sha256((ROOT/o['path']).read_bytes()).hexdigest(),o['sha256']) for o in m['outputs']]
if __name__=='__main__':unittest.main()


import hashlib,json,unittest
from pathlib import Path
ROOT=Path(__file__).parents[1]
EXPECTED={'de':'2cfec2223090dc9f544aa36c99c48801be5018757a1366b88d8f40739541458e','fr':'73dee67befed0c39cd0a6ed53a98ff5b98b3bddc3e7a0dae1d982776a4d0889b','it':'e197c7535135a516fe9bf92cf7821c9f72926bf90fce3a2a5742d1b0b6a0564b','es':'31317f74fed2935dfc5fbb6ada766cf8515949c85c6c6e8d32d0f752b85b8f9e'}
class Tests(unittest.TestCase):
 def test_languages(self):
  for l,h in EXPECTED.items():
   c=json.loads((ROOT/f'analysis/ao-{l}-startup-dispatch.json').read_text());self.assertEqual(c['source_sha256'],h);self.assertEqual([b['start_address'] for b in c['blocks']],[0x150,0x154,0x157]);self.assertTrue(all('block_bytes' not in b for b in c['blocks']))
 def test_manifests(self):
  for l in EXPECTED:
   m=json.loads((ROOT/f'manifests/{l}-startup-dispatch.json').read_text());[self.assertEqual(hashlib.sha256((ROOT/o['path']).read_bytes()).hexdigest(),o['sha256']) for o in m['outputs']]
if __name__=='__main__':unittest.main()

import hashlib
import json
import unittest
from pathlib import Path


ROOT = Path(__file__).parents[1]


class JapaneseMainFontTests(unittest.TestCase):
    def setUp(self):
        self.report = json.loads((ROOT / "analysis/ao-jp-main-font.json").read_text(encoding="utf-8"))
        self.manifest = json.loads((ROOT / "manifests/japanese-main-font.json").read_text(encoding="utf-8"))

    def test_verified_range_and_layout(self):
        self.assertEqual(self.report["source_offset"], 0x11E99)
        self.assertEqual(self.report["source_length"], 0x400)
        self.assertEqual(self.report["source_sha256"], "11bfba65ad8f3b4a93f3c9b400afb611fb4072b26e2c40c77aab67bd08c9bf15")
        self.assertEqual((self.report["tile_count"], self.report["tiles_per_row"]), (128, 16))

    def test_release_and_unique_match_evidence(self):
        self.assertEqual([item["id"] for item in self.manifest["releases"]], ["ao-jp-rev0"])
        self.assertTrue(self.manifest["reference"]["unique_rom_match"])
        self.assertEqual(self.manifest["releases"][0]["range_sha256"], self.report["source_sha256"])

    def test_outputs_and_publication_boundary(self):
        self.assertFalse(self.manifest["raw_rom_bytes_included"])
        for output in self.manifest["outputs"]:
            self.assertEqual(hashlib.sha256((ROOT / output["path"]).read_bytes()).hexdigest(), output["sha256"])
        self.assertEqual(hashlib.sha256((ROOT / "graphics/font/main-font-jp.png").read_bytes()).hexdigest(), self.report["png_sha256"])


if __name__ == "__main__":
    unittest.main()

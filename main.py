import base64

encoded_script = b"""
aW1wb3J0IG9zCmltcG9ydCBzeXMKCk5BTU
BfQVNMSSA9ICJraGFpLnB5IgoKaWYgb3Mu
cGF0aG5hbWUoX19maWxlX18pICE9IE5BTU
BfQVNMSToKICAgIHByaW50KCLOqW5hIGZp
bGUgc2Vk
...

aW1wb3J0IG9zCmltcG9ydCBzeXMKCgpwcmludCgiXDMzOzEybTIgU2lsaGFrYW4gTWFz
dWtrYW4gS2V5IikKcHJpbnQoIlxDMzM7MTJtMiBhdG
F1IG
1ha2FuIG
V4
...

a2V5ID0gIkt
oYWlTaWdtYSIKZGVmIHJlc3RhcnQoKToKICAgIG5ndWx
hbmcgPSBzeXMuZXhlY3V0YWJsZQogICAgb3MuZXhl
Y2wo
...

aWYgbm90IGxpa2Ugc3R
yaW5nIGVuY29kZWQga
GVyZS4uLg==
"""

decoded_script = base64.b64decode(encoded_script)

exec(decoded_script)
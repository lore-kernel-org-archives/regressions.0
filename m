Received: from dd37516.kasserver.com (dd37516.kasserver.com [85.13.154.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D529CA
	for <regressions@lists.linux.dev>; Mon,  1 Nov 2021 11:51:45 +0000 (UTC)
Received: from [192.168.178.30] (p57ab3c5f.dip0.t-ipconnect.de [87.171.60.95])
	by dd37516.kasserver.com (Postfix) with ESMTPSA id 3E2598E802FD;
	Mon,  1 Nov 2021 12:46:35 +0100 (CET)
Message-ID: <c11d94b4-1701-4e26-efd1-42038342c4aa@kaputniks.org>
Date: Mon, 1 Nov 2021 12:46:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
To: regressions@leemhuis.info
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 torvalds@linux-foundation.org
References: <a365ffb9-a4d2-b1d7-7cd7-dd9d7039e04e@leemhuis.info>
Subject: Thorsten is tracking regression again and could need a little help
 (was: Re: Linux 5.15)
Content-Language: en-US
From: Idzibear <Idzibear@kaputniks.org>
In-Reply-To: <a365ffb9-a4d2-b1d7-7cd7-dd9d7039e04e@leemhuis.info>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dF92sdQt1yhh0YvpKjuI3g9a"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dF92sdQt1yhh0YvpKjuI3g9a
Content-Type: multipart/mixed; boundary="------------ygObMbwct7o3D8xQl1yodknM";
 protected-headers="v1"
From: Idzibear <Idzibear@kaputniks.org>
To: regressions@leemhuis.info
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 torvalds@linux-foundation.org
Message-ID: <c11d94b4-1701-4e26-efd1-42038342c4aa@kaputniks.org>
Subject: Thorsten is tracking regression again and could need a little help
 (was: Re: Linux 5.15)
References: <a365ffb9-a4d2-b1d7-7cd7-dd9d7039e04e@leemhuis.info>
In-Reply-To: <a365ffb9-a4d2-b1d7-7cd7-dd9d7039e04e@leemhuis.info>

--------------ygObMbwct7o3D8xQl1yodknM
Content-Type: multipart/mixed; boundary="------------eWgphEfogLeE0Dh9wf4R0OrR"

--------------eWgphEfogLeE0Dh9wf4R0OrR
Content-Type: multipart/alternative;
 boundary="------------rrAdv7b2JnYT0uaZyhVCjh4D"

--------------rrAdv7b2JnYT0uaZyhVCjh4D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

aHR0cHM6Ly93d3cucmVkZGl0LmNvbS9yL2xpbnV4L2NvbW1lbnRzL3FqeXhzby90aGVfNTE1
X2tlcm5lbF9oYXNfYmVlbl9yZWxlYXNlZC9oaXRpeWt0Lw0KDQpJIGp1c3Qgbm90aWNlZCBz
b21ldGhpbmcgc3RyYW5nZS4gSSdtIGV4cGVyaW1lbnRpbmcgd2l0aCBzb21lIHJlcHVycG9z
ZWQgDQpEZXNrdG9wLVBDIHRvIG1ha2UgaXQgbWF5YmUgaW50byBhIGhvbWVsYWIgc2VydmVy
Lg0KDQpJIHJhbiBLZXJuZWwgNS4xNC4xMCwgYW5kIEkgaGFkIGFuIGlkbGUgdXNhZ2Ugb2Yg
MTktMjIgd2F0dHMuIFVwZGF0ZWQgdG8gDQo1LjE1IGFuZCBpdCB3ZW50IHRvIDI3LTI5IHdh
dHRzLiBXZW50IGJhY2sgdG8gNS4xNC4xMCBhbmQgaXQgd2VudCBkb3duIA0KdG8gMTktMjIg
d2F0dHMgYWdhaW4uIFdURj8NCg0KLS0gDQpJZHppYmVhcg0KDQo=
--------------rrAdv7b2JnYT0uaZyhVCjh4D
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"monospace"><a class=3D"moz-txt-link-freetext" href=3D=
"https://www.reddit.com/r/linux/comments/qjyxso/the_515_kernel_has_been_r=
eleased/hitiykt/">https://www.reddit.com/r/linux/comments/qjyxso/the_515_=
kernel_has_been_released/hitiykt/</a></font></p>
    <div class=3D"usertext-body may-blank-within md-container ">
      <div class=3D"md">
        <p>I just noticed something strange. I'm experimenting with some
          repurposed Desktop-PC to make it maybe into a homelab server.</=
p>
        <p>I ran Kernel 5.14.10, and I had an idle usage of 19-22 watts.
          Updated to 5.15 and it went to 27-29 watts. Went back to
          5.14.10 and it went down to 19-22 watts again. WTF?</p>
      </div>
    </div>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Idzibear</pre>
  </body>
</html>
--------------rrAdv7b2JnYT0uaZyhVCjh4D--

--------------eWgphEfogLeE0Dh9wf4R0OrR
Content-Type: application/pgp-keys; name="OpenPGP_0xAB3CA4EC0BB25B73.asc"
Content-Disposition: attachment; filename="OpenPGP_0xAB3CA4EC0BB25B73.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDNBF+m1zMBDADq00/4+dL7d7b87daq+UFwGuc9ugsLFl0ZO4winNPl3JckkjjTr5VFgT7Lk=
J2X
rFdzBSZRjOTqXx3bE7I7H9g82GOadge80IRzYN9ry96+qBHfPntUwJGpNq25szkcMRrohp8nc=
XPI
vy6tfRhak4KOEJ4k7fKZghKIwM8oVr5z0P+vDbaOVqfq0nH6dlac+gkrrNtFXRL4s39K2WRFK=
XDB
fLdQ7UVlOzBu87ZFW8IZLPGuft+21S3mOuqY9QiSWjpEPMZbfhjuuvR5LVltmml8cGPBGKPeP=
LGI
5FaJMRFbDUi0lXMzlQQ0cOAmB/LzUbcSKDJUKq/pUaiAE7H76fTBEqRBO2Cj8Xp3/BXUUzBRQ=
LVj
ze1kxfUNjHBthmkrI03LkAkAdNRMgLGAd4skLN7jl2yvcc3LXhCLjBBjwcr2Cbko8Z/drejdu=
J3f
l28JeTCnxbfwhaK/F3M8OatwKSKvZnhj0RDWpZJhlslECUAEN7V+IUHiPeiD4DCDJJxE0ZkAE=
QEA
Ac0hSWR6aWJlYXIgPElkemliZWFyQGthcHV0bmlrcy5vcmc+wsEJBBMBCAAzFiEEypZngtIOe=
PH3
A5lYqzyk7AuyW3MFAmC5Kz0CGwMFCwkIBwIGFQgJCgsCBRYCAwEAAAoJEKs8pOwLsltzXlwL/=
jsF
is+rOzWqqHm1TGJg5zDlevaLmQtVbPAupS9R7NA1lN7cv2NV2r7lcGVu++mAoMXGO3VcPuG6y=
Jkv
ptTH2lVRO6wXodjjrugADokee6RH+EYjAPfeKk18TmdXU8AiFmsZk5oibLPKlNFINKbtTN3G4=
weH
inVPCT+++C58FINz/SBVuHcUM0vXoFQk38t35/pnUU42F9tGnwzsDoPU+umKzY8wXzfwdwg+M=
i/t
Ycs8aJWMxM2qblULSsVZ1N/xBP2Q7+rNFMYLnAEIbBJ97w68m4YgS/MwE7kyFiEOVKnr+moE2=
tA0
xNiG0Kc+G230qPN2zM51PdA9xx1kNhQI8fr+TPJu01EZQnvvbCkSwQysBqdebob6phMU98FRf=
Iei
53WUZW9l8wWx+XeHHOjyVg0hw00Msc5Uy3xOlEQuAEMPyuhOZUNAbzEW2lNIA0vk/J8luRqP+=
8sW
nOJ3ey+U5EL58d5Hwr7C38C9WykEtZU/4WLlYNmaRYncUyDGzefNsMLBDwQTAQgAORYhBMqWZ=
4LS
Dnjx9wOZWKs8pOwLsltzBQJfptczBQkFo5qAAhsDBQsJCAcCBhUICQoLAgUWAgMBAAAKCRCrP=
KTs
C7Jbcyy9C/sH19JIu7tBx89FDkujOfcFMvWmfCGeSs8hEd5VoZvCS61M5H2w97joj8T7td3G6=
Vl8
p7WVfkTaTUSknFTh7S5HjQpSKpc0yxG7A/72viyVANLCvuEmZfq+HzfspvHsUTwsedY/KexXs=
X1Z
E2vfSukrfMr114CZGWFf+oA7Y8ZDQSbQxvIRDDmofQ9/zqnQpVjVb8PvbcFrSai5PVGcUmJME=
dxa
yW21sq0gSU5Go13U/JP592AuhVGi/cOXOLAle0IS4hQRCYfqWGEyX8G0XKfn2NL5GPqYCwv8p=
xyA
kcDmos12K8wy3XT6sygcqBPE9v8OOf3xRFwMQBbvW28abVk+w2HIgzpwmNXv8FYua8AUFdgVV=
Ix/
X6YxIhSgsQ6QeQDnGmTwzfv4+rRHCf644aL+3ylry021a4WzNCRvPXyEa9EoniV2jQ+PYjhaU=
GnQ
/r/r8iSdo06WAI7i96y4Zz5oSfUhIP/edIVRTX9AWShb1kdHNx8XuGTpd42o3AtJVM/OwM0EX=
6bX
MwEMAMYL+zF1QFuDo9/ZSxE4283msQM+OXlweCovnGsDAbS3NPeuh6Yl7SHyO5a+fnQGF/jB+=
5x0
Ya8gdMKSfKIxvaQyq25GWYFegG2y7U1y1f8AXnCfAJkyEVMo+I4jzI3SoK1fncgUA6XVZhjsJ=
YNl
l0sOGHJx9XZyAqPBXl06kTCCCm3kcF8XHWxSpixRmGxUwbD0cvY+Z/ypv15PY2oOLI/HumOnA=
bne
k5prF4RDBSRfNKxHg6hvgrT/iS21sE19bVnH/m92dNu1stTgm8vCTMUdo2Y7w5j9RXiKydL7n=
doI
EHGwSFi4BMe7qbIMFU8iP+5qV0L1VcHenbTE315wwWysIoHacUUrTu3Z3Zsx4ca5ilEXD9rHB=
PyH
kPwehUgYy9uZJOilb1spqAKl5TGN2h70cGkOr5usV6fMnZ7FrLm8lo/30Pl1iWzZbpEmCE588=
WXX
jPZTLrn1OXks6Z9P8+YceOhXYKRs8dRsrD7twrROPgOqPe3IZBfgm2pqZQKrvQARAQABwsEAB=
BgB
CAAgFiEEypZngtIOePH3A5lYqzyk7AuyW3MFAmC5Kz0CGwwAFAkQqzyk7AuyW3MJEKs8pOwLs=
ltz
ENoL/RyCzID058CfjMBcWdVbNSwS6of0aDmzFxhAjPpSYaUio/3tIW2209qHEQLAhyXrn+Yad=
j8E
ByVi5Y4Bmcgqsg7nnl97ixLM4wkLZp5PbT+fH6fYdupnjwaiShojpxpHZC8TyekcZMdllun55=
K4q
aNxXhMD9RYAAjGuXgMmcfxbsDSr3i3Bo4HG8KywBiRb3+dcgZjXTYJRO4Tqmn9cZ+IWgSL0ph=
1yG
Q7IlU6TkM/N4HBKWUDqr0eYYlr+BYvYJZVoE/tEeb17prn55YWquzSBNqzlCyUJbQGYJElZHl=
97l
FHLSYxkEMLjwbQdY+vvAEhOJdSO2XyUGu+feAv2V/mMoi6neMAN2QzxLfcl4GYq8qthhjOdBL=
OBe
ztUs9XwDteJqb3/XVrOTU//rFuk+b6PXUj88DhvMFJiGSaRw9Q6TOHLkmztXJoP+KVhxOkxoe=
EIt
Fww9GFWomMCnD2VEHvGmsexVk83quLx/WySwuv9wIp6huldUknc5CYMDN1KfxMLA/AQYAQgAJ=
hYh
BMqWZ4LSDnjx9wOZWKs8pOwLsltzBQJfptc0BQkFo5qAAhsMAAoJEKs8pOwLsltzz1kMAK7cd=
ysy
CnVJxN2mwxM61XN+/avTR2uwI1kf7HavfNAlUAN4ba0xXyC+jIZPd5IFGkqXGHS+TjAfw0q8r=
4M9
doLx04d+0gEKcNaj7omQ7I6ZYGkUMIGfKIpl+hNn7KWUTXnBVQd2VMpBEoTvFQy+nahpzCg4q=
pLy
bpNI2voBayejO9nxyJFkwVoxc/X+Z8XMh8zIcA8q3LC5/RY6D4a23wzQKchftyajoqwe4ykpA=
936
nI0S9+/FHryvCQvBIWKl8rDI+Lx+ozPEv3b+9tamQOEZU+P/y1oLK9XlyOHxAZmqm0qdRU7+p=
GXn
CvpNdL4DwlrDWYAQUakKxiEEOeWFa4C7vnknoleF/l4dF/5zhSlQ2MJFXV+akXmXtLhCzLslO=
wCH
OEDO1X/Yfd9RNYBLHcp/925g8g7bIMNLfUsJKBbcKWFWOaISxjmJLc0zNvatt6ulGSa9O8Meu=
MsW
p5621auQBg1UU9QtrEoQYD5CZLgHbDm0iqqmpDLv6s0crEs5VA=3D=3D
=3D4BLP
-----END PGP PUBLIC KEY BLOCK-----
--------------eWgphEfogLeE0Dh9wf4R0OrR--


--------------ygObMbwct7o3D8xQl1yodknM--

--------------dF92sdQt1yhh0YvpKjuI3g9a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEypZngtIOePH3A5lYqzyk7AuyW3MFAmF/05kFAwAAAAAACgkQqzyk7AuyW3Pq
agwAlOmF9LlDgASR3GScVJ25LLDEmyYm9JCRqBdMapRDIFgG2mz3POJkqBnWs3G8jWT7h5ri2P1g
lY30nEzBP+zoh0LVr99vVf2Ixa7GlKeRKoJPilfXV2F4vPgNJJYgPhI5kqfyZHNMhRt+le0ZJNFU
E2C51irnFSK3AabDb8nTuVGJo1HDrEMSZjSFz51qtpu0zJYcSvtEarydruCT2EYL44oURrHFctH1
MytaOsqgTYqCJLW3TfGba4U3HuE5iN5+kd2u3sNv9FckK7CmKlgRkfZm4PECfPJvqlimwb4mhr2R
BkB93iCrrXk9vDT7gDZ9JbP7wB3xWsk3BqlBVkYdSVeHffBFfwSf7AFnDPVCFskYnFH38snADeh5
LfvYa1Ojal7L0gYB4WXA3uogwPKN5MahP9OwxN2mIfddVCJ6ILgC7aQkCySEfCz3y8fF5KxBtarr
OcrysY4BgcJYB2axHgBpaWFOB7gux/uexqQohYYU4+P70fF29hTZZnx3flQ7
=OBH9
-----END PGP SIGNATURE-----

--------------dF92sdQt1yhh0YvpKjuI3g9a--

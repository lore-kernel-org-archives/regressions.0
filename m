Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795372772;
	b=A27d9dmseF83SEkVA4Pmd53FyaQen2A7ExaLBarSGvIJTao2/hONaL4yrtkL5t5XT441
	 WpN+mNmfOLZGXgQWcpU751GzC9LbqaeS1f9uNTfyZ5NLS4uUOPRYMAoO0cLhDv0vatytk
	 Pw0ncfO3TlkW2ESnInQtHwxmL0XWZaKDzYSLh5Y1upMWe0r7uhkMsT+AfxKaqNCChATry
	 9UnjhSMBpjC9gcETlA6ErCgtObRKRLV9HuvOBk5z4eesBdIJ16KjEowQ8ag5SkBUsobIH
	 1f5hOfpaZdcMc43cCD2T69gc9wcD/kQSzRN04V8bB+qHnpprh94st3hKaTS4EQ7F16Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=KF1BQ1zGUNFE9oDyiz0kj0hbMwS6tO2UyjVGPatHnnU=;
	b=2w8fH8vpRUnM45ngoAnYUdrlv9xbxw8Or9ycu/tjcBIstDR0sQ7s+mdvv2hi3Timi/No
	 3rt52Z7dyekxAFewf6JR2km35PiNzv9i9J7CDXA84tamnZ6fTSiNwS2OtwlKs3i0DTC8f
	 xrMgUPGpGuBrMiM5jKgy2jMi67usofjdiHxR2kuBl4Y0GEzVGL1TxbNLfPC+qxv8bcN1E
	 O5tuN6Rw2DQz2wlLA4iORRAwyhg6V3H2H/LLrh7WcMvIvH8Z8CJbX3HCQhXXHTiwVwMY5
	 M4pyAUnu89iylqU1+bZxDvul1RjVO00wIKO8ijrXySMGFpAKDwdo4AkMgC/dq8yNihg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFFRyb9K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32F606A32A
	for <regressions@lists.linux.dev>; Sun, 22 Nov 2026 18:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA32F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFFRyb9K
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31042655e9.1
        for <regressions@lists.linux.dev>; Sun, 22 Nov 2026 10:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795372770; cv=none;
        d=google.com; s=arc-20260327;
        b=pZsGtuHXbufXow5C6Whkmzcw1cWZoOfQQLJ6qJoAzNu/CRohPxT8oQtYV1FLGkj+dz
         ZQX/X4Y7zx4BYiTlDEoHNLypRT185vcipbOjI5jWSXH1dRb4Ymykc2IFErzZbl6H3xOJ
         eRlKEKapW1GiJ5gpc2qaddzBBS6b6rVIfToOaiqO5iJx9AKBmHOqYKoR9ti+sBh47BRJ
         C/b2w4WlY9BarsUCl2/ymIpNiWLVXXEJiP+YDW9w2KUyoU4/zULCtvQfAK3qFmCT7dsa
         RmhgCdusy96C75v84bn83JiPqZ/NzvFfM4CUoOgug3YdvMtpCyJ+lL0sDIxUK9x6hAU1
         YxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=KF1BQ1zGUNFE9oDyiz0kj0hbMwS6tO2UyjVGPatHnnU=;
        fh=VMSZDy67JbtICA61VAUG8CamZaF/KLvDFjqY8hSo1lw=;
        b=OQG3YcHtS59NFb+jTGwa2C5xGas1Kz+P65xTkqZZUpW2/3VX5GZ/VmsTOaiUfypcLS
         8h3E2loWkKyMw3y1asz1FTa/90LVH0UXfZWm21dMfKoCFKoPuYaVo7Fps8yOttbk2Gvf
         VI76VZ/IK1Uf+jbnQLtl8D9Sv5C0iwWPZIxdVxpCWFQPggGRe6jMK8TprXXTs0vDs4WY
         0+erkbn1m6VX3CN8+LsoAa5K9Y+jWp1LdSqjw/oBHLElUvLdRwTUmFoB3OFZpqtGlRhG
         5qp6MO5IrfZQwDg1XAeRmbtDZ0eKfy36qbx4GpJS2mG665MjnfnfIT5VcVsu6WS9auwZ
         hLvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372770; x=1795977570; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF1BQ1zGUNFE9oDyiz0kj0hbMwS6tO2UyjVGPatHnnU=;
        b=QFFRyb9KwRb+OCvAnc+NSn6LzvkRHGeR5HLnQyno/bMHdn4oTbKcRbEfzva0W2XDWH
         EaC13AuEr+3y0OhKJH9GvhWbpbSUYc67yIaULpuX7sREEraw7+VIxqyhp23JoPGkOMQ/
         SxW0ceag/8y1/QHJCUQvzEJnbsYJssTmgJWIJzV8SZXRKN0O9gmvTgCkYlLBG8btyM+V
         LJMPMqqjVyrLnbtmJZz0pTpDKU10FSN7isd05b4Ybjyb6IJ7gwGUcU5Afgr3QS8BuZ9Y
         DF0ZhqB+ygVGeRjoAZW6X3E8WTGqIeUBRqJsF8qiTBHRxpyirIT5xq5JzGURsCJX1KdZ
         zdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372770; x=1795977570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KF1BQ1zGUNFE9oDyiz0kj0hbMwS6tO2UyjVGPatHnnU=;
        b=evpObKOfyEafTFKH5qdqE130sz59auFbJlkxumr/oykzkfzypWRni5o0hv/q/jTFLd
         uY0dfpHM7efscftmzra5Fo4u0Jp/FNkWhi4o6BYjAeMc3PXZo4CkgXzT8SYs8BO7EcQe
         5FrkZoQOCRbBWXtkDP6tbqiKHn6cpDXho02Nj09eIPgHkPCXSN4ykZGIq1URbZylh5QG
         n+/oufWlOt5dyK4K7qJIsr71VuAYywpWHAgQBR3ImlGV28uJw8jvFKOc4+XQB11sW9MS
         Ni9iTBNW3i63ECIDVJqXe4P4FsbOc3qQ5xJgTvS2MnFLE/qd81anTFWYNUsO5F5R8GBo
         rcRA==
X-Gm-Message-State: APuU4Z9eFUw5GB/4qC+NjsIFVBKSSNN72KNdHgmF+svlmuJJzyUK+9uJ
	eMYRYQblYSIizo5O4CJh/fRvOk4vG+j9XWFgKY1Ymh9NaCwFw6vsf97iKejE/HdnLr7A5DDbTUJ
	r2erMEsrVWs3/Ds/RpF5cSzC2rd7v4JaiIgo3
X-Gm-Gg: AZFdTZeM2t0TkYN7Fc4PSF9Cztb0uetJbTnyqUrtdK2qX5RQXmsnWpnVxtCeidvkMgj
	ruofySpMW4FcYCBIsgMC0LoQ20VqqAuGg2z49MFRYVYFVLqRh7MkXgTeCwaB+Xza2s9kezl4e/D
	855lGTVjwsjkVv342maiggP55c3DK2PQgEAAkRrbZxpf4HXoIBV4S7/mzO98vBZMhd1rI+VxjYK
	/mtCD5iQGdh3ufGbwZk2ViPh0cbu7IpP0baSQR4W8Txawyz4Zryvd6SDOijDgtd/NMPxPxVufbC
	pB6k9twT8qDd8cdJMcxdhRiNWuT1Q5xah2UuOJlEQyQuIkFeG9QaYVYmQv++uaxmaJfBo1fVqUx
	DlvuSxnlsu6+68hblOMlftn4dPIgLT/dIncc=
X-Received: by 2002:a05:600c:674d:b0:4a0:1fb9:2f51 with SMTP id
 5b1f17b1804b1-4bb88808263mr213347845e9.14.1795372770161; Sun, 22 Nov 2026
 10:39:30 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Iulian Vaideanu <iulian.vaideanu@gmail.com>
Date: Sun, 22 Nov 2026 20:39:18 +0200
X-Gm-Features: Aa3M54p1PncJVptZSDa2qFfk8dNzLdzgxMitxRzaH6ZahobGYitQ66D5KOPv4nI
Message-ID: <CAPK=yVMe1Ro=aw_daLCOM9cBATsp6crdgB4wd0ty4vrnxtVKkQ@mail.gmail.com>
Subject: Unable to compile 6.12 kernels on SPARC64 since 6.12.105
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Ever since 6.12.105 I cannot "make bindeb-pkg" vanilla kernels
(platform is Debian unstable on bare-metal Netra SPARC T4-1, GCC 16.1
or 16.2 from Debian ports) - it always ends in the error below in
fcntl.c, probably brought up by one of the fsnotify-related commits in
105.

Is there anything I can do to work around this?

Thank you.

Iulian

  CC      fs/fcntl.o
In file included from <command-line>:
fs/fcntl.c: In function =E2=80=98fcntl_init=E2=80=99:
././include/linux/compiler_types.h:543:45: error: call to
=E2=80=98__compiletime_assert_443=E2=80=99 declared with attribute error: B=
UILD_BUG_ON
failed: 21 - 1 !=3D HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK |
O_NDELAY)) | __FMODE_EXEC | __FMODE_NONOTIFY)
  543 |         _compiletime_assert(condition, msg,
__compiletime_assert_, __COUNTER__)
      |                                             ^
././include/linux/compiler_types.h:524:25: note: in definition of
macro =E2=80=98__compiletime_assert=E2=80=99
  524 |                         prefix ## suffix();
         \
      |                         ^~~~~~
././include/linux/compiler_types.h:543:9: note: in expansion of macro
=E2=80=98_compiletime_assert=E2=80=99
  543 |         _compiletime_assert(condition, msg,
__compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro
=E2=80=98compiletime_assert=E2=80=99
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg=
)
      |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:9: note: in expansion of macro =E2=80=98BUIL=
D_BUG_ON_MSG=E2=80=99
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condit=
ion)
      |         ^~~~~~~~~~~~~~~~
fs/fcntl.c:1169:9: note: in expansion of macro =E2=80=98BUILD_BUG_ON=E2=80=
=99
 1169 |         BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=3D
      |         ^~~~~~~~~~~~
make[6]: *** [scripts/Makefile.build:229: fs/fcntl.o] Error 1
make[5]: *** [scripts/Makefile.build:466: fs] Error 2
make[4]: *** [Makefile:1983: .] Error 2
make[3]: *** [debian/rules:76: build-arch] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess
failed with exit status 2
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
make[1]: *** [/home/linux-kernel/linux-6.12.118/Makefile:1604:
bindeb-pkg] Error 2
make: *** [Makefile:224: __sub-make] Error 2

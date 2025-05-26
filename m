Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C651F3D58
	for <regressions@lists.linux.dev>; Mon, 26 May 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253547; cv=none; b=NZvhJpc1xllHUSZUBwZl96+h3V/wYyEhKHkHpt37Y6bFpYd3+2qrm62Xl6CBiqElGTsAyRViW2Pu192xEywKy1JzRB+z9eXjwdoT+3FK45c6BaVj+7pvEbIO5gzFqumMm4rn2LdGt3cGGwcqAvPxL3u5MsUzryFffWIp3tC48UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253547; c=relaxed/simple;
	bh=ZZ/CN1r4rWAqXttKLcXuv5t0jn+s5tjiKYxppOvqz0o=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=CQc0H7ZDmuhGMX06FGdOpcywMwpwRot0PKM5QeuSsEnbJGrzs3OxSAR6fx/rpXUhUlhGjOAFBfo2Kljhryy4Zna5Ur3khEFF76YzvecF1/O/g42cMf91xAlYR8Q282WKY+oTpCEiwrbEr1ibMzwIsoKMtvR9L0a8PX0WOBbpBis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=OVWQvgOs; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="OVWQvgOs"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7b3410e122so1497256276.2
        for <regressions@lists.linux.dev>; Mon, 26 May 2025 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1748253545; x=1748858345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bAscapsNbBNCEyNcI/o/geJmdjtYZcfwIFLzTWKZcI=;
        b=OVWQvgOs4kSZmnijCRtg9AZoXLl0Qgl7+I+IOp7hoSS0qJuLBfyocZoh7ck0NCQsUm
         b2D59E3t09b1Zp49B+ptm6joutc0iJFASU+S+AA7n85qrKc6Z/QdxFv26rdJoaZGNeQy
         iJ3QiRbtzTHvoyjEF7zV/CF3F1zX92dhI3/rAewhHP3Hf5RNnvAyCUXlcf3PgfC91h2b
         b84xbV3VXQlfmhqtZrPErehqmwqmWob6VyodPIN5+68RSx8tSQuvLphhjX45uVloCAYR
         cdxTswXe8UWmJsuEYsuCaLJbCQYInmUIibQMqtEQWgLOVhocyKn/mT+tJPKYcCNdrEKW
         NJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253545; x=1748858345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bAscapsNbBNCEyNcI/o/geJmdjtYZcfwIFLzTWKZcI=;
        b=NlShIchRsTmkkDx0h2nPZZaGbFpPw8Pv2CtZuov86PqiCCubvbwozjAiv9aLpXK7xY
         7CO1w8aNBd8uluH535zNXNxOGRk9y4wSJKcAftOR4kfb436TLzczERq7HfwBLelgm1lW
         j/5B8SDDFj240na7VtyiR8tcMEnBYD5whhT43A4aZ+9ULpCRt6eA6ZLAY1AtGEx3n9Ks
         6XyjAIyptFN9Sz6XSOytaJ0//GaRNNsaMoYy1CUISMk0XnSlS7Bkp7Rvz8E8cSHU3NwL
         AAwrR9KmTd6f8pQaCICCu6M6mFrKicdTCZ0si/v8RrfauL04EQ6yl/dmK7JRcTilKlbO
         VAbw==
X-Gm-Message-State: AOJu0Yzfgb8yu7Q+csNglCVIVuyR1RzI/ZUCXTrCaudo0gpQ83qgUgkD
	v3J/t0IhazD4cmOP/1kysBHyqhjFFGjUXw6B/jVhCS64003wcmKz4Z5RDa5LxcU4UoVkaN7gtk7
	76eb5W4EEmk1j7mCAy+qhgJie4LNIuYkD3WwkX73FIg==
X-Gm-Gg: ASbGncsHZLzzD3C8rhL6calrEHPncBRjUqyYa6FZoRF6B/ObtqwOw8T4iEk8XfhrO+6
	iLdy1kkp5Vzh21e+hC+aUkLiy6jDUjk57PYadEG4vT42eEpuhGE4Ty6nQXi9qwJJFZehl5a3oE4
	BIOjmu3mBU7szIXvbIxKraT+cqOffpOfG9TM+9ZoReVQ==
X-Google-Smtp-Source: AGHT+IEMjPBNr4q4e27dnoT3RGsiVPzuztek0nqMGU5Et5iFG0oUJ2rP+NGouepqm0xXekK3Rg0A5Nm5YqgJ+VC89+8=
X-Received: by 2002:a05:6902:2206:b0:e7d:585e:8d2e with SMTP id
 3f1490d57ef6-e7d919e6771mr9152597276.29.1748253545002; Mon, 26 May 2025
 02:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 May 2025 05:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 May 2025 05:59:03 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Mon, 26 May 2025 05:59:03 -0400
X-Gm-Features: AX0GCFthZfks8QA8KnfGHvfP_2Y2hwfXyqhTrnXPwSVcO8ZIKUa3W4g8T0SOUxQ
Message-ID: <CACo-S-3U1=Q61L1TGb-KtG=cu2LNkWJC-9rBT_aNQNJQ8j=trw@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmFNPQ0tfQ09SRURVTVA=?=
	=?UTF-8?B?4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtLi4u?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 =E2=80=98SOCK_COREDUMP=E2=80=99 undeclared (first use in this function); d=
id you mean
=E2=80=98SOCK_RDM=E2=80=99? in net/unix/af_unix.o (net/unix/af_unix.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:1ec0ababeee988e6d6392eedfbe6a=
035ed2dfd6d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  3be1a7a31fbda82f3604b6c31e4f390110de1b46


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
net/unix/af_unix.c:1158:21: error: =E2=80=98SOCK_COREDUMP=E2=80=99 undeclar=
ed (first
use in this function); did you mean =E2=80=98SOCK_RDM=E2=80=99?
 1158 |         if (flags & SOCK_COREDUMP) {
      |                     ^~~~~~~~~~~~~
      |                     SOCK_RDM
net/unix/af_unix.c:1158:21: note: each undeclared identifier is
reported only once for each function it appears in

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## 32r2el_defconfig on (mips):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68342eeefb37369f44a86dc3


#kernelci issue maestro:1ec0ababeee988e6d6392eedfbe6a035ed2dfd6d

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

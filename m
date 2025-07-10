Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC102D4B41
	for <regressions@lists.linux.dev>; Thu, 10 Jul 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752141548; cv=none; b=ozlFvB5xJOIViGtlxeGqymSVTRpwoXzvCQElCj7VaLu47koBpsRYAnzaouj+mnRCKgU07Lzvp9M+cmyp3wXvzKcRfmFKyGCwUnxlIpeiUKj/MOTEe1jp9cNHt/CCvSSyeNJUv6a5BXQDO7SrDYaUbQEWVQuoMIycBTc+I5U9qpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752141548; c=relaxed/simple;
	bh=6yv5CFJYg6pTTof2JcjC8om6Vi1/YsgX1I/zy2a1V3o=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=WFGP5C0H70HGzIXnBQp4qirCoP4fhxRuMOdG5qNYbHgzv/X3Thv9P3xtSdDytx0uJFb6O9TPJrimocIBpazXwjzyFWw+C0PVq3uCxPLf4en3aKOhhYsckRORTJs/1AV/oadQy0M6IkL8om3Fs0iWf+GXzg0Osl4rzFnw0iY5w/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kUzK9iDt; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kUzK9iDt"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso675073276.2
        for <regressions@lists.linux.dev>; Thu, 10 Jul 2025 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1752141545; x=1752746345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tfPYL34FapnC4GPOI5oKk+QzBPVtKMCrzZZzT6Z9TGs=;
        b=kUzK9iDttWoDOwHLnTkjHBe+DWsIq9ygQSICSviswS59Rk0QK17yoocH7UGkuxWywe
         zbRt3nY1jv6oDc7EQRgvilhSDEKtBeLt6GuXxeFw0s8XUwry1zpzZ3odi6T1pRW5dJPF
         7N+Hvbq7lzPYO1npwFdk6+OYYGp+k/oaIjMS69bPKEhSPTPK6ly/3s8keGxrcuE/BVqz
         jueHRhSB/Zcs2rmYUAijIK9wKdMnx0a4SFacW8X+ogqMnrv4Ce122ao8skPU9f1PYBBl
         PRJHeI8UxckGNIutd+gsT2XHrTywvJJoUBXOt0bRqJT7XDvEOFTt/OyPq8mbQ7TKbAEp
         dRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752141545; x=1752746345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfPYL34FapnC4GPOI5oKk+QzBPVtKMCrzZZzT6Z9TGs=;
        b=PLziJMpbIkT+k7CdSAl+Wv9nhSsiQbDCEcWmMWb+538ULVe423kPmGZyN00Wh+1ERL
         sm1u5BcltcXbRWBSgcHcjhkYzU5PDp+DC/+6IQTyFV14bzyRSh9skJtTZdYTbjw/OUCd
         qcc4zwgTFuxn60aRaY2eO0Xgl33z8DjFcCVo/4Hjggg9WxhX3VclOSyDYmQtIjyJIFHY
         S7k+AO49SLmp7wdyFrHTmqD+ZUs2KL2GMjSBK7O8N4ZcYU24LSe/whDOeUxTqMMv3D/W
         keCP0Iv3PzF0yycGwhDnblILqZzW6+oZzENCdvI83E9Ua9MJ7/G89fFMuLAJcuNKZ4+E
         NMgA==
X-Gm-Message-State: AOJu0YxkxJKkcUob6iXfrQkIVjs+vLdqRi0PQmwMZSEBrwv36iPY+vSv
	1rXLXtIt/TTsUwcx92vLr+mhurcFgwf8dwFOQQYPRyboX9u5xQ6NdXoy6BExQZE+lAN4ETxA8TG
	dCiOdFHsx496PY/iqe8K0+ynuAPPAdakhq9rWAZaG6g==
X-Gm-Gg: ASbGncsKZP2YWwWFAzExOJEeVS1Bu5ZSDj4NczNm4AEEHrX0xEbW6O5DQs3DwhT/joq
	nDV7aMBlk3RF6h99QX5tacAR6+GRG45EAA5dv3O8z9FRQdQ7oN7ijL7mQpGD0R7CrW64jrag6+v
	l7hAkxVUla5WlBwOudedYwuq6THqlOUQ/vDSKlSreSqg==
X-Google-Smtp-Source: AGHT+IEvnVOnHYxR6L/U9hATW8VlP/nRreoqxAWBxTJdckQ8TG2I2oMFRHXWKaTXYa0HCcEiTEz1z7+6bQnQfU+whgM=
X-Received: by 2002:a05:6902:1b8f:b0:e87:9bb7:beac with SMTP id
 3f1490d57ef6-e8b7a32b090mr2099503276.15.1752141545488; Thu, 10 Jul 2025
 02:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Jul 2025 02:59:03 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Jul 2025 02:59:03 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Thu, 10 Jul 2025 02:59:03 -0700
X-Gm-Features: Ac12FXwKSGRsI8--21ZXA6ao9GKzE5Y-Pb9yoM_YMb3xR8GzxcScAmYZhY7fekQ
Message-ID: <CACo-S-0z4uY0xuN_fxBkFy2HtH19LtPWD8FkWEFsCVpMGPHGjA@mail.gmail.com>
Subject: =?UTF-8?Q?=5BREGRESSION=5D_next=2Fmaster=3A_=28build=29_ignoring_return_va?=
	=?UTF-8?Q?lue_of_=E2=80=98u64=5Freplace=5Fbits=E2=80=99_declared_with_attribut=2E=2E=2E?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 ignoring return value of =E2=80=98u64_replace_bits=E2=80=99 declared with =
attribute
=E2=80=98warn_unused_result=E2=80=99 [-Werror=3Dunused-result] in
arch/arm64/kvm/sys_regs.o (arch/arm64/kvm/sys_regs.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:a2914456a7f9a96dd6b9a22a0784d=
af92bd464f3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  b551c4e2a98a177a06148cf16505643cd2108386
- tags: next-20250710


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
arch/arm64/kvm/sys_regs.c:2654:17: error: ignoring return value of
=E2=80=98u64_replace_bits=E2=80=99 declared with attribute =E2=80=98warn_un=
used_result=E2=80=99
[-Werror=3Dunused-result]
 2654 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC      fs/nfs/nfstrace.o
  CC      fs/nfs/export.o
  CC      fs/lockd/svc4proc.o
  CC      drivers/soc/qcom/ubwc_config.o
  CC      lib/bsearch.o
  CC      kernel/bpf/token.o
  CC      net/netfilter/xt_CLASSIFY.o
  CC      lib/find_bit.o
  CC      lib/llist.o
  CC      kernel/trace/trace_functions.o
  CC      net/ethtool/pause.o
  CC      mm/mmu_notifier.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:686f7f5234612746bbbdc9f7

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:686f7f5434612746bbbdc9fa


#kernelci issue maestro:a2914456a7f9a96dd6b9a22a0784daf92bd464f3

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

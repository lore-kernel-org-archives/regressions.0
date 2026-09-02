Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF114AA1EC
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366896; cv=pass; b=U09aYyw7WDXYcOezHGHBFrUAhzj5NXgQe7BOUB36xILIxxAmzX4+Bq5D/kYf7KASw6DTHGhw1XAaRllOT4J4rdltLjSUrhXZaYminK5P4rqf0etAP2IMsMRTSo/S3rAW8g5QiFHGUwANzaLVkorpszCIfwP2RuxW0JQm+wN2wlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366896; c=relaxed/simple;
	bh=BfEmlkBKcWe2ccNduTBti/ySDv9Dy75blbe5/+Ct4XU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qJbMRAJVASvU47BwcBGSDUBRhYIggqeu2o/TGPldVwgfGUPzRMh33iroxucVL38YsgW/yIiUY/CHDjMg/kkJ86B6MjLTQtWWSEqdRj9ia1hspyEgF7bJmii6/IQ3UEYWFLCB2wXde/9gu0EYUGUuHQCcMp2vrC+rQOlP4OMbHlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr/DCbBk; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr/DCbBk"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b12d146e6fso573324eaf.0
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 09:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788366893; cv=none;
        d=google.com; s=arc-20260327;
        b=kUujcvSpSrFSDC9XvnZRe6w6TFuGxeLxm+W78k8BTaK4rUw/g0klT5FNf/3VDUXICT
         vs4JFHVtIvafhAa4wdfKhURdNuaRwFyZX7++h1PchZVG9x3V2InE8CGwubOj7HwY9XDQ
         +D5psel19Vk65dv8+a1rneY7Cn1oByreyTUYxe8KbCpH7a5q9VlOXYHEeuLzxQO1be4S
         J4q0kd7X8XnS/KEqUq2JQurVfef7rGWOWPfxyw1OzNzhKlG8zNjDH1niG8gJjil4d/N8
         syeFJTQ/ntcIMUx2a7SBbBQaio2/1slG6Cn997KfN/vpo3AbaIL4w96VRviEZHXxdEQP
         zGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=US9Ylb+9AiTeXprRTRZTmUqpRaQkuKyTcR67E8oUP7U=;
        fh=WuCYOWC6MiUofc9uJ7/efWsVMYWeJHAOcYeVp4iYz6I=;
        b=DdPgR1DYxIXHKAbE2lW0SrbMwMmHjDPfueKXK0WLkQD5o/v3iF9hRepV02gHdB69UP
         91IRjVQeVqsNguQJjhnGwcSxyPKEUGPjAb/Fweb4+QuNcfZLG7XDe/uicLqQ5mnToD/F
         /DQ1huliaWtM932FGxenWHqWuQ/3CLLKyyEAiP1RHHux+fcaPELojSt36rDtxAP4mHoD
         L3sevM/fw0C2ZV5ZVkU5epsCosSpClqY/Z+RMDDbvTdv1d+1ot0xPphkS+t+qEwpPtMO
         aLfKkQARa035/69TkG4Gb/zQEuB1dp916l5r5/O/rZ9s4H+TGqZzj4zQVUfYx67JwPpu
         3nKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788366893; x=1788971693; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=US9Ylb+9AiTeXprRTRZTmUqpRaQkuKyTcR67E8oUP7U=;
        b=Qr/DCbBkomttn0daNGvyyvVZUjggOPGM3TtDtxy2HzdB/Ro8y19md6wiEd4nbEQpsg
         XtyxYpvqAMdL6W7aJJi9DSclEeWbOeZXzhEGInRh927q7WYWeFiv252hjySYAEcRd46i
         2QeMdYtXwbJkbcsX67GXyf2iOBAnyEzHEXeFOazt5VodZGWQtN38exG36i1tIDpdsMG2
         Sd+b2tzTKvGeDR0q0MvD6CxC/f9WJ0EI5sjUUDT1cgxfwGHW04EENpZHbl0gDS8aTHSe
         7ali/9Llw/95QDR3qSu/h6ky3vKtjHeJgmpyAbAUbW7B8DtYE4M6lMiiIq+WwiJNaWES
         q+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366893; x=1788971693;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=US9Ylb+9AiTeXprRTRZTmUqpRaQkuKyTcR67E8oUP7U=;
        b=CuWCsUNpKf94n33nmHqED9bvcxkxDabYnrm+GdrUchlFCXI8NDnTwTIqnH2BAdHzFl
         aHZ19nqZZUfjaWwscO5A8bAVI3sV7nrPDP09kBJUP3p6D8x7g7Q/DDb+4TDqTLIfnJCV
         ZQdcOb0YUVhpiD6sgzzMdVljwEwjDyRv0R8HSjbHsrO5fUeyaWCd2eyP0msdeBsYlUtz
         ZCHeZiSus8eFPt/eSbNuqVnhxu1EQifkWZaHCw/yXSSIhEXxbEzTW0FGfjJTFMx/Hwpv
         DLufQCrTTvWK5y1v4R4b/vam+fpgXfnMLsNRiA8RoNj7VOJ4W57pbWMNx8BCtw9jfe/i
         b3tQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjzJAB/cwtS0anJfXKYxKmno7QWvS3s8O9UDVM/yb3qRHMevtqO/P6iEu59lScfb2dcCNsalrpVkMrKg==@lists.linux.dev
X-Gm-Message-State: AFuF++k2MXW07rUJ39C1oAbZwiiRHPOu3TeLq7WW0UZdUvEweQfcnNP0
	kUM98Z5TftlewCAwJpDMT08APh/YCyYBMyYwnLIOzIOmehCNi404+LOX/Sdp4uqeVUJX41SEMvg
	BAAoTQt5MScMJLZ1zltednSIx4hpPjcc=
X-Gm-Gg: AR+sD1013HrfpjjqZ4BPT/Ngd3uqt4sgtNtkPhmvGyLSdj52kzsiulY7QZeVGt4xxKB
	oyGUqvAOgkUL0aCvQU94iZ4tFVNJPm5KsbEBofCZYskJi49yHmZ5lFyxKDMEQ9JaG7cjh3kEnNx
	ANVGxNrtFbQZuYiTUpRNuE8Xwpw3P6pX++ku5BRa5zJ0DgFDTw7hdKXk6DyaSzwSRNOzS5pVwwG
	4yEsF6fBDbNdOU0agLS6EUglft8PSJ53DJbTfdGB6K+sFQ+BauvphbFyOFPafbPtLYe8FgS9kw0
	IwdsgOfL5JUWQ/gturJy8rZLD4yRkPtB7yrQ0D0gx9OLC80DVT/ubsjeUbNnKmWAgjfUo8S/a7J
	Ck+S9byZX6Mo1wa4UqwepuiaGIP0z2guZ1rnMhwUshzYfd1oIYHKyZqTGvP0/MVJj8loJ9K3Y7z
	F4aI26YpOgID9GTFSAjEo/cWwHF5aYuVdj9yAHJkla
X-Received: by 2002:a05:6820:16a9:b0:6b1:445d:aaf9 with SMTP id
 006d021491bc7-6b47d4cd775mr4034068eaf.8.1788366893040; Wed, 02 Sep 2026
 09:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Andrew Wilson <wizlonex@gmail.com>
Date: Wed, 2 Sep 2026 12:34:41 -0400
X-Gm-Features: AcwNN1WhXm-Lt1F0X-OQuMqxjgk1a3bMvVoyZLhgjbgALurTS0LPjsCCof-Lok4
Message-ID: <CALAyJWrn7OQyQMd5OPoifn_3qe6iWNf1+xSSg_six-+po9kpvQ@mail.gmail.com>
Subject: [REGRESSION] [6.12.y] crypto: ccp - Move SEV/SNP Platform
 initialization to KVM breaks SEV-ES VM launch
To: ashish.kalra@amd.com, seanjc@google.com, aik@amd.com, 
	herbert@gondor.apana.org.au
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	thomas.lendacky@amd.com, john.allen@amd.com, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	1145026@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab

Hi all,

I am writing to report a regression affecting AMD SEV-ES VM launches
on the 6.12 stable branch (first noticed in 6.12.97+ / 6.12.101).

I completed a git bisect between working and failing kernels, which pointed to:

Commit: bb1c84647025 ("crypto: ccp - Move SEV/SNP Platform
initialization to KVM")
Upstream commit: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab

### Bisect & Verification Details:
* Last Known Working: 8a599f4f74d4
* First Broken Commit: bb1c84647025
* Tested on 6.12.101: Cleanly reverting bb1c84647025 immediately
resolves the issue and allows SEV-ES guests to boot normally.

### Failure Description:
With commit bb1c84647025 applied, `sev_platform_init(&args)` is
removed from `sev_pci_init()`, assuming KVM handles on-demand
initialization.

On bare metal, the PSP firmware appears to remain uninitialized (does
not reach SEV_STATE_INIT at probe time). When QEMU initializes KVM and
queries host SEV-ES capabilities, the ioctl fails with -EPERM:

  qemu-system-x86_64: -accel kvm: sev_common_kvm_init: guest policy
requires SEV-ES, but host SEV-ES support unavailable
  qemu-system-x86_64: -accel kvm: failed to initialize kvm: Operation
not permitted

### Hardware & Environment:
* Tested on: AMD EPYC (Rome / Milan) Supermicro platforms
* Kernel: Linux 6.12.101
* Hypervisor: QEMU / KVM

I have access to Naples, Rome, and Milan test hardware and am happy to
test any patches, provide dmesg traces, or assist with debugging.  I
am not a tech-expert of any kind, but I have time to do some testing
if it helps.  THANK YOU for the great work.

Original Debian bug reference:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1145026

Thanks,
Andrew Wilson

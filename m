Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D01CB501
	for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 16:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741798500; cv=none; b=ht1ARZK6LaHuyOMTkCEdrxHE5grMUxwAiF4SFnMq/mIoxRyqltKVjBRyMo8yvfXcHDzpWW6PTumkkbzXs2WiUQ1ivPKQmDHe5AyXz4Xm5DoXaylNtUHkBeJYTA0mTJua4cUFbFmFdGCBwHIEuyylym+fGg3tb6NKYqJ0WiwZFg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741798500; c=relaxed/simple;
	bh=5TgQO+3LhCPStiRftKuCeSMM0jsTL9GCvwhEUjsE6NU=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=iWD8yJeQug4eGxBc39gk/LKL/mFUv0oCOvU5xGeSpJ1Zj3sAn+sUNAuwWQGWnycvEt71JVNov6PF71tsMrnEPM35/hoBg20TG9glm9WWyk9HBTS2v6uIdKpzRdz9pwnEnBjrjkvOTeQVlJkuR8I3TmhUU3tbgn+jHlGW/eBBg6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=VLQmpqr2; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="VLQmpqr2"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ff27ad48beso283197b3.0
        for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741798496; x=1742403296; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMBBc+6+9G9QbKxXYkXtgJAMTovACbjDKWoaPz6/u14=;
        b=VLQmpqr2s8pANe15Z3+Ugxp+myMU9aEbHCI+8d53XQRWYLzbpUKmeye6jKtElIkXF6
         ee+QXgFPmjoPqa4uCNxxuaWYxZXL/1gYcL0brlwpzh2p2iJ3jCzOgKrYlNzSdae77vxI
         qex4VpRrSFHBpIAI+qipZyGE96R4bGXHwkX4Pl1cuiWpzcPaVF+BB4Za0ilzRWK8r6zT
         2akdZoDG+Dz51N5IML6O4QJn2u0w1g/1CrG3snww+9SfjkoSToN6ofXuxMsB6QQ/L3bn
         ls2ZeGIN6Jal+IeopyRc9YF9XMOdQQ5cidNWNs505vwzFh1sWvUyjouBzPZSRP+CSg2f
         Qfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798496; x=1742403296;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMBBc+6+9G9QbKxXYkXtgJAMTovACbjDKWoaPz6/u14=;
        b=tQk2OS3UjNv5ZYOIBytZClc2Z2gsFYIviFGLfWF3IJtRnqldBs1Lxj+f3jcv5TjuEI
         R1PNSTXICYWktA+qdxbZIddIG9wWvuhoj2Ny0DMHMH57TSZcFQ3OA1sQoq3ynTJ+j5dX
         0zFnJiQbw2NvdvbCGRistSh2nuj6Ls5/y6W8Xn+gipiTyez+xZ6CQXJ81ii2SRw52RlP
         t9t85g785bR93rHfzIR3ATixQvox+kE5c1iNQigWC1s7QXd5ovcoR4B4JWc4FY74AEpU
         uqsD+p0/pfjHKjXVzQOa67Zann06kXJ5iN79qFB/07Mxro4AoXLwe5m8nX5QjsSgqlBh
         sTLg==
X-Gm-Message-State: AOJu0YyE1A0NGwSHyNk7ZHpiX3Lc9HLAVNCkQfMVPOh7E1FGEv2XrTtW
	2TzmsPNWLFMc3/zstXejM0Z0ex6urB5Q9YMYrOaXfL6C+afLPodX2Dn/hadN7yBIrBE3b4s+TIv
	HBpMKAA1nQ0xpQ+j6vgtVl1xmBFI1OsklkUb8Wg==
X-Gm-Gg: ASbGnctE8AUktUxkoFMuOEORxX7q/CcjxD6VHwR+/LnVQYN2VK/72oHrig+1Z2ksyAo
	fO0UbatL6ZmjGzAjaExMcKp9Bo1MfQxNcviy1uwylezMK9Za5djfsTDlvhdF+7ErebCNK3dVLqy
	8zFHHIxCLRL29I5OEZaqbyxpRvwHto5TA+d+pt6cdYwl0D4WIj9gUO/6EimG/TOMzpZMoDMw==
X-Google-Smtp-Source: AGHT+IG7KBHRks4sommtjpjhRSzxWjLu2kfe2NfQ8JApH+5NrA+Y/64NAFh4hUaJLhJsd961bMZRDMJUwYam1o/CfJM=
X-Received: by 2002:a05:690c:4444:b0:6fb:9b19:ab49 with SMTP id
 00721157ae682-6febf2a3035mr344189977b3.6.1741798496115; Wed, 12 Mar 2025
 09:54:56 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Mar 2025 09:54:54 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Mar 2025 09:54:54 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 12 Mar 2025 09:54:54 -0700
X-Gm-Features: AQ5f1JqjKJoihmnmL9P_Ja3Wvmd8WUSSHXNJ2swrfvYsdAZYP20TjEM1cvYvr_U
Message-ID: <CACo-S-03ZttcNmDhiGYwB7-i6H_mtD6pQV=j9G8072=Qy-cmrg@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) incomplete definition of type
 'struct module' in kernel/trace/trac...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 incomplete definition of type 'struct module' in kernel/trace/trace.o
(kernel/trace/trace.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:02c3c2919e762c554f882ad73da15fba6cee97f9
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  9fbcd7b32bf7c0a5bda0f22c25df29d00a872017


Log excerpt:
=====================================================
kernel/trace/trace.c:6041:38: error: incomplete definition of type
'struct module'
 6041 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
      |                                          ~~~^
./include/linux/printk.h:400:8: note: forward declaration of 'struct module'
  400 | struct module;
      |        ^
kernel/trace/trace.c:6041:44: error: use of undeclared identifier 'MOD_TEXT'
 6041 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
      |                                                   ^
kernel/trace/trace.c:6042:30: error: incomplete definition of type
'struct module'
 6042 |         strscpy(entry->mod_name, mod->name);
      |                                  ~~~^
./include/linux/string.h:114:55: note: expanded from macro 'strscpy'
  114 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst,
src, __VA_ARGS__)
      |                                                              ^~~
./include/linux/string.h:80:21: note: expanded from macro '__strscpy0'
   80 |         sized_strscpy(dst, src, sizeof(dst) +
__must_be_array(dst) +    \
      |                            ^~~
./include/linux/printk.h:400:8: note: forward declaration of 'struct module'
  400 | struct module;
      |        ^
  CC      drivers/video/fbdev/core/fb_defio.o
3 errors generated.

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67d19737f59fb9874e7ca220


#kernelci issue maestro:02c3c2919e762c554f882ad73da15fba6cee97f9

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

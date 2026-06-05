Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D147DD49
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646347; cv=none; b=KLbmTVoRUB9HXgGpTrNs5v/cNcUMoXRP0Ixq0Yw1mEmIe98sASUo9LMBRj1mo+kC1xTph6citJtMulWyHwsxkURW1QyfAT5JVGH7C2jK4vxFA14/nb8s7QJl6Jf87DUdMPJw8ScxBcThdxSObt9t6FA9Sa2x+/dPsBzegHEKN7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646347; c=relaxed/simple;
	bh=hgrXIPtaeHHcY7Y4kFJQrL1nMdES1pUBYV07LUJWRwE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PBAa2PghRp2jWLY2Vm9+jJ0by/OS6n/h4o2hijyOah+kPPw9Ypj4r5PvB4WQh7kNQEMZF/GM8gkOdq3Rsgk+aYomE4x21Qca6TGuLCVP9UuLPD8QhtGHPX8ajk1q20z+BxM2C+F04gumreH2zErxAIUY/qkt3/jNpgvHEs9mkxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=OnoOsblF; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="OnoOsblF"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd4cc208so957145c88.1
        for <regressions@lists.linux.dev>; Fri, 05 Jun 2026 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780646345; x=1781251145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3HTVnzZRILmr7gUdAzd3rNmb8pAAUJfjjumtj19PXA=;
        b=OnoOsblFIJUkspLxHUxeWco4Y0m8r2SDLWaLLkJN+JdXiQw+A0FD89ucrh/hMy/TjX
         iY19EQYmIQOjNXBzKvWm1JcedVIGf+Pcgyoq0rYKtduAH6wGmY4EpmSb0Blk42gy67Xz
         wDrA9JWf4Vl+tAD8TvXaodkw9nnfbTbDsGAeGr3GnVSHpQdG4qtRKLhJ+oGIAlRo2y1Q
         yLzwuscSjrXQKD4jik24+BYCeHbqc5SA6arLFZ2DOOy+m8wvKLiqnEva8ZwYIG71onTi
         pT+FfVx+ueXjwTJe04gBBKLGDP2RLCgi1Mf7AwtGiLCtFzlcgV7MRdWCRkhaYJjydLPJ
         gYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646345; x=1781251145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3HTVnzZRILmr7gUdAzd3rNmb8pAAUJfjjumtj19PXA=;
        b=pa6wquwTxMzh4aiSsuctVc5iFgj0DH+7S2ktetU96bhD3C36s7AjN/V9HCwA7XHx7S
         4FdOCKU85v/6k8adTec5XUEh+Q1wpKod0Ts9LgjB4EfEkLaulELc455zSGU5gH9pr33H
         ZagGPg7wT6G85exV1yNobf36KGnyozmhEkArf6LpS0CMEajIxDfUAsdigmi/rIUwvxqi
         1N892rgmNUx5mwHb+PO2vhfJwgp3jZZcOBlkrqzSMJmBx3ZNoh1QlfkmWmJyOlpC9BQX
         h/u1fVn3CYuzDHRehu0rnKbr9h01iaVZeWNTxsQ+kac8hZIZeAwaprxu/wZMG5DPawiU
         z0KQ==
X-Gm-Message-State: AOJu0YwvsJ957/XSG9DL3yRPLHQXgCGzsGI4KjIs7AlnSXQ5NJ04G8/7
	exWfmbRPMwKlbqZ6juz1xO2p6L436XLT8Jv8soym4xkLbo6kvSE2z8YP3zG+1ehi+ts=
X-Gm-Gg: Acq92OEXMLhI51r5jpbYFCuGkAsvLAZJNvVBMjWicSvW0RQZXK9t5v0zn9KBW660wJf
	UM9i3YqiOT29/ToM/WPEJ0czfQRgSPdBf4d26k8BmgPL0hiesU+laX2vgrAbTT640zlQR+hPghN
	0ovbJ9RluBgUaT8YwH3xBx7VrWqprzWgzEH2qu7lWSNHdnmBSAO8F4CxNULBK5wDHpWSl/6wRju
	3yzV8YHAM5/E517iwQkoCBEpMd0T6qGSq0FH+luuUUICaXj3sZcqYVD+s2xLgAgqwVGX2Rnv6bH
	J82oMsZdIMdHycWkO4c/YreQfzbnYtMFsXf/qRCNnUg/P3pPkuI+tsQQg+X5N8sAVbVY0tCBJ8L
	0+S+mzaD+TnBDze93j76KOVmk20stHYzZceRKWYoYX7OsitmjxUWv+v7QjkCHj5+IjS+LcjaOBv
	CPK1SepnpglGZVFPAfiEZCwuWMf5k=
X-Received: by 2002:a05:7022:439a:b0:12d:c4b7:5625 with SMTP id a92af1059eb24-13807d373f0mr489367c88.9.1780646345202;
        Fri, 05 Jun 2026 00:59:05 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54caef7sm5612687c88.7.2026.06.05.00.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)
 /tmp/kci/linux/include/linux/signal.h:160:1: error: array index 2 ...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 05 Jun 2026 07:59:04 -0000
Message-ID: <178064634422.10527.17222119579360972690@330cfa3079ca>





Hello,

New build issue found on mainline/master:

---
 /tmp/kci/linux/include/linux/signal.h:160:1: error: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds] in lib/maple_tree.o (lib/maple_tree.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:98c2d110d805d1a864a89edd1e2c447175476af8
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  ddd664bbff63e09e7a7f9acae9c43605d4cf185f


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from /tmp/kci/linux/lib/maple_tree.c:65:
In file included from /tmp/kci/linux/include/trace/events/maple_tree.h:123:
In file included from /tmp/kci/linux/include/trace/define_trace.h:132:
In file included from /tmp/kci/linux/include/trace/trace_events.h:21:
In file included from /tmp/kci/linux/include/linux/trace_events.h:6:
In file included from /tmp/kci/linux/include/linux/ring_buffer.h:5:
In file included from /tmp/kci/linux/include/linux/mm.h:36:
In file included from /tmp/kci/linux/include/linux/rcuwait.h:6:
In file included from /tmp/kci/linux/include/linux/sched/signal.h:6:
/tmp/kci/linux/include/linux/signal.h:160:1: error: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds]
  160 | _SIG_SET_BINOP(sigandsets, _sig_and)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
  141 |                 r->sig[2] = op(a2, b2);                                 \
      |                 ^      ~
/tmp/kci/linux/arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
   17 |         unsigned long sig[_NSIG_WORDS];
      |         ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
20 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a2202cf2cc72b6e94c25e88


#kernelci issue maestro:98c2d110d805d1a864a89edd1e2c447175476af8

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

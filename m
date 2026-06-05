Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586B311C01
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780689546; cv=none; b=DreIR7Dok4AfEuy8LQjnsWE+sHj14lkBFXGSQUn1xb6Gxvfy9QnF0AGefOUqTQtKuI9HFozYeKoBrz81fJ/4GR2t1L+xD2klis/fBW9eiRE+8t9qu+FJnVoSYzuh+nmE0MAtJB/s2R/5JyS+ZOBrjS8DoOXSJfjPtfXnh1Gha8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780689546; c=relaxed/simple;
	bh=zYCZvWPstpawXr6luvpAa7IF6fUnkvjOGp0n2P4ScVI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=N7RU6BijZDGMSdyIZD88KXqluxIGmVY6j0n/jBae17sPcUVOpTilWu4j31OYdKiB+it8v2Zq9TaFh4SenzkkDz02JH4Cwfcl/m6GulAgEDPppuhUt+2hBsJQeA2jDusAjObPWHvhNT/JDIK1fTRBbqnqa+yFNpZ/bEtHTyvMJNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=g8kMg7/8; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="g8kMg7/8"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-307631dbfedso4996169eec.0
        for <regressions@lists.linux.dev>; Fri, 05 Jun 2026 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780689544; x=1781294344; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7wxz/CnfJgBs9ffBwNvxhYN5w5bNne9cmNiLyXgSmo=;
        b=g8kMg7/8dO6UoBPxg1aVI55Y2+5bwBmrcIvC07kjUp/ndJlqg6iTeTE/iNbiiswHzt
         EvxCqllkkxxPI+YIT92x/1cSgISVCLPF6umeFB30q9kUjAFQP8dVDpK4Snzd3N4do8RH
         mYpw39AaznMrG059qd/lcPLh4wfgbyg2YyNUXbSAbPLbV0QarNDqge9U8GMHBz2QxqMg
         vyktsWno2eQVZqXpyx7i7XNn2XMahOXvVry4fGd7nwz574h/ZPnycL2nnuj5iP+EziDR
         mHwEY3fdfdf51H78eyRdpMp45Ltry2w8T3FnniPA3QH9pgYZgC0Uk0WvfuZ5/qs0PtjZ
         C2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780689544; x=1781294344;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7wxz/CnfJgBs9ffBwNvxhYN5w5bNne9cmNiLyXgSmo=;
        b=ViqvYbMXKUbGYq9KyZ0Im7dWSxBb+BjPwi6B4dQSQVaU2HlGSH81TBdrDwrM3RN753
         U4ufb4QqKhFbO8dvpAv1p+MgHYXUzniFtadxi9iyIYAoYfLECCo2Ng78N1vwGIkFSRSh
         AO33kfT3C8LZq4cUoKjg+UbD5H0Jxy0SuV6B3N/OUBXy3ISz37K0vrMc7CXkYKkZ/0Md
         ybTIil5AOvbVLPL23LCzMliUFwiguixnnjfK2zPiNv9quO3+0NB9b047zUBh3cL6Bp43
         oClacwwTVldC+k5FFWQz+Grz1yqLka6pFHDKJ+M7sI0fHQLpi9paSBmS2STOCW/b0+L7
         7wfg==
X-Gm-Message-State: AOJu0Yx9GDQPgQJYmfmtXo7ru2cDEjj12wkyt+BXKX1GeKHd64UhJtGN
	HS0aMUIgMlQSllCExMtJwitF/4HXthUBj6TJHJjWDS4XFcAtt8kio6VA75odRuOPD9TVL0wYoVf
	FJn1r
X-Gm-Gg: Acq92OFCHlXpkXkCmTX+ufHcKaWEml7dQnkCcnOrUv6CBPyghqTBmcrFkVqWk7O4P7f
	n2HuXntugtJcvsa7vGKb/bSBYbmVfmGF4aOC+MlZvUCuZajfhjhieLA/c1OHi/uzHCL+h+vROiS
	5z7TngPy1OmUiC+TrTWCck3rSTIyDTb/ufGH4EmQNNevd86SosSqdD5rnciUbcaAF5lTchD99l8
	zl9zVZInY0Bm+q2pjC2rpUL5d93Wo6x9XvCZh6Ho8ptIgsaC+EZGS5i1HAg4wRe72DCWY79yGz6
	JfvDnUqhLMaugtkQDdMjpK+zZVa98vzVH+2WlOd9HEz6X+Dy3Ev7rHHkLCOv1W5qvUYx9QKL/hz
	IaXwaDqVe8M2JAwopdCnNvVVQK1JvR8HdF80awtghSGuZGjcIZHdjnnLsv7k7HCI3LeJfLLuDNR
	4lRqaDvhcAb5VrKEuvXrVi7sAjH7M=
X-Received: by 2002:a05:7300:2311:b0:306:f474:7389 with SMTP id 5a478bee46e88-3077b721426mr2340132eec.25.1780689544146;
        Fri, 05 Jun 2026 12:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm11118007eec.8.2026.06.05.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:59:03 -0700 (PDT)
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
Date: Fri, 05 Jun 2026 19:59:03 -0000
Message-ID: <178068954331.10756.11128222654546054863@330cfa3079ca>





Hello,

New build issue found on mainline/master:

---
 /tmp/kci/linux/include/linux/signal.h:160:1: error: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds] in arch/arm/mach-omap2/powerdomain.o (arch/arm/mach-omap2/powerdomain.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:cf5bfe3915050650650fc6d8d002384f83a324d0
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  a8dc5f60d127f1d147a8e778563fcef7715d1316


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from /tmp/kci/linux/arch/arm/mach-omap2/powerdomain.c:21:
In file included from /tmp/kci/linux/include/trace/events/power.h:12:
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
- dashboard: https://d.kernelci.org/build/maestro:6a23104d46e71b76f9f70fa8


#kernelci issue maestro:cf5bfe3915050650650fc6d8d002384f83a324d0

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

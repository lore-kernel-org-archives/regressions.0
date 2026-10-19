Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443547;
	b=5eaI2smQI2TE8fpjI4KMBLMpuCW5X8aYRnLFsEuA0vCziHwzHL84cJMMkRhifw/AIfbJ
	 4k0Q7PEarncPyH/SP9e7rm+gXpEyAd/XfKd34oGZgA/fQIpXAC3H4zXwyijtGR439ooiO
	 fYbjnyL5aIiy0zwPeePIRlnzgWViaoGuM9c7SO0xUgj+tDs4Clg1zd9++i03xCB9H9l4r
	 wjUblorWy4+Qw7sjnmi9erTAvfxrIcpj0XR+1QH66DdKdunKexJDgVyeUKuCTjeW6flCR
	 XTvciLSYP6kv13qr/5kahOk3N0+4xs1C2n+HbzebSotbjC0Vl11aCwN76z+Sp06eWAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=4XC9SOZ+ZQ1HP8QJQGfsvFDUvx8dUngKoOyiNghiC8g=;
	b=iWKSuO7ZpKx3zVPb1VEszjdosnGNp2eJSAfyWKbLqb8RmAgrijQjmW8OZ5y+09OO+oN/
	 SNYbH+gCnR1ttbY6HHWcThXEkExXYFRaoB819n9gZYbUmuvuALaMrxPxwll6XCXHdca/T
	 2rXKIivSXX/NBrCmmkeIlAIJb1nXIkCKifJ9x1UgqtUv33EqdaZD4AvBAzSrDedL+GBCC
	 TqEplUW+jkTTYHXrz7JIOFTPNrJrUwyS3ubsWLCfSPN+UeC30IXD9ITFY8mWtsn8XfsRM
	 qYJK+Q1iN1l3aMrb+IZCDv7R1JctmxnyIOKOBimSbbH5UBeUT8iSLgxVzH/P7X1HkZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=dcBqDn5A;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552C606A31A
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 20:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D552C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=dcBqDn5A
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4655332eec.1
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792443546; x=1793048346; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4XC9SOZ+ZQ1HP8QJQGfsvFDUvx8dUngKoOyiNghiC8g=;
        b=dcBqDn5AhyQY92vcOu9EG3ZNHVabUW80a/P/br30z0vH+LWo8p4hsoePqxVvnbqet6
         DcAdy/+HV0WTBlDAcS2bxKPzMQmvN+Bxgn0uu+65n1aTDeFgHSoolud+riaKErwhIO42
         izObcS/TiYFEQONIYyEWTde1e8mGJXuwftCrvvGPZWhWCs/eZ+YRwQhKQPD+EN/2Tvq8
         Kk/aR4E0KfjRylKdeIFKyauwpby+Ug6A2ys7duTShQkK5uE7mRwBC+EPNuHTDTo+N3Gs
         cQPT5dqXN+7H8duHzteYZpeHcxGKSBGNFBNApqBKhvxwEx6na/8mGtHy+dLQbjEGUuvc
         Fa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443546; x=1793048346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XC9SOZ+ZQ1HP8QJQGfsvFDUvx8dUngKoOyiNghiC8g=;
        b=X1mx2j8y043k17iVTQosTZdFVIPRvzraSpfegdYC0aYWinR8COsj3wJkRmm3OgrptS
         5OWVU8lo8qOu4L2+UMPPcJo9LnlE9KIV0HfCbbbl3S1LtjcKWGJhKsLSWXMPCJmYoHpo
         k1PCxdbyXFKNV6EXOJgJxqk/p6C+++7tOuZVzXZWes0far8derHfDpG4ii5N2Hk+oymt
         1NHF+kN+HIT5LFLghfj3aok77KCv8qIXeXnRfQn9t3vtOZ92B0U8K+RZFpoh3ecbEcHF
         ILB2m11BNP+ddc2jBnNIrleawMBrmlFe9+Du8wa/ncmIlwjVsj8nbhAMKTSSEVq+Gjwf
         bReA==
X-Gm-Message-State: AFq9FYJ77UeC2RR0LCWdXKUxv5hubxmdUEgIjk7AhnsIYHaT3QjRn/0o
	7KuPAkvrEHMmRg5cTPRCXVAdaOLQACvI8Y7WE1tcGWuxZ15nizg4XcXaJ1QBGLG46Mc=
X-Gm-Gg: AYBFou2xw4hHNyQD1s5R6vET11Ja8DN3rTXIV86l6Oe+7FNEmfuBvrMmZKe41NL1E0v
	DoVnScbF9Cof8tlMX3xu1qgjqpqAJnrBRiQ/gR7otBvGKOtJvZkUTxg6cTJ0/PrpLvC/S1Wha/j
	E9RJ7IXB4eLR1Az1l9m+1EkMa8D8Sp1dW7v6l/V0nXmqMPWvbFLtAreeQGAqynIhUFQr7n2cLnl
	+nOT4IxZXiOfEn7ZyoY22ag1MqwChzzeE4fYnEJfK715L8DFUwKjX0zdzNrg7ckYwWxNCrmd+w8
	nxoBoeGpYirXGi87g9B5VvR63B3Hrz0ul2HbMZ5qbIv1F+tO2CEnETscmewc7ZiMrw+FPXMJBsk
	b6mY5KQFPJ3JRdejziJ9ldcFzNzqoo9z35uF7g1xz9tN4HHsOtlR6qatS/amAzEvZtUjtmMGhvw
	gSBCBDSOHGYSeWvp9Se1prHs1p+8AYxuNZdlSQl7SpXhucrXOVsvLAvBdpFgshDLc=
X-Received: by 2002:a05:701b:465f:10b0:15d:f053:18b6 with SMTP id a92af1059eb24-1851160d00amr11661868c88.9.1792443545620;
        Mon, 19 Oct 2026 13:59:05 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm30721418c88.18.2026.10.19.13.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master:
 (build)/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3:
 error: call to undecl...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 19 Oct 2026 20:59:05 -0000
Message-ID: <179244354354.160074.15935947483852417783@kernelci.org>

New build issue found on next/master:

---
/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: error: call to undeclared function 'scx_reenq_wait_dispatching'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
In file included from /tmp/kci/linux/kernel/sched/build_policy.c:71:
/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: error: call to undeclared function 'scx_reenq_wait_dispatching'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 5178 |                 scx_reenq_wait_dispatching(p);
      |                 ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: note: did you mean 'scx_wait_dispatching'?
/tmp/kci/linux/kernel/sched/ext/ext.c:4896:6: note: 'scx_wait_dispatching' declared here
 4896 | void scx_wait_dispatching(struct task_struct *p)
      |      ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:49: error: no member named 'pcpu' in 'struct scx_dispatch_q'
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                 ~~~  ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:49: error: no member named 'pcpu' in 'struct scx_dispatch_q'
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                 ~~~  ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:49: error: no member named 'pcpu' in 'struct scx_dispatch_q'
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                 ~~~  ^
4 errors generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179244354354.160074.15935947483852417783@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:071b2289158603096de587bfcd71b040198dd84e
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6681855fda5076042c9b5

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6682355fda5076042ca4a

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:071b2289158603096de587bfcd71b040198dd84e

#kernelci issue maestro:071b2289158603096de587bfcd71b040198dd84e

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516253;
	b=11Ha84y8aKlLoOfD9Aj+vZ1Yar9g2RSxBxMwbA8eeA6eD1dVktXbcmgN2ZQLJDSYLY9G
	 HumTzlwrsgP69LXQF/rZeKhFhnc33qH7vgamPlI4p9RQfJvFd+l6oZ4TsxRPvMmf+powE
	 F2ijRXd0ghe/I8+Ii7wx815DgnbWeSE9OOOEqHiLIH+mgxNHGBOePMG4+iVl0QMEQvdcX
	 c1IG+DZRX3Pp3fIh3ir15k4N4U3SdWGyntpJjE2TvufjnVsGgECGgGg5jygt8nUWotVM4
	 Ky929MQkQcKIWnSv6XkhG1UOwr3V1cxvLXkgznXxpK9xox+ejUburilSiXZBCuoisYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516253;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VJqkIiPNVDYg99+7WtjqOTUKFy/SQG4E1Zt5xkilM1s=;
	b=MELQSOzre0X5Sk8ucG3nav0iTXi0+lRrdicivAbfm1IJnjlKx6JV+GOnBJS3jV1CMTob
	 uiJH6EazGGq+pNXy1Q2p+GNEWipn872PdgPynXJ7/dhvNxnDvcNWNPpb282vGdRIqma7N
	 SbzLZQBGVYHjM+DzGHLk9BYTBD/VmJkaXLukataTvy7w5nojmsCyuQZAvR4BWyy52BeJl
	 uQkrnDHpm5bqlNt6Z3yQS2MXqrfA/WvGvCoLv7jsLBYGCPapDwRGGdLZ1qhZVc8HC7TK/
	 VT4qFq4dx9xh9q+YpVhdlByOeU6XcQheDMHmKGcRonoYusHswvU5nDhWZX4NoeghvVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CMX8YgaV;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36719606A31F
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 17:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36719606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CMX8YgaV
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1209718a12.2
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 10:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516252; x=1793121052;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJqkIiPNVDYg99+7WtjqOTUKFy/SQG4E1Zt5xkilM1s=;
        b=ViA2IQJmZK5BIrRY3jDtUZ0duTv/jFUxvISjU8zi1v1b8QbJTLOzczdK/Cnu9o1puX
         YCsCEFvDQGQ60Eml6gMlaDpcgbnZ03SUouE6lehGoV1n/X2Itw30PnLKJYw2d0VyLyDe
         gdUkGptlejnhsO65jFNzyrxijx6H431b3kusNyA/cZCyn4FG2989EydVpKKWHxrnqREp
         J43rGDEU72+9hyvIyKlY8gNb26sO2yuVctNKcNS/xqlCGsp44y1/2ad+GosB7V72d2QJ
         03FUWNHFtxp61/mwt4cjoEfNIIzAJ4SS0xS1zRYT1dmz+R2WAUzFuyP62lQs+iMfCxoW
         CxIQ==
X-Forwarded-Encrypted: i=1; AKwUvBycLIUXj4b5G/XP4WIRJ/HRVWXnXXBrx30j3doTvfouKGjKHldNHU4frMxAU9zglnJX9AOVmygAlLdQfQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIN9ELhOymZ+B3LJbyWAuYJ062M9K9Ry/U7oPJ1T0hYo1FHIrI6
	2nwGLLTtjXttS/f/Nt1MZb2Zt+MLYvx9DiZVoz7M3XHNKey04Fn1S0gyKOsLkZfUS++jIZtySud
	m9w6Z/RYvcK5qYg8RWQDcg4fivv5Imm9xnkOlidJZ/CgA3y2jMmZKQ1+r8gxhmQegC0QhdKTZbK
	9d5CyCG/O2sWowrWjoF8gWxzTvS26Ve3DpMrAqux7j2J4udY/RgOlc6QeTvYMUXmFK1aAvrIyUi
	fTkOiYs1MigKCQXzJkXfw==
X-Gm-Gg: AYBFou2dKqBNdFm4ZoOLLuTyYH/abdPwmLShWs/25Ypv6OBmK79waTkNBRHBbhD6VwK
	wbU8HmMXsTUDG+jvaRBTlXXEOiGEd5qRJfaygVt9Y4YwBehIE+lEaKiYzrIsjDanPgIHIUFtAOw
	RpY2i6Gp9aZk3+vscuHTSN3OuO0jfO42fBYni5FmXp2YJ9O4CitazPjMT5mIdP6ezrzvGqufp97
	ZiqQq3nH6F+oxuVQxzvEZNPPRX7RIzVwkywUOdIgfF7whmyUU0umIAqTD5yus+y2xxdSJois8/2
	BPMryJAB7y1gyDZNox3tdm+//6bGcJIkhV15dXilFZbXo3fu8F1K8SWnAY/9sz/4RmyUn524b0/
	Ypdm8WKqueaM+xbYgoD4L3IFyfOXEZnZemLqSsKftyJXF2A9WBDVN3orUKNDZtcOX0hZWhuLfCX
	MjcJVdPuv9qbMa8ui9ijQAJvje3UcHbvMhqNXuJxYwLg==
X-Received: by 2002:a17:90b:3851:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3acee2939b1mr8740813a91.7.1792516252201;
        Tue, 20 Oct 2026 10:10:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad82359de0sm96548a91.5.2026.10.20.10.10.51
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 10:10:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b861c0618so57880886d6.0
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792516251; x=1793121051; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJqkIiPNVDYg99+7WtjqOTUKFy/SQG4E1Zt5xkilM1s=;
        b=CMX8YgaVyyqQd6oTyvXdlr+DJTmDOzFZT7p2zGJQMqYydBTZj6GwuVsMtW3tRrpDxY
         3peuDpNZioJIlQf6AKhXj1px0IThuUUpWCDe2I9mk5BfX+0AB38GpB7MB7B98dWF0WM9
         RV9/FDzlftfD4r3TqCF/YWYSX8vp1PCy0kcrA=
X-Forwarded-Encrypted: i=1; AKwUvBxpMKBV1n9DiJyczHpmKMCV6n01X7IrTkRSczKxMdIgjZPzRb6pw401xb5iSuTZj0HFcPi2O5m73fFubQ==@lists.linux.dev
X-Received: by 2002:a05:6214:250d:b0:914:51b1:6161 with SMTP id 6a1803df08f44-91bdf0df624mr198193696d6.30.1792516250819;
        Tue, 20 Oct 2026 10:10:50 -0700 (PDT)
X-Received: by 2002:a05:6214:250d:b0:914:51b1:6161 with SMTP id 6a1803df08f44-91bdf0df624mr198193046d6.30.1792516250202;
        Tue, 20 Oct 2026 10:10:50 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c48c49sm2815656d6.41.2026.10.20.10.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 10:10:49 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Perlow <jperlow@gmail.com>, <aditya.garg@linux.dev>, <baolu.lu@linux.intel.com>, <dwmw2@infradead.org>
CC: <iommu@lists.linux.dev>, <bhelgaas@google.com>, <linux-pci@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>, <regressions@leemhuis.info>
Date: Tue, 20 Oct 2026 19:10:46 +0200
Message-ID: <1a15a4b49f0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <D0E6473C-3234-4367-83E7-B85C022B0F1A@gmail.com>
References: <D0E6473C-3234-4367-83E7-B85C022B0F1A@gmail.com>
User-Agent: AquaMail/2.7.0 (build: 200700061)
Subject: Re: [REGRESSION] intel-iommu/brcmfmac DMAR fault on Broadcom PCIe wifi, v7.3-rc7 -> v7.3 final -- candidate mechanism and proposed fix path
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 20 oktober 2026 18:02:30 schreef Jason Perlow <jperlow@gmail.com>:

> NOTE: an earlier report on this bug from us bounced off one of these lists 
> due to HTML/multipart formatting from the mail client used -- apologies, 
> switching clients. This mail includes the full original report plus a 
> follow-up, merged into one self-contained report since the original never 
> reached anyone.
>
> === ORIGINAL REPORT ===
>
> Hardware: Intel CoffeeLake-H platforms, various. The affected device is a 
> Broadcom BCM4364 802.11ac PCIe wifi adapter (14e4:4464) at 0000:05:00.0 on 
> an Apple MacBookPro16,1 (T2 Mac). Aditya, including you directly since this 
> is T2 hardware; copying iommu/pci/wireless because the fault signature and 
> the fact that it reproduces on only one of five tested machines (at the 
> time of the original report -- see follow-up below, that has since changed) 
> looked like it needed eyes on the core IOMMU/PCI path, not the driver.

[...]

> THE ONE ANOMALY WE CAN'T YET EXPLAIN
>
> Despite the last two items above being unchanged, the actual generated 
> .config has CONFIG_INTEL_IOMMU_DEFAULT_ON unset after make olddefconfig 
> against the rc7 source tree, but =y after the same process against the 
> final source tree, even though our template explicitly answers "# 
> CONFIG_INTEL_IOMMU_DEFAULT_ON is not set" in both cases. Our working theory 
> is that some other symbol started selecting/implying INTEL_IOMMU_DEFAULT_ON 
> between rc7 and final -- which would override an explicitly-seeded "not 
> set" answer during olddefconfig resolution -- but we have not identified 
> which one yet.

Simply run make menuconfig and it should be able to tell you how it is 
selected.

Regards,
Arend>



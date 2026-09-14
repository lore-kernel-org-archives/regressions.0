Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579DC35294E
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 23:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427803; cv=none; b=gUREo+Fxm/8RNy6kjXWvrg2/654aINDwwq8M9jUnh+VIYgjVdOVjWxFfqhyqtdAmXddECCKV7CYDJlhOLxtBIP8fVhAk1/zfJvwZD8qjv2cpHxebrD2K3m46WjU1B0lg/2VGX9I5TdqrTIt9aofskeRe5Hd5ge0w6bBQZ0LAjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427803; c=relaxed/simple;
	bh=6zWxkkeiTyWE5LKeVfdhoG160eDFFWVwrPpDwosVNsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7E2b9gvXXOlV1N3QSoqTf4OZLmV93MKowA/IYInQTMTFQGLuRcpdWnEHhTBfAhsTQegN2PB9d72w/kAWvtLZxfqlfYefxSnh8lJJkiOqavMetHBOVfWlYaBMyF7RzA946anHFwrPYIk/ugaaFWfl96yjfmKwyMZX33ptkEFHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca; spf=pass smtp.mailfrom=justthetip.ca; dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b=CTN8WiOg; arc=none smtp.client-ip=91.218.175.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=justthetip.ca header.i=@justthetip.ca header.b="CTN8WiOg"
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6zWxkkeiTyWE5LKeVfdhoG160eDFFWVwrPpDwosVNsg=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789427792; v=1; x=1790032592;
 b=CTN8WiOgCgcBOqgnN4CcU3dUEdhIrCHG69eyBylJY3dopCJ14vtbC3gvs15LK5dIFLBssFSv
 oaMh34+xqmSi+Se3HTEwEnAUmgwolt+UV0e3UQ2s7cp0agA9qpEl0cXPi50M+mDeiRathmIfC3p
 R4gh8HPeL6jGDLv5VfIEkzZtkHDBwHsjrzqTmT7EE3WTaaLGW7hfkSjGIOu+/ldKi40pvC2eh1+
 hZSa33IElwwuE8mS1px74fwfBFLbFr9AaPKcm8vgkHS4UDK61lok2XjvpID2qJRhyulnZ/slKnP
 XGOm9GZLh7RrCqqVu2s12MzMIRMCKTUvO4VNNz2cJZxTA==
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 93e28aba6f8c875a;
	Mon, 14 Sep 2026 23:16:21 +0000
X-Mizu-Trace-ID: 93e28aba6f8c875a
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in ACPI SAR init during probe
Date: Mon, 14 Sep 2026 16:16:18 -0700
Message-ID: <20260914231618.17749-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2fd03569-f1c4-4c02-97ed-c74f4cd7f809@leemhuis.info>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca> <2fd03569-f1c4-4c02-97ed-c74f4cd7f809@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Thorsten,

Thanks for pointing Linus at it, that's pretty cool.

There's nothing to set straight as far as I could find so no additional
patches to send. I went through it pretty thoroughly against mainline
this afternoon.

No stable backport needed. Both commits it fixes first appear in
v7.3-rc1, so the regression never reached a release.

Felix's tree carries no competing fix and has not touched that file
since October from what I could find.

The two patches still queued for that file, Junjie's 0xff one and my
table-layout one, both apply cleanly on top, so nothing got stranded.

Thanks again,

Devin

On 14/09/2026 06:35, Thorsten Leemhuis wrote:
> For the record: Linus pulled this directly from the list into mainline
> yesterday after I pointed to this patch in a small regression report. I
> did that, as I had seen multiple people reporting a regression who
> confirmed that this patch fixed things for them.
>
> Bypassing subsystems like this has obvious downsides and risks; hence,
> if that got something on the wrong track, please speak up -- or ideally
> send patches to set things straight again in mainline.
>
> https://git.kernel.org/torvalds/c/7825de3f75d184612d77655669a04ea0da252c17
> / 7825de3f75d184 ("wifi: mt76: mt792x: fix NULL dereference in ACPI SAR
> init during probe") [v7.3-rc3]

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677757;
	b=NIGiLsFyUfuXRRRpSMwe4gfNM0ZZlG4JZT76+U55EnEl19pJxSLg/DrxJulOtEwPNNAn
	 32SPJJJX3v5o4fwd55Z2KdndSxEnwT8ezOplPppJ1fT6B/a07GXemdsDdxqtcmD1XNqPW
	 fNSqi9qwDdw7phCGTfyb4Islw7lJ0xL9IOZZTwYU2DhJiGKx5yreKNfsbr3JC0Z8hKX0e
	 IIEjfyu52rqk2xmMa6lOhq/KRPp+YX7lfdHVYhzzQnHtVQNwdDxxZcUBakjmYCh2bbwb7
	 inLlEcNLetZSHKlOZBoST6Egz2vK/aYXhldgPFpWOsgVBHuOMlxCToH13K1VTpc3M9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677757;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qK7SuyRaPZU4Zu8y5BHFfEAd1B/irS9odpnB5X268FU=;
	b=IUvoylA2fEa+tuLIbueQoBpjnEW89dLl88hHSi481UtseptUI4hdrqt2we8OJyJZwgUR
	 4KqEI2nuCxjoMHu2Pnxuc8Yrbs/cr9gr1UXxx5T3Sy8cesMGz8zjqEp5Xm+7Lkm+quAvd
	 49YJNPagOHHvC57GczzGqozZXm09EOy8EQLhdqN4SjJ7XgqR/i8KOetLIfdRuIDja+Yx6
	 181sEtmFlfGmz5PzMCcIxUNGCPv3QLGHcxhXthoD76HEjuExEAIjzh1LElTtS9/O+DMYJ
	 FCzezo/2xXMsGAPPM5UhZi31D7FZhImpRjzW5LMOhMmqA91fQsdGFa7N/1wwqgW6KEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=v+0QoPX8;
	arc=none smtp.remote-ip=95.215.58.183
Received: from mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E50606A332
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 17:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E50606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=v+0QoPX8
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=2E6UwzKVw7xbUUzy4LRhSE/cy3bndWxPXfWiSHkxIRI=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794677753; v=1; x=1795282553;
 b=v+0QoPX8dnT9S1HhuRc4W7BP60sTbojQ7gjTlfbKmjHx2O1ZdoQoQasPl/1gRvcgZmNdmB0S
 nG/XsQvSG32fSAsMVhln1wwsjXQPkahZ2G3C/ZEIJSyoaClwzzvNPvuAhT5yH1B2F/SOBtFGdDt
 NteqXejawRnA71OQ6cNaSzlJBa7YImTxAURHPYeDfY/5gze8jWCQoxwJQp4Hz/zsR1XEr8/pLY0
 IdEIViFKOAfjBPHGi+vfqdf4G6O3JASzljz4+3RtvOs2AD8ucmSpQt1rVxjZdcpkmDsLzLZu2sB
 E26mEUTgrckRsEIk8xXY6tHoMvIK0nxuE1tcXZfHWbuPA==
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4af640e38ee65c47;
	Sat, 14 Nov 2026 17:35:53 +0000
X-Mizu-Trace-ID: 4af640e38ee65c47
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [STABLE 6.6] Bluetooth MediaTek controller reset fixes
Date: Sat, 14 Nov 2026 10:35:50 -0700
Message-ID: <20261114173550.5736-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi,

Please queue these two for 6.6.y, in this order:

  a7208610761a ("Bluetooth: btmtk: Remove resetting mt7921 before
                 downloading the fw")
  33634e2ab7c6 ("Bluetooth: btmtk: Remove the resetting step before
                 downloading the fw")

6.6.145 brought in the controller reset they remove, as a dependency
of another backport (1c770a550df2, upstream ccfc8948d7e4). 6.12.29 has
both already [1].

On 6.6.162 an MT7921AU USB adapter on a USB 3.0 port has no Bluetooth.
Setup ends with

  Bluetooth: hci1: Opcode 0x0c03 failed: -110

and the controller cannot be powered on. On a USB 2.0 port it works.

  6.6.162, Alfa AWUS036AXML at USB 3.0    as released   with both
  boot                                    0 of 1        1 of 1
  plug-in                                 0 of 1        1 of 1
  USB reset, then probe                   0 of 5        10 of 10
  the same, Wi-Fi driver loaded           0 of 5        5 of 5

With the Wi-Fi driver loaded, its probe also resets the device [2].
The fixed kernel then still logs that line once per probe, and the
controller comes up.

Both apply to 6.6.162 unchanged.

[1] https://lore.kernel.org/all/aBxdpIabalg073AU@m.b4.vu/
[2] https://lore.kernel.org/all/20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net/

Devin

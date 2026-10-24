Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792874183;
	b=Xj0w/ISheB/KiKNUzesvc0yj7DrQV31fncSoS/Hp7YMeuTHTuY4U/Up23UTHNShKZ7c8
	 p+R68zCEDTTIvXNaVkTZWf0cB7h4N4ITnC9UIWsws9BSrD7vLH++H/guelNC25WfDUJJE
	 ybouhJmgKY00e4aSUq8FZ9Jmm/zdXYh72vWw8cji6FNvJ/j/l9mVfO3cHCpUp/3YhXjc6
	 sJLPEpwqFoWbj1+104SeB0eSYvJ0XS6e7aZbjwbDqjskNGeXWYA6SVSdI3sutdqED8bd8
	 K2rXGqiP/eqKr7PvJQ18bgNm1j1sTZbw5irqL/tWnNHpyg437ykvsIfZxlm3KABV//g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874183;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=TsR9sKWVvIFHcKaJnMZNIOZ+QkQWYMOwkj6KzabfNpA=;
	b=Cw6Jmg9n3hg3yrVuz8xGVDL7A9WzMJsCUZnWZsg/YyVRNio84e7lZCKOMDvWF/pJD5DM
	 fVS/r7l3oDEhLgTVw5r7ScY5kweM8cc1h19sS8DLu33v3CwluT23NOz8i/idSCpfcmQnQ
	 G6S7hRFcip4We3wGmra+TEAN5cbNnycO17dADDfckKl3dpZkIsQUCdvE26Rz8NcFJ6LP0
	 UGOK9+qZrOkmCVf5d+fZk1onJKxep6v/ZhLdlA1Y4f+etJo5TsTRuCPSZL4CX86AALFNy
	 OXBgTezhXFUUHI/S2DFfQDcSvrf0vkMsjuwGmShAySnmvXlJg3Im6xTUR9CfTv0RYiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=yiyuzhou.io;
	spf=pass smtp.mailfrom=yiyuzhou.io;
	dkim=pass header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=DF9ampO2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93773606A31A
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 20:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93773606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=DF9ampO2
ARC-Seal: i=1; a=rsa-sha256; t=1792874171; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H676zoERxWI6cTCqFzKytTo1ViksR7f9fTpC7sbxEtnYsIdPncDnUNjONMv/p6+XkRzUDJO8opDnK+g5cbm4QFOSYQUn/TfvF+WNkQ/AYczGmiOtuQWLEobigRqXv4jGvrjPwj5pGF7XJ6Fcs+zY2ccXG7ANa1uzq2vTWTjH1BI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792874171; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TsR9sKWVvIFHcKaJnMZNIOZ+QkQWYMOwkj6KzabfNpA=; 
	b=HCKpGC+MfsMosxIPEhzO5V8DdBhf8Wliqpq/NLmUFiCuyNQty00CoZ8e3+PHH7D5kBD24cudCJy7LxQ3Qonp06u0KQ/j7TITFxRlP3K6QDKJdaF6vh28kDX7/5voJIYfaT4jAx0phcyEC3A/DWGRJpCwONxJ9tNdf7iNa4JCeBs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792874171;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TsR9sKWVvIFHcKaJnMZNIOZ+QkQWYMOwkj6KzabfNpA=;
	b=DF9ampO2SgjkSzdRG+1RoCkLk2KP2DIsVeC1jwOyBdAYI1bROj2YyMO0EKyaTyPz
	tGlBGx+Nztwo0ua86KLEQkgPvX4RduN9FyHAfhcp1O3loPlpINWr+ZbOiWwx3gGusmj
	pGP5wPO6avl7XLGG3UqnmokSdfIvBLkhBIrpanXk=
Received: by smtp.zohomail.com with SMTPS id 1792874169153726.9444677472776;
	Sat, 24 Oct 2026 13:36:09 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: Dennis Wissel <dennis@dsine.de>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5 (3434:d068) at boot since v7.3
Date: Sat, 24 Oct 2026 13:35:56 -0700
Message-ID: <20261024203558.3181711-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sat, 24 Oct 2026 19:47:10 +0200, Dennis Wissel wrote:
> My guess, untested: the xhci changes merged for 7.3 that touch
> cancelled transfers on control endpoints, e.g. 7c0c31c66a7f ("move
> dequeue to next valid td instead of past cancelled one"). The fast -71
> on 7.2 turning into -110 timeouts plus resets on 7.3 seems to fit
> that. I haven't bisected or tested a revert yet, but I can if you
> point me at what to try.

This matches a regression I reported with an HHKB keyboard on a root
port.  There too, 7.2 failed at once with -71, while 7.3 made the
usbhid probe wait out repeated 5 s control timeouts and then
re-enumerated the device, which hung again.  In my case the device
disconnects itself while a control transfer is in flight.  Since
042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
disconnect") and 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after
disconnect or link error."), xhci does not give back a halted transfer
on a disconnected root port and stops ringing the doorbell for that
endpoint, so every later request waits for its timeout until hub_wq
handles the disconnect.

The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
("xhci: give back all TDs when skipping endpoint reset after
disconnect") and applies cleanly to v7.3:

https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=for-usb-linus&id=1f36cc9fa9496189e95fe5762cde8a74e0cd9d68

Could you test it?  If it fixes your case, please reply here so that
Mathias can add your Tested-by.  If it does not, reverting 042aad8d0db6
and 7e0ef4332ed9 on v7.3 would show whether these commits are involved.

Regards,
Yiyu

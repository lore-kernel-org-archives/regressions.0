Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243818;
	b=pz95D/0r2a8iQmk9Y7kfQuwRuVy6qfOj35nG/8b27Uf/VWti72mjj8o7/0eYlFi55PJf
	 Smlb2qjvx/45NYoV0QTsa6KtikfL3bLpeuWcHJAg+8x3whX8mc0wPTqsrmJ7uXfb+iYEi
	 OUk98hsZhAFHRTfI75kvsBAWBS0X/kkgWvvOnJSC/NjtUY3sOtg6x7M+PlIZtN/p1DU4i
	 C7eNzrZJZ0+vHSXSOMiE28VVfoTBI/88yjsgpo8kGVMhbF2qE3hfSn7H9s+k1St0w+0BL
	 QkA1JMWvCEFkQH3SLVgsl7ptWwf8FLaaWgtypYXUILXaxAptOXDcpCMU7AzBEnREasg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1u4GSn6kCeZQ0uH15hwW5FEpWU/gT2GfohX8l9UfGRA=;
	b=s9o2VE1KFEcR8qNpZtTk+VXC7YcZsqrp6hURCwpn9eqe4qwSOrMoWs3nYGA/kOVIG6H6
	 5FhbccEBEgKRqrUVwaVzRr5dvfq481c/fDttY2bq2gaLkFz2kuXonALqf1YviZr/cFa/Y
	 rohSNo1KX1FYGPZUKBRI+0FUyAXjmfm9Zgx8BDqeUf8Q2sntg5l5uBepM5YfCbPUpz08W
	 c9hvBkDm/Gst8jEKhjtUWjn+cXNVy+tlYDIimc7jPVZNV5+bGTu1EvYEH/XQKQg2qiCaB
	 Plo1zm6gNnpMtGNC48hsOUFGIbzXkUfPrYkx0TxA8xHnYyuTj765vuMvQs3cF4s7ozA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6l2ec3K;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E642D606A31C
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 17:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E642D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6l2ec3K
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9445175e9.2
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 09:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243816; x=1794848616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u4GSn6kCeZQ0uH15hwW5FEpWU/gT2GfohX8l9UfGRA=;
        b=U6l2ec3KEQWczkFpj3w73xLG6UCBpnIk1AWggMaIGrjRUI1wf1WO5jSWqWC8VHGdN3
         UmCSqzSDDEvS4pHFbLxkoqniaB2BOFpds6LCFjPANXIPu2mrCvimTFTUazNo2QGehqBe
         JjYegO1zWR183XmMfLqAJvLyKLCZ3N+ZD+qej72KODTmuhDmuub5N4HOOLG46jbjtWnt
         Kx2sGnGA08SgmcMR1fBBAxt3LhNCr4/I5r+6zJGLYynQYGPNvm2WXefUahn6BZG3Mhug
         BnzFmRSaLx3eY453R+hZZSaxlGC96o3Wxm3XOZEbiO3T2R+DgPervFc2PryOADqgqVP6
         ZRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243816; x=1794848616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1u4GSn6kCeZQ0uH15hwW5FEpWU/gT2GfohX8l9UfGRA=;
        b=ctTzL5wsdbyDHxUsPEuTJw6FS4gTi6qYb+5ovg+ZhWYYKoA5iOCpOHPQ8QJJeQqFEm
         k2/uFmdJxQQ6PMgUY+9NoLWU/6ConrVWOXzfMQpz4FO331hQ8ki8Xtw8NY26mgdwnBq+
         YOZ1sH1FtP1QlBT4GjyN9C4PnuG7W3abN9T+5gES1hlo6vFENmIMxK/T+C0y6cP1opZV
         w+VpgiXqodwSeVQapGJSv2uctmP5vfYPZg1ocXKv+jU0ef7Fh/VAyd35P6l909nVYGyA
         iINI/1uhwoPbXUPdNTslOtEer70soQFIT74JplMZnxqZktx8fXQoCMZsMHImGYpXLPHM
         tIBw==
X-Forwarded-Encrypted: i=1; AL+hErEtO4VE5uU7gk9+Vky5RDXkJ6XXdLOtMVpho33iv8TyPWhBwQYVKFbr93GnTPRHTm0gQTYqso7+KE93ZA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XJIU3UUy4tPiU1zS/pOeZD5mbry/m41YJZXRIaEgLEmA427DR
	Hyzqs9jcV36MMuwd4v2r4WC+vCtqCbUtIi0j1f1okPrENthy/Ap/o6cA
X-Gm-Gg: AYBFou0+qnW5VNs6x4/te2tuuRt0frRebi1dkd/Cvi1rGV9kkeOm6mOCF7K/ukvinHm
	UvrxBAA8R/S61tTuR+5RyOSc1mhwbtaaTFkFwuwAOCw0XFmkNxHof1bLtwpRVtUxMkLxqWNV3M3
	UkxGoWwgTZ44Ha8pRG0Syn29lJNQc/DBjJYSeNNeRWhKYVpdlJtHqNjgwdkznLbrfZKY6/bagOT
	fGBc+sg8QBdOwy5wqjocsNMm1RtUr9dCinktJi9T29iVls2EzhWtNt23XPMPH1fH7w7CxzYi5vN
	6RdCYyu6Os2xXASMJTicLS0+Wm5d+itMy3vAACoDgDkTmCBEnqrOtfcJicyXdqFwI9p0JJgDGOA
	8DX43CMhN9kJvTfQWyVXuF10acu8micqkqS5OYPT9bn5eF58OSCeAIyiFHS/sJBBRLBeSUacB2+
	HECBypaHYE0ojVixOpDK59PicyGgNK661I9WaqsYbjCU6KL7MoKPa+u3QRyj/OgdxElprmbjFYU
	xcMFAoVW0I8mQZM/ZBR+1K6LySvpMWnDs6qQ169SXyUwykKhh2rFKHaXNNnv6n3DOqb4mKgqmOb
	OSIRAJYjGybfIcnq7Q626x9Z3UmNRAY3QrwzklWUNzF6NYCMxTGnTq+aMh8wQtt4cWqlBHuDSxR
	JXeMae4zZv5SbNvk1yrCDpHT8lR7So9aoIRd3lOkZa0z8IiUODQ3oOc8kUoSpRPWF16VK6sXHTK
	OI9cWJgl5DfW2FPR2MpztPxHl2Li6aH7NkDpiHg9xfDop9xW7npxkebxzRfJ9on1M6hobTY9ow9
	XAUEGnsHVC82yrnwLYxMSQLxin83mhs+vBx1YEz
X-Received: by 2002:a05:600c:1d1b:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4b94d7631c1mr90723705e9.1.1794243816128;
        Mon, 09 Nov 2026 09:03:36 -0800 (PST)
Received: from px13.tail3a7e86.ts.net (91-201-161-73.ip4.as24916.net. [91.201.161.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8c3b9sm1952725e9.4.2026.11.09.09.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:03:35 -0800 (PST)
From: Lee Mann <leepaulmann@gmail.com>
To: baojun.xu@ti.com,
	broonie@kernel.org
Cc: shenghao-ding@ti.com,
	niranjan.hy@ti.com,
	antoine@montane.tech,
	andrey.golovko@gmail.com,
	pierre-louis.bossart@linux.dev,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
Date: Mon,  9 Nov 2026 17:03:25 +0000
Message-ID: <20261109170325.10953-1-leepaulmann@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107212552.10990-1-leepaulmann@gmail.com>
References: <20261107212552.10990-1-leepaulmann@gmail.com>
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

Follow-up with one more data point, which supports the approach in
this patch.

Same PX13, kernel 7.3.3, with two modules swapped:

  - snd-soc-tas2783-sdw: unmodified v7.4-rc1 tas2783-sdw.c/tas2783.h
  - snd-soc-sdca: v7.3.3 plus only the sdca_functions.c fallback from
    SOF PR #5904 (function type for mfg 0x0102 / part 0x0000)

Kernel log:

  acpi device:26: function type not a DisCo constant, using fallback for known peripheral
  acpi device:26: SDCA function SmartAmp (type 1) at 0x1
  acpi device:28: function type not a DisCo constant, using fallback for known peripheral
  acpi device:28: SDCA function SmartAmp (type 1) at 0x1
  slave-tas2783 sdw:0:1:0102:0000:01:8: Found Smart Amp function at index 0
  slave-tas2783 sdw:0:1:0102:0000:01:b: Found Smart Amp function at index 0

speaker-test -c2 -t wav: Front Left from the left speaker, Front Right
from the right speaker. No "Defer on undeferrable control" warnings
(with the same fallback on the v7.3-rc6 driver I saw ~1600 of them
during playback).

So on the PX13 the v7.4 driver works as intended once the ASUS SDCA
function is parsed. The regression is only that the parse fails on
this firmware. Getting the PR #5904 fallback (or an equivalent) into
v7.4 would fix it without bringing back the split. I can test a
posted version.

https://github.com/thesofproject/linux/pull/5904

Thanks,
Lee Mann

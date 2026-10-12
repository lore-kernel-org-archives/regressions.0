Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AB9490C0D
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816988; cv=pass; b=D6UsJHrjnT4qZXdY2aYP7Nicqq7DR8t6vyY1l8K1jX/vDJ67wzxGEiCx0rOv7nQ5X0WIOd3DpwJFn9ttH1yX+WjHifiDipEaqricJcgKXPtoTC+dTQaXn6+nAxOFaMb6+ke41YEJlWugkWXOoUxwoYv3+kmABOf6ZK7u0Occ75Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816988; c=relaxed/simple;
	bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Aln9sYSQTPNyqBh3fn7L3wjs7eVqgp1nJMeTPiS28QuIqurK4Qg0taYdduw/Xhsb9mFXZguCmy+Zxl0EJnsA4Nrk8dv2CV+mGyR7xaRaXcWl9sXdlYf73KH8d2KGZfCxm5w4vkCC6zFA4GoRxgXeGKgLJRZdXlJ0keKQKE9/FUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKwF0XL5; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKwF0XL5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1460772a12.3
        for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 07:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816984; cv=none;
        d=google.com; s=arc-20260327;
        b=RczInR2q0GWX63eOs+990vpJe0cXtBuFSIq5sIBvIWIZQskM/p1IeYtbYcP+dWW8cK
         I3VHNuXfHtRdRRwmBKuZc0mQr/ig2cYvKJCn6i6+7mNW2YcORh+JlGuMjMTBv8ccunna
         GvtFiu5R6gmL85KpqpRLbj459embELUwHYwsVHBoaYXPZTRglLCBY0jfIg6RSh0dOfDN
         +urnm6fCG+bZCiZK7cRgcSgH2UMzmPfdry8j7Gl1YoLSTKQ5ibulmn0CmgmoawG2lo4T
         Vgmkc+cafiVnmlkH9fC07CoV9+rGdHyG6GUISgM2DaVW24j3Q9xqxELGSB3SmrzpYTTN
         ATwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=;
        fh=gxYyIHYvMcVnH/gAFYUNf65hjVa4eAI4OEtXRCDAlBk=;
        b=KHLC3n8jBufFJA8dHpsaZZcMy9SidV7akwQ/hpMXCUPHDwW2ANhIT4JLUKBahRz3Xl
         8If72+WWHVvbpW82XDxqbwEmHnM8LPC2LAJCvqT2JkvpVdz6lQzSArvoSrOLU00LoBDT
         kt2aHrkGr6SR4U0GwhykDWxg9Ia6cDaORt69omnxbWABD5Tm58ACvUpcf2OPubeVAWcU
         iaHroXUd0eS1OnVZtz5Hddq+FXQWLEIvWiabgMaBF4c2WB1hYK59BcHQIk43UJTPV20C
         F9aEqSeU0NYKGsxmtxO2IUEF169p3AUgc+775NAnbTDmlXzJsSuHc2ozU7pKhI+WQl8K
         DhRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791816984; x=1792421784; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=;
        b=XKwF0XL5XPPjSYxaSdTbKk5L4cIVl4dpS2D32KhCU7lXTNxaurB7lz8cw/UyQyROHu
         EwxBZjGA8qeb1GsEbKOp/SWl/FnF52qWScwHIxY6xRV9Vurw0eSN6tA9pQhkNvCpeNua
         0lBsj3RspMbDGkcsV/OUE2ZCZ3WnJBYnwrtzEZ6xdPRlBNDMsp0vBvXTIY6y1iRCR4AC
         UAoDMo5KkPb7yquklW11wp5Ul/Gn1DZ6hgo4Oee3OTsYYYUC+3LVW3jMwUTPsnC6qwIw
         R+h3L3Xvx6Z+iJoA/rWNVvUVvtN+K+Do+D4m7BDW43GaJlgiLqajcTKDsl3DbOKrTyQ8
         0Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816984; x=1792421784;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kb5s/1sQG9XYIwryOKTCf1h4HlcDSiYJw6L+9ETpVF8=;
        b=lfST2kHH1334kx0686J2sdLOw7sC6bbtyoWcwqSAcMQ6ziIclWSZL8EtcDJbLghuC2
         f82D5C41dncxzdLAINFbSVR14XIwGJ4MNFDPPvKh2L8x8eOGZP3qjmpOjRPNC6eO1ikt
         +L6TsN4eWJ3+RJDyd8SaQ72ANxqQom9szfrbisRX+Hzd55yV1n5bNmEpRiAS1lTb5BRL
         fgupyu9rJQ1k9diD6phlED1nlg2KqQlobOmLwt41UJkJ77VTvUs+WMUGgM37jEy6N26/
         wNiSAQKZF8NdiqZPLoNIp8zxOHyEefWcV3fGIIT1V/ojYhszuqrwDQPGI3WaVgCOsyzV
         5BWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3p52yZ3CRknOH1GBXs2SWEuG2PZOVUkd8on22NKhbafudp4B1HVpAGa5GfqPW4mLxn1mX82aqGBK6Ng==@lists.linux.dev
X-Gm-Message-State: AFq9FYJoA/CEOdLaC5R2nzoKnt3+c+8r7n46ge9jbcTL7MtT447zORID
	sv2pdHWtQp0K3C8mkY138oxnnfU8NUXSCEVuqEUBA9XQB38ZoIplZnF2XLSikx52t5ZpJ97Z996
	n4TcFeW2WWuGRDw8idV39zGJbuZdudm8=
X-Gm-Gg: AYBFou3c+gDan3dW31KdHvlSZMGmTHgXwirA/N/bATX8qUufZtNHbmd8kD3gSq25t4P
	nF5/AK7SLIFierJp5dm6pSVYua3/qoAwsoq28OJFKAv6l2ZsQEieeZX2HrVEX/8t/rQkq+quK89
	xjQpOgKVGE7WNELuHVfjdd9fpIs4413UtANB8yER/abjfwW3T/vq8dtNV0dPozHlhLkzWzBbUfW
	DqCmg+zZVIhawtcmPsqFyzJ0h8kSOX2+W/BD0dts3u4d6Vdb1DKu2w7XOnDfP2mEpP8LQD6Rs19
	wBh4iRb7sO8fisRv4lN1iVmlkw5kQngfxlCZKC5nFf9wpSIOWoLo6KSXvuSfFaakGIIvisDhrUR
	T+vkZeCxnBVpK
X-Received: by 2002:a05:6402:354b:b0:6ae:550e:5a04 with SMTP id
 4fb4d7f45d1cf-6b17c267f12mr7897936a12.30.1791816983901; Mon, 12 Oct 2026
 07:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?0JjQu9GM0Y8g0KjQuNC00LvQvtCy0YHQutC40Lk=?= <shidlovskiyilya@gmail.com>
Date: Mon, 12 Oct 2026 17:56:12 +0300
X-Gm-Features: AclHuK_V_Gr_BzvbzmCXZnPpQdlQCrW27JXkLvyBO5_v8U3WJkVXi-60BRN7WX4
Message-ID: <CAGjg407dj0uZ0rCrL4G=PDkQv4-QC_og9Eeg7ewWzxqBvU4b2w@mail.gmail.com>
Subject: [REGRESSION] 7.3: mt7925e hangs on hibernation restore; fix
 c182bfe944eb only queued for 7.4
To: nbd@nbd.name, johannes@sipsolutions.net
Cc: lorenzo@kernel.org, ck.chang@mediatek.com, eason.lai@mediatek.com, 
	emery.hsin@mediatek.com, sean.wang@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Felix, Johannes,

commit c4edf9e3e0e5 ("wifi: mt76: mt7925: replace shared rx irq masks
with per-chip definitions"), merged for v7.3-rc1, breaks resume from
hibernation on MT7925 (PCIe). After the image is restored, the chip
reset path ends up on the MCU_WA NAPI, which is never set up on
MT7925, and the machine hangs hard (no console output, only a power-off
helps). Bert Karwatzki reported the same problem in August.

The fix is already applied:

c182bfe944eb ("wifi: mt76: mt7925: fix reset panic caused by the WM2
rx irq mask")

but only in wireless-next. As things stand, v7.3 will be released with
this regression and the fix will only arrive with 7.4-rc1. It is a small
fix for a regression introduced in this cycle and already carries a
Fixes: tag. Could it go to Linus through the wireless tree for v7.3? If
that is too late, please make sure it is picked up for 7.3.y stable.

Hardware:
Gigabyte Z890M AORUS ELITE WIFI7 ICE, BIOS F21
MT7925 [14c3:7925], subsystem [105b:e112], ASIC revision 79250000
Ubuntu 26.10 kernel 7.3.0-9-generic (based on v7.3-rc6)

Without the fix, every hibernation restore hangs. I narrowed it down by
unbinding groups of drivers before hibernating: only mt7925e triggers
it, and the 7.0 kernel is fine on the same machine. With c182bfe944eb
applied on top of 7.3.0-9 (built as an out-of-tree module), hibernation
and resume work again, including resume after booting another OS in
between.

Tested-by: Ilya Shidlovskiy <shidlovskiyilya@gmail.com>

#regzbot introduced: c4edf9e3e0e5
#regzbot fix: c182bfe944eb

Thanks,
Ilya

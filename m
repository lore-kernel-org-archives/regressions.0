Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864315;
	b=j9N8KLzv0qtqbX8uk322ovaDxAhZg8AGK2EfSPi13/RrZi1Ia884tKL3kxvq3ErhQoRQ
	 ODFvYsleoNQMdTUP0k2uhfUblrVUmwKmVK0dMETUJCBz30XKPO6X4/wMv+F7a2EoM1EN9
	 xi2Ulrkf+r2gufGDyvzPvI0rGAH7k0wbgahyuspRY+lUqvZ+DRGTBFaj396LMhbJPTucm
	 hI+wKjQv9+dadL/xneljyFH4okCSu0fLlwGI+CIZ3goIWp/TEAx5xm4AJbZhzXaW3t/ty
	 IxZLoNaaG4d7MTzMO/Kv8/2B1AyyX59c8iTt4czZXs81TDNj9TRa1t5SHbGS7cnlDOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
	b=KlKu/ABKBXRUI3RonPWn1Ptjjl7UGRgo0wqe2BVN2E56NYyp09SehADVsUNfAHzDx3fw
	 ZSvaresI0sXbfwz45W1dLoTiekyoT4L7Qnh44P7vzXAYUaA1G/aX+oolrAqsIenbO7zx5
	 RaE9sPXV/AEUtk4DQUCa8oxMLpapYmrCxd6PkV5pNcdMBidVPVIM52SRjhSEk1WZdr0VC
	 M9YRXLo8YQpcQF13V1l50h7YrkS4pZTmo+2/boY+kXAHq0Tg90XB8YL0zRYxg9RVwuqqH
	 AQuRUY3I+ESuol8xjHpInxijgkwkERnFvgByr3J7EAdZFLmYFuwn40TiBfeZZJsSwwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7bmqcyw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE73606A33A
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 21:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE73606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7bmqcyw
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0dba37a7fso37140097b3.0
        for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 13:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864314; cv=none;
        d=google.com; s=arc-20260327;
        b=jMvcv6vBwuPIpf37QptYbfvCsn+Z6yENPqonob6pwCm8zUNlz5DLDQCJn1bfhsTJUZ
         inlPwl/oWGKUmXB6wrTA+ha2NXOtjepM0vX0Pp+UUAY+jv+igPOG0CBt7MTsN0MmOiWq
         uxzj43GCqNWFT5zL62GASlzvHiAyCgnShS+0e1xqJm+bbCUfAoMR6YmS/IX+L7HHE4zT
         jIuNl7jXh1T22Nd1HSAztp6HOIdNlhcwywwAcapFODIki839kki1fvXVpY5PkftHSHH4
         8f0vIcMSlEJkGCp4DUDkcQ67EbihcDptbQk3L3zhGaeN+jucweht13+/AhBRsCX1BUj2
         ckWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
        fh=vQb3egmPLrnXwqkPapL9Et1/X/9zneHbDcGjFleJj+0=;
        b=WMZ9Tna8hxlKY9r6rSK9WZBumzjY0trZzZPLgbRiwEJa2e4I+HCQ3tEZLH//y8fzi5
         wuahobmvkPTqH1T5fCeGMBuVddwT8xXhUvxPTTbkLeGYsJvsqQHqA2z8E1ObW9IqFytc
         ZX+YEti9QqYS+fDLogfo9Hg0XPQu9TrAx6Umj43JEOCJbHISsTC0lzd6zOjN98dX2ZyZ
         18HKz7vF40LKDgJGE0/6buGhkxViy9vlGmpKter2DWkgfihN+yZnx136g3/sk0Phycfm
         KoWikl9tnO2o4ScayBoZbI7ywAQmyRIr5xZQW1jqXgIRoxumfjq8ihJA5dJMv4pcfWxI
         fHyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864314; x=1795469114; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
        b=T7bmqcywK8Y9IqKGSst20qbvyHEHDl1m0/D5PBQataDNalNCKHo4HTM9Az16IJ8oB6
         LWox9X/2+XGPM1Yh9WM3QYGmtm6rdhGMcfznwvwL+RdSKOMk3kiBvjLqFI79JAeh9H5v
         7D9hDk3zYSPPjszrFj0YuE2tEoY2IB9b2qzCvr4MkBcOBWIfys+S6gnO8XsNfc3jHdN1
         epguFs8pD+GyeDSlKXyeT1c8Zwd0ErajRFJBU0vrzpB58ZKevb/yXWk884+93QJTnJtq
         gsnN8Btc7IyJh79+Ue/KCFS+htMeafU559H9yqytvdtyCt25z1BKiuULBDAk+DQjwV8o
         RYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864314; x=1795469114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
        b=MjOOE1HxNnXdJTn1JgIT/mSiYoggjtrhH5caRRZYhbECDYX6kbG8nVTwh4q5Z6oCSk
         XWxFgkVThjSvORm/jD4+gGPw/C8pKtZybgSlFx5gbnh2lxur4RmTG6eeB5Ga6NRBRCwc
         fVMZAjRJdsAu3knXj3slOrJFbEUU8h408rIQLnYdlEt7R5q8zifpB08TcCDy8rOygYlT
         gcz2KgrFZLDUUKgUAj0/wa6wueuNFLm/h0SaoDWP1Fh6u/vpqBbby5oA39bM9Mqymwbp
         yFOWw2MLD81BJjahWAIvJpLneFWnYdAwHYzsDo+BH/5ubdgqGGgYAc3avNr+KbdJap55
         hwqw==
X-Gm-Message-State: APuU4Z9HD9+NXCbhIGkxKkSckXB6w/ChYaDaiBAz3V48unAUNWZoVioh
	aOg4KjFSNIIGaU0fbwphBocPi/PCrosz4C3xlOOJe0jVv5VeztLnJ3Pd0Zx28x82HlD+1NHDhn5
	8IH+hSbElaCxk1SUzx+AmK3I17GmcFAQ=
X-Gm-Gg: AZFdTZcm2gpGo5h6FdpnsQjnjM25cZ1W0L5VxVTMwKeE/KlWOlNGyD0h6g4IrstSP95
	eVpfTJ9wkXurdV//MqRjJF43PuhY+sQ98quiw1X6ZhqRi3XDhGoMCsA4TAL3lIRFfc5fCChn7cC
	L9fGUwHVZM3E9X2Tmts6K5DqRfa5oZ62t1fe7nMcboq5iyucx8cPVeZequ4DgQBWl8UmfjVLvK5
	ww/dLNJRELSXqL5EYk7xU+aq15kHEfAX3/lICYr0hFTi/GXdiA3DwXle1f5Cigaw78ZDi1uSQi0
	T4AdpP7c0GiHtb9ep3+Ye8/TikJi0uDy3XeyJgBCGrsI4p7MMNnoxrdTMQoQaq07pIFt/vq3+F1
	fkZuDXmPM5YOvlYaks60XyZaBbvPh4thdueUjkg==
X-Received: by 2002:a05:690e:b89:b0:67d:b299:df5e with SMTP id
 956f58d0204a3-67db299f0camr1859172d50.108.1794864313941; Mon, 16 Nov 2026
 13:25:13 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Ted Vera <tedvera@gmail.com>
Date: Mon, 16 Nov 2026 14:24:36 -0700
X-Gm-Features: Aa3M54olKYZfZ_b5P6Fxa-FoemJt0sPccEEWQj7dI_bkTw07AiGNwoiuCaGze2U
Message-ID: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Subject: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, oder_chiou@realtek.com, lgirdwood@gmail.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Summary:
On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
appears in devices_deferred, no RT5677 ALSA card is registered, and
only HDMI audio is available.

The driver=E2=80=99s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GP=
IO
resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
device. Samus=E2=80=99s DSDT uses those resources for codec GPIOs (jack det=
ect
and mic-present), not Yoga Book-style external reset and power GPIOs.
The driver requests the mapped GPIOs before registering the codec=E2=80=99s
GPIO chip, which appears to cause the deferred-probe loop.

Test and result:
I built a temporary module against the matching Fedora kernel source
that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
card appeared, and laptop-speaker audio worked. Secure Boot remained
enabled. This strongly supports the ACPI GPIO mapping as the cause.

Suggested fix: Restrict the mapping to devices whose ACPI GPIO
resource layout matches the Yoga Book, rather than applying it to
every RT5677 ACPI device.

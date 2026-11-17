Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926957;
	b=nhnqWDv2jYdhXge6ul3cPQA6T5r3tSb/Cxb3aMpe9b4SXG1tFRaUa+KNNo604K/0oJ3l
	 vqadM6DhO2xzMfi+x+w0SgGRda2fJkZV1XF9hdFWby77vrRRQdE99uRMWAD64NGFAwvU3
	 2Lt9IcjbhyRavEOkHeJ0JBfowlFBL1HSB5cq2VBjc7dmUB1qBSbF7H/PMDv/kfmvC4IWx
	 h6dlzSbkB4DI6GQHBOdjPfHISsHO+dqfW+7PZSRiLnyZotrCN7H+k+oRvoztyzENTQSA+
	 75EhvevJWCV9xzZY0Z9c3VNTnvUVvLSNaDx7epQBoo06zox4KwYU0P/7quKLf2e4i7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
	b=yVf/TDY6eK0wVsYqjRgkVIsPR+Pf/DEZaTn7w2MTLajJ6W1JttP8VWhTA95nU5W7y1du
	 GaDQt25PQTykoJBoHKNanLlZz7dK60Gs8CXHfnz8At/zZmL7h346c45hE9fhZu92juNuw
	 g0+YtsKseA5PQqXzUvwtlAPm4bgyTHPcXYPfZbx5/PGMw3P6rbKNFESn4HwlEJkg62qxF
	 r39+3JlLZatTTBPpghKeCKzcBCK5Y9BF/Ue8a/x1IdTWKDiZMilAj009b0kPD5zpMJ6+b
	 VXkcRKy+Gf5ya/CFmAaYcQvSdRCir8YGNdUAvkKg0XVIOwED+2+o3nnZWsCLP8ka5Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3il7pDn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9C606A323
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 14:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F9C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3il7pDn
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e95bd1c14cso52569425ad.2
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 06:49:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926956; cv=none;
        d=google.com; s=arc-20260327;
        b=ElMLk1Syn9TpB1rkgrqpUE2B692cfocnKq4hhji4sRSQ3cXkvJOXmIZt6BCDCL82s/
         HfGxahn+c1KCpZ4EelCRUy1He5zJMU6wbM8kF3xQf2SlK8W/cG8Aa54jAjg9o4qiLmwF
         TSMFl0C9SUYUSDQS8/frVTweKfYe3Hs9Do0P3ThIeKmbveMcC58+yLQ0XWIYDGamem+2
         mjstzPF45B2vIz0yBzbNO5XWOplb0V7nNJyBPmGc2u18CLARXUKKTdk3m6eP3bQOXIpK
         kcOU659mgn9um24K4/2b8NWq1O+uSU41LVueGWm9LCZnGC4HjpSeANrzrv+FIwJ/R0Us
         YLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
        fh=MXWp5kD6XrMPrmf1S3nO0Ypwls/h5R2FOBsDLvuBRXE=;
        b=PcXjp02YO7wSaaFHkiTp+tVZn5I8gpMxDJDOBIdpIzKec5of/qg5cKgdpME7r+OTk0
         VVXTcV904SlD0gnGLmxVYX8C45CeefJjAj/cWDeTNyT8y3HB3NX+OAh1dmZ9yZ1saJyj
         qt1HjGAgXfx7mdERKR9RNv6Ew9I/IE0uA5P907d296CbjVtR3eB9oTYyJZPXCZhYqwRq
         CpOO3VZMIzEKBiXI8/OeVf0R1b1Oe/MEhunIYI2CRh08Inxa1OvFNQ2PEvH67PYz7G2R
         m1XoD3mwU0XRWj4PUZq9NyshywD9/nxDtgOXR2PH5rad7DQkOCUgIOdFWgMO19zHFiJz
         jkaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794926956; x=1795531756; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
        b=N3il7pDnCIYAvO6oraNjbPKc7F6nVdyx59Y7kcb0lwmyLJ4Hy3ESafvRUQfqKfmCId
         oDtyzBZUX9uNLOBBG7V8rP+qKtS+aGbyvkIjRRvKBtUH1ADrXVZmBAktFZne7P/Dv/6g
         /B6vVTMoZ3rkhta6nmq2hUpOD5OUYTMWN958wCfdqb6pG9WAz9gj90fbcHHBTH25PZeV
         WYHr5CRi2e7Cb4mKUmJPd5jIx2Mvr3RpHz5/AqtouiXSsFMD0xpBseQXRANgZUsZvTSA
         dTdNYJElV25px3q7LLv9hrqsgbCV6L/s7YI4NC2S9gum0MlFnQRJXd1Y+ZpMG5H4QzUY
         Fomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926956; x=1795531756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVB/e4UrF2Lv+S1TNzxhho32YKzKrH5oMmhz+C4qnUw=;
        b=ZCqRW74SiD76R6OEp9pETtGgFEzzSNF9X67goLM/MNuOzqWSrU2UEmQYclDMEbC1TY
         +h3GIeE/hWoqMcaIYoCANDuAfPWY2vCKEsYi/RbvLW4wx+WkHFhqyyeK4J9SBjMcM13X
         VyEMxBjkBaueJztiYw+qSsY+ChsbQDVoYrPYRpsGEBla0LGEcJeP6mgCN2rn0Izur4jj
         9O5ob0UHPKKFes3vO8Xm1GCVyb1BcQo4myFqNjDEaHpdY3M5Rh6mcSCA4zvwkT7tWLS2
         cLSMd45oJrbA0GvcQfLhPKMZJ5P27xiAtoS9hqE4dzeP0Gmkg+a9je8E/0ko6aClksoH
         Hcjg==
X-Forwarded-Encrypted: i=1; AL+hErFVkSK38u3jDd8mvV9MWgPOFwzwpShhDAZNwC+eb1xqQk26xY5ocBuoXz4CvWcNAEieWcRHhca8Ku3lAQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z84n0WKCHMMlTm2+sotHiRE+beUlYIb4Z9v0n6k0KACYp9Gp2eN
	bdz1dCO2HjBez4kj1WYWniUnnQztB/TmemJBd/WuLPCpGz+cuAfDLKABLHOrQN4KKq1ni18L1CJ
	UVC8ejdNzjGkfpIZJJmBhBsLe+b3k6fI=
X-Gm-Gg: AZFdTZdmjV2pUjvF9owNyO7RpBipNiRQ/lB7M/Yl4kyQwgL0BmqSYfVaj4DsXA+9QfI
	OYn81IUGd8tERDvIPfgoz5IiPoh+k8ax/NDQbUJ0/2GumCSVHhUUCQIoivU8HT8dpYrHBHSM9Dn
	0p+X24iDGlly2vhM+sxeWGR5hXQZx+3uhGd3vnu40vGaLkbdufx04v8FKijyRtd/fDJtWwev4Ga
	hB1QEOhre5awi9unGOqAqA+LjFAwUGHv8H1Ag46Rv/7hRDzwqvHyZp1MB1JW5bJN17ToqO7lSFJ
	jlD8KWYTdyeQWJm5VAAdFY1m1S0eI5DElZtnnJXq9w+NosX3Ipuh7zIMLaM+tS5ZDQ4U2Xem5QU
	GjqAyZ+fZdAvEA8Eus+M2cihyCILJVirTwtgkvA==
X-Received: by 2002:a17:903:15c8:b0:2ed:8bce:aa38 with SMTP id
 d9443c01a7336-2ee0d9f2610mr140026295ad.3.1794926955946; Tue, 17 Nov 2026
 06:49:15 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
 <d0219acc-0e2d-4bcd-b303-e7edaa236eec@linux.dev>
In-Reply-To: <d0219acc-0e2d-4bcd-b303-e7edaa236eec@linux.dev>
From: Ted Vera <tedvera@gmail.com>
Date: Tue, 17 Nov 2026 07:48:39 -0700
X-Gm-Features: AclHuK_37o3TJGBoLe9hp68xhk-6PXau-GH5p0zcyWlicUZlj4wuH7g4qBB6O7I
Message-ID: <CAFd_G9jmveC3oHQbfKOVaRK=6k1r8iygG8Y9s1XTuHC6ABtCeg@mail.gmail.com>
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning, Pierre-Loiuis,
Not a prototype, it is the commercial release.
Thanks,
Ted

On Tue, Nov 17, 2026 at 1:12=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 11/16/26 22:24, Ted Vera wrote:
> > Summary:
> > On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> > kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> > with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> > appears in devices_deferred, no RT5677 ALSA card is registered, and
> > only HDMI audio is available.
> >
> > The driver=E2=80=99s ACPI GPIO mapping added by commit 0cc00de3dd5b map=
s GPIO
> > resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> > device. Samus=E2=80=99s DSDT uses those resources for codec GPIOs (jack=
 detect
> > and mic-present), not Yoga Book-style external reset and power GPIOs.
> > The driver requests the mapped GPIOs before registering the codec=E2=80=
=99s
> > GPIO chip, which appears to cause the deferred-probe loop.
> >
> > Test and result:
> > I built a temporary module against the matching Fedora kernel source
> > that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> > that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> > card appeared, and laptop-speaker audio worked. Secure Boot remained
> > enabled. This strongly supports the ACPI GPIO mapping as the cause.
> >
> > Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> > resource layout matches the Yoga Book, rather than applying it to
> > every RT5677 ACPI device.
>
> Humm, it's a 2015 device that I used in the past without issues. It was
> one of the early SOF devices... See commit bcb43fd.
> Is this a commercial version or an early prototype? I don't recall what
> EVT2 stands for in Chromebooks.
> Also adding Andy in Cc:, he was the one who suggested the GPIO fixes.
>

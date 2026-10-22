Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792698082;
	b=Vqv7NElaZyP4URopJDk0LT6uCkjfpKMS2jUVzsFAmwaXG+6JBrTR56RD19E+VkNbe4r5
	 uhqg1baM7Qn+D5W4DXu4HV0SH7fmBTMSU4ZnBcvoPCV4gxG/eYxLDtV6uT8kqGGKakvm2
	 LuIUnXa9S4oU4SC0DInI9aK890jh18v9f7P/MvUOY4VmL4+aoVaySbnM/TJVmPFmcdM1A
	 6HsRr+EvCaZHvFLwtxRPYIJrN8oM8L5tD1jP1/Pp54EOccP4r71DHDR33nbIWadxFjt6E
	 jC9OTa9s7uQicxtp7qhJkwDn5WtsaGzUc4ggl6vkC0Sl8Q23raqLtEU1GsfRAj8vYIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
	b=r2MQwPzbzH8nvTdEMZOgzXyytynyhuIv0ouUr+XHdOFy2n5mlF7x96YW3/MDNuVHjzw6
	 VQkMqtEUsqzCPSqMBt276oLt0RFGhOMlgdEzINfv1wAz8sdN66ODXj+3M0IKKVbiukSav
	 +K/KcjDQOIBbYEDDtIJmk4A6w63ri5JJZaXJ0ZUqSC8bSHRn708LdoVcd0HjKyazPTcSS
	 JmZ2uFNbKoiqBFQtdl1BRQTptwe6KbmgQNC1t9U+9A/oi1bFJAMhs1aKyx1cTzys3j0KA
	 uYDIrgtq8Q7YuoEC6rDdloC3kMfuNGdU2b9cUuB60t6n7wu+t0jhbee4YwwQbzzlWHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dvv7lzO+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC86606A326
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 19:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC86606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dvv7lzO+
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e7ad9f78dso14933185a.1
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 12:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792698080; cv=none;
        d=google.com; s=arc-20260327;
        b=Fg3YmVCXhUElr1kt231Ky7Jw5XPT7yKiuypwLSuGk+RUVl493n+0DRqpTxiXNToGt/
         TsTDniv7w7U4OamA7s0Zp06HHkoVu500sD5+a6xMZbEuSK4H0AEJewnLeBSmHeh+l5rI
         pqVe9GXbaaUIM/0CfpqsHUhscq1pdpnT7UjEoMuNpQ+ADGdMatVLlxoEu7YtAdmUnkco
         W6SmUJumpjIsD7Q2sFq5Aqye7X26sfPJlQTo0ezydxRHe6Bf1tIukXZqCqGlJpK8Cihi
         ISqamREfKlAOnOhtzTEHh8VYLXm2QfY8nT1s0btMS2bqriQ6+RseB8JdHfExkRKBLncw
         4QFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
        fh=sLpo7ZMiskxkBSn9CMxq1yJOgwvJ7TvsnV//q32r/6U=;
        b=DUzXtAlaU8dTYNwsUBBdxx5dtJhACeaeqwAoFNkcDE3SkN83fniN8GLauIJnZazY5Z
         +grhDHKwGnwNf+RvZKpcSr+l5RAEAgf8q/gxmawr/JBgAfjld2cNlE5pajX7wyoMvAwM
         NKLUcQdyIfEDi8KPbx/Am0htvOUtm1ZZWN/hQYqGIKEM59GBsytNAnxUwQKaqoOCf8bF
         coO4fddWZ+k9Ct+T99LGUVMnz60ASiPRcsUVooWoSXUEET67TYtFlAueS61iZpIYoBax
         rBYZcuptCYzAXdDSl/Dl8kIQ3LX9lJQGzTO8FvIkZILYd+LIUdscb3K041l82i9rdasf
         VJhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698080; x=1793302880; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
        b=dvv7lzO+I01CUgO+bdlm0um+kU085FjJCW81D+vY3H+PLYb8zY/Bh2YP3aFPan4+NJ
         89og/n36AjIhLOuiKveLuE54xnsc5dGRgkKeb9OE/9hyU/NklNdikQjB2v6/Zi0hzXW1
         s+kz+J0PmZ/rnSsPZ/HHtfUDsYrf6nZb3GGcOfCYZSauqKvU8o5LzH9o39Hfz7Xdmgsq
         Kx94fHNtlj0jtLtbckrKuqls18IhlH6tDd1ttzAXbSNOuPt9oBx47E+zTwSB1vhNTkM/
         q504AwTvJ07pmh8ifsb7sJ91GP6/tijYChiHDMfEooFQN6S9OQeq1QFAcMJkDUJ21X3B
         Zofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698080; x=1793302880;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/uPf7O7mV3UVcLoPpg1h7SlQrq05lwr9QUgDlZZcEx4=;
        b=xcqjhJS382MFT8X7073sNtTw0Wtj4nKDk4BDBgglFxD7XClxlFI+Xyy7M7ylWw1Dul
         pPIecJudhDDfaDDkIZCNBqvEEUEwYfcsCyzd9WB6fTAzJA2jvP3CuW0zW91UGEdFRi2g
         DAMP2FS1j3rs/GgXUpbczbvJcrEwMLgO8VLoRdCDO22nJ4YgEl7EXM5lJUIVByndex9K
         48exF40FcanzmBz8pu0n3ycDf6WwW4KBHnD0QvcN0p8Yequpf8TeYEd0OzFx20YRkZT5
         IlgaD9Yk6cYoXNX76/I9kNG1/7bWL6svhEC+GLqjimuuQ7oF1arDxlTnqUfwS6PzulKS
         3mlw==
X-Forwarded-Encrypted: i=1; AKwUvBx4sGIbgF/H5YPMgzQmR44y29apzNE7Vzny7dMi6fq0rtA+ZtK92zjzzdzJUn+stbzQm9yf+OLkL1Q1qQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKu1nCXCkcXSJ0HG0HrIu2i7vr9r3zK7ao7ZPfBiugQPLJst+sy
	WjmVso10h2Zt/ymPoj1zWsJVj2vdhs2zloAdAov3tl2NOmIwrQEdX37gf7lHhwUpLqZbgRcnAfW
	uV6556N4tnOX00gQsxrnqFomPMRbK7jQ=
X-Gm-Gg: AYBFou3PZ58q379lNNzUbTxKK++cTdhUGJ/B7Q+hmmgszkTqkniTacmvrfutejO6XT7
	YCiiL330jqtmOnY5r4sltrzZO+ddrkwuN3eEXcFW8xe6r6Q3m8rKY05KSRGZ2bV4F+rHGOMKtw+
	MsKW65ilIW3BfYZ6GLzFkUBRlnIL6HsGHusbG+YdULjF4NMYQJ2NlvUNaQqUe8U8r4eRgU4osku
	3g6HEyWNY6G/U4ekCZr21b/sK/MWqKrtzwcUjVlvDf/M4nCOYG5xVAfMmi6lFONHi0IUuRukYzJ
	7ZfqmDHDu/cXOkWcYrW+vgnxD6d04z9XkIQX1vYbWEJxgExLTQpegr+pM3v9/mxgDJ9Ny72/e2p
	9UkEiwTJFz/0zep6Jlhjtgjn/GOV6IT8nQfzS8pQZZUDzsMM6AfPgY8MKbdgXVDJn4HCQenHxit
	475I3A5b08wY6Nb+I=
X-Received: by 2002:a05:620a:7001:b0:939:b057:daf2 with SMTP id
 af79cd13be357-93f6f7fef1amr89402385a.45.1792698080536; Thu, 22 Oct 2026
 12:41:20 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022033638.32460-1-thatsme.saurav@gmail.com> <16d56f7b-6295-4ac8-b0c9-8b490dd0d582@leemhuis.info>
In-Reply-To: <16d56f7b-6295-4ac8-b0c9-8b490dd0d582@leemhuis.info>
From: saurav kumar <thatsme.saurav@gmail.com>
Date: Thu, 22 Oct 2026 15:41:08 -0400
X-Gm-Features: AclHuK8DakwZw0LIt6ofHcRsAHS0pyqF6XCOnFZsjF1b3JyRhz1B6T7MRSrjzRc
Message-ID: <CAHmbrkmPc5+NrKUn-Bfi6_U4nxYNsUZe0xFNackUS3v2rbWJjQ@mail.gmail.com>
Subject: Re: [REGRESSION] i2c: qcom-geni: HID keyboard fails reset on x1e80100
 (Yoga Slim 7x) since 7.2.9
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Tested 8cb5c17be3a2 ("i2c: qcom-geni: Restore the source-clock
selection policy") on top of 7.2.11 on the Lenovo Yoga Slim 7x
(x1e80100); internal keyboard works again after reboot.

Tested-by: Saurav <thatsme.saurav@gmail.com>

#regzbot fix: 8cb5c17be3a2

On Thu, 22 Oct 2026 at 01:44, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/22/26 05:36, Saurav wrote:
> > Since 7.2.9, the internal keyboard on the Lenovo Yoga Slim 7x
> > (x1e80100) no longer works. 7.2.8 is fine. 7.2.11 still ships the
> > same i2c-qcom-geni.c as 7.2.9, so I expect it is affected too.
> >
> > The keyboard is a HID-over-I2C device on i2c0 (i2c@b80000, 400 kHz),
> > address 0x3a, VID:PID 048D:8987, IRQ tlmm 67. On 7.2.9 it fails with:
> >
> >   i2c_hid_of 1-003a: device did not ack reset within 1000 ms
>
> Searching for this error msg on lore found a change that fixes such an
> error on Lenovo Yoga Slim 7x Gen 11: 39e8e085710a2d ("HID: i2c-hid: add
> reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard")
>
> Could you try if it helps? The stable team plans to pick this up for
> 6.18 already, so your feedback might speed things up (and get this into
> 7.2 before it's EOL, too):
>
> https://lore.kernel.org/all/20261019135441.1420968-216-sashal@kernel.org/
>
> Ciao, Thorsten
> > The touchpad on the same bus (0x2c, hid-descr-addr 0x20) keeps
> > working. A USB keyboard works as normal.
> >
> > If I build 7.2.9 with drivers/i2c/busses/i2c-qcom-geni.c taken from
> > 7.2.8 and change nothing else, the keyboard works again. So the
> > regression is in that file.
> >
> > Five commits touched that file between v7.2.8 and v7.2.9:
> >
> >   82339215fc00 i2c: qcom-geni: release DMA channels on probe error
> >                (upstream 268aacb2e2a5)
> >   139efdb3ee6e i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL
> >                (upstream cb97bf3d4f91)
> >   6c3420d6ba34 i2c: qcom-geni: Store of_device_id data in driver private struct
> >                (upstream 692e0c84db5f, Stable-dep-of cb97bf3d4f91)
> >   4edab037132b i2c: qcom-geni: Move resource initialization to separate function
> >                (upstream ed4b34033db2, Stable-dep-of cb97bf3d4f91)
> >   fb54df3645d8 i2c: qcom-geni: Isolate serial engine setup
> >                (upstream d8d3bb127ad1, Stable-dep-of cb97bf3d4f91)
> >
> > I have not bisected within this series. My main suspect is
> > cb97bf3d4f91.
> >
> > #regzbot introduced: cb97bf3d4f91
> >
> > 7.2.8 always wrote 0 to SE_GENI_CLK_SEL in qcom_geni_i2c_conf().
> > With cb97bf3d4f91, geni_i2c_clk_map_idx() uses
> > geni_se_clk_freq_match() to find the index for 32 MHz or 19.2 MHz,
> > stores it in clk_idx, and qcom_geni_i2c_conf() writes that index to
> > SE_GENI_CLK_SEL.
> >
> > On x1e80100 the QUP SE clocks are registered as DFS RCGs
> > (gcc_dfs_clocks[] in gcc-x1e80100.c). geni_se_clk_tbl_get() builds
> > its table from clk_round_rate(), so the table comes out in ascending
> > rate order. I suspect that index does not always match the hardware
> > DFS perf level that firmware set up on this machine, where index 0
> > happened to be correct. If so, the engine runs from a different
> > source clock than the SCL counters were computed for. I have not
> > confirmed this yet. So far I have only shown that the 7.2.8 file
> > fixes it.
> >
> > I have not tested mainline yet.
> >
> > System:
> >   Machine:  Lenovo Yoga Slim 7 14Q8X9 (83ED)
> >   SoC:      Snapdragon X Elite, x1e80100
> >   BIOS:     NHCN62WW
> >   DT:       x1e80100-lenovo-yoga-slim7x.dtb (in-tree)
> >   Kernel:   gentoo-sources 7.2.9 (genpatches do not touch this driver)
> >   Good:     7.2.8
> >   Bad:      7.2.9
> >
> > I can test patches or run more debugging if useful.
> >
> > Thanks,
> > Saurav
> >
> > --
> > Drafted by Claude.
>

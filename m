Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F203FA5C8
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965858; cv=pass; b=UjmvZV8yWIOQUKwGvegfY2fL3SAGPIuOU9/uVuxDKLbONifGorqP2aEf+t0zdb1aDd4vVk1mkSV2liEr9NQ0/7XERJwx5dpr/Rwo3vhW9DyjXVMxOs7WiR+EVnfJ0r/PYWdPaJncFsnUPJdjUXraHtQxw3AxKw2hDHcL06MHH5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965858; c=relaxed/simple;
	bh=pjqPtyWtlCb8NZsTEaCgUsbU2sAf8qLZetVe6NY+2zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlnU+JgB39c2pGBf53rY8DOXCBt7PTtKt4xClatDEfOAFVxP/0DxUvVPPmJiy5Y4muse4ca0IW109A9UW4nADCPqx+zNaDbJleMu+PjDL3g6M9tQGyRMW8vSJ9pqLKXVa6fwgdRp/rbUFMwtoOR9h5Y59R949Q76zVhjCalJduA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKLPbV+m; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKLPbV+m"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so4079745a12.2
        for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 04:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786965855; cv=none;
        d=google.com; s=arc-20260327;
        b=UsbYAkKcHX/w28/MRQHoafcB9iynxSBXz+OxFVn4WsTCW0wZJOWcjp2s5/6HbTBCrE
         pUJDPnG1wzCYtSg75NeiccSIqbhKHSkRRROSmt5vQ7f8f8wYlBtABj/REOsOdLZKLeU0
         U3qukN5Wak3Q7SeoIs+dXZvIziFGeH7kORgPae+JIzKnWOHD50guPiutX7glf7vX2tT1
         RFGiKN6gMNTprAP0U66J1w0CcOU4NRZjJPs0EaqCRlaAOHhtW1Hnivz5LJgaicVIymYU
         UZrFuEAc0t9RdW9s8WzXxzHRk0ETwDCj7+Y9V1IsI6+iIW43PLdzqEqt8QE2BPcKm7iG
         LG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjqPtyWtlCb8NZsTEaCgUsbU2sAf8qLZetVe6NY+2zE=;
        fh=mmE1oMgAcjCUTCXXze8pxCHdUPGCkG5crARdoL6+AGY=;
        b=EQG/NzPX3xkXj1r9oBhlJJD79/myFsmN4lbKEHiXgwh+1QBeB5iMttBINtYd5tpxJw
         /wpJmILeRELMF8GFjwIbwOvvO5owdbNn6MQ/pLuGqmjRLxLAXk4WwyXmOSqYc/IwAbtc
         rv3PGGXAO3EJb789diXsT/yMWRVHPGN6kBx83HEpD7+oRJJDqS3A1gZOlXmNQR5xCqz4
         I1pNa0YtYS8vbAUlCxOHQ+rnK2j8BcSepl9IJ/V1ttdgowpccNkGKSNUJCXZodxL2GNz
         5xn5Qifjhd9iDIzXr2GUHK6/NGhDDfs5lSJnpCZqIiJ8KeVqpP362zQwQRiy7yPs8X2f
         fXEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786965855; x=1787570655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjqPtyWtlCb8NZsTEaCgUsbU2sAf8qLZetVe6NY+2zE=;
        b=UKLPbV+mj+HOp0rxfaPsDrs0ZOXKixuS5chlCXLzagIaBDM6Uria/y2wPHhoQW/7Nd
         9pYmdoxQ/qOYOzBkLPWXw5qa+CU6RmefiokIkWUvgotXmAir5cn90KLaghd6U7Yhw3xv
         xJ779tTAZ2O6t+noSyn/dh7Em9HfGQ1lpIjMr7I4k76R8MT4cWPc8OUUi9t0OIU7G8sq
         JeefVrgI3An4f6zkMDgLB82tCDIgA0JmLF9L/ydpRNMfP23chEW1ZjW6kIbwEOyjupS8
         tU9EM1bq5tZr/xHXTJBhAFvqncTqpcxVTXIVseD6CAxNhK5mnvgoZLINz4qNdsXj2ZFV
         +mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965855; x=1787570655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjqPtyWtlCb8NZsTEaCgUsbU2sAf8qLZetVe6NY+2zE=;
        b=dZ7wbZXUYj1XBliSpi85O7FjTXrVPtNmV8Pp6XjU7aHZE8WM44zuL81HDrbP66Ad8/
         3GxyJ27opnnQn4z0viOU0Iv/VQwEZ1hDQRt0mraCFOWCbzo4vOnYJ0SLadlwKrHr0U9h
         SDz6W9DslLSAGIqMiOh+/A3xQ0RCNMaXszbdFbs5sUQaI7661/WHuuvWrE17l/oqBySE
         /R80cAjhtyZW2nKsnP3vDlQBOFYGS+7zg25x7mW4O8girwghSPI9U+3Jm2azm1IT41tO
         JM7poffR52HIgJmgcg4ebbcu2S73ucLW22TZ1RjC9JYqdulGrxWjF3uyyxgmdSqdYwJR
         83cw==
X-Forwarded-Encrypted: i=1; AHgh+RpgqBgS3boZhp6MCAwjaD2OpHYfvb1m/A4r7vpCIztDFm8I2bMg0YR6/ahLQQEg3i0c6pAr/AjBbcZgNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQS0uJlvTi4SaUDntNE/a9p1liQwhbMZ7eK99BcMYjTB7P2dEJ
	8fB7w5+gYrpaRbn3yOM6U5/WTV4JzKAwDH/BZRiJWUAWziCTqaaYTWJvCdkbSOEAHG453gEVL1S
	cXCtFjXSU8DCdcRQGwrdrojbGnFoF
X-Gm-Gg: AR+sD12DGq/M3SZwm4cE9NeaeIAj/9YO3hFdH9SP1DCspWDF/1J/qzJAJzmU1bnWyzM
	ep9B8PpXcFT2dsqiKPkW0zAl4/lxcw/kNYZZSo5HXOPHGTMvCY6Rsj2F3S+U/8hex0gIjEWq34/
	MOTFVlcRtx9stlANQFTX8pM+GrqY4QlMR/oiyz+DjdN0PqDsa54/CdatkK2xCc4x4+HsITmVNA+
	TRpaDM4OHZ7tawM0X1ut141JIeUCiERG/QH3KswMvHnsgVH8RW7B4S98WZ/q9xvNYnevOSnYYfK
	FnW8tFFuLqcK3MMqyVDqk3UnjmC7M6m2UevfUZWdyNaGcr2z0IfMfz3PWOvE18WAaO8qfoECH3T
	9UUWhBr2MYvQkeWEazzZHAQza6I3NNeay
X-Received: by 2002:a17:907:94d2:b0:c19:45df:1856 with SMTP id
 a640c23a62f3a-c212a11a823mr1135761866b.17.1786965853968; Mon, 17 Aug 2026
 04:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718054330.8975-2-hardikprakash.official@gmail.com>
 <amhodWpAI3K6aeBH@zenone.zhora.eu> <b4a4eadb-282f-464c-843a-19d415a34d0c@leemhuis.info>
 <CANTFpSW+w1GZMbLXszuqZFCZjeVJfFG2bc1vJad+OMzsy-CPCg@mail.gmail.com>
 <aneQvMN_Zet2b62n@ashevche-desk.local> <b5b95476-636f-40b1-8575-47918169b7bb@leemhuis.info>
 <CANTFpSWzV9tzMwc2cURCQBhpZmrv1SsZqnwBEu0jt=ZQWfvWgQ@mail.gmail.com>
 <1a209e14-05c6-4796-a8fc-d0c3a776520d@leemhuis.info> <CANTFpSWnTjoTS8hBOvVM_w3pWHyOiBhch_GXe_mG-d56WeF-0w@mail.gmail.com>
 <5a5f7f58-b35b-407f-a5e5-293a88cafcc0@leemhuis.info> <CANTFpSWTkwmb3F9UnZmeaLizH-cC6evXD=kd1eNwJWkCfyj8DQ@mail.gmail.com>
 <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info> <CANTFpSWhqkw4735EFyQ4XoSEiqsgCKt4jTxH4SDO-m3=ybwccw@mail.gmail.com>
 <444caa3c-01ae-4516-b63a-576e095fef94@amd.com> <9095d7c8-92fe-4163-98f8-a53bbcefd6cb@leemhuis.info>
 <CANTFpSV9jguMzmfN7STb7XANYdn8i34bVmpT=0NdJ_o=3_Y1CQ@mail.gmail.com>
 <1bca212d-fe9c-4666-8ac1-743f8c9ef1c5@oss.qualcomm.com> <7c410f84-86f2-48e7-bee9-4c5c038bd115@leemhuis.info>
In-Reply-To: <7c410f84-86f2-48e7-bee9-4c5c038bd115@leemhuis.info>
From: =?UTF-8?B?VGnhur9uIMSQ4bqhdCBUcuG6p24=?= <trantiendat29042005@gmail.com>
Date: Mon, 17 Aug 2026 18:24:02 +0700
X-Gm-Features: AcwNN1U_DY-Jh0bRZciqKsUnmNuaDADygrkxxJJBvtyvTrqpPw_tyLNImJDo6Hw
Message-ID: <CAG=RFTXPTJsTf=cGRi7u6OYn1DzWHz5d-rwdZLu0pUg2AezAWw@mail.gmail.com>
Subject: Re: i2c designware change broke touchpad of a thinkpad
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: johannes.goede@oss.qualcomm.com, 
	Hardik Prakash <hardikprakash.official@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org, nathan@kernel.org, 
	chaitanya.kumar.borah@intel.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the detailed background, Thorsten and Hans.

Confirming I'm now on this thread. For reference, the bug I reported
(deferred probe on both i2c_designware.0 and .1, ELAN0307 touchpad
never coming up) is tracked here:
https://bugzilla.kernel.org/show_bug.cgi?id=3D221889

With Linus's revert (d5b95e612cde) applied on top of 7.2 final, my
system is working correctly again =E2=80=94 both i2c_designware controllers
probe successfully (~2.80s), the touchpad registers via hid-multitouch,
and /sys/kernel/debug/devices_deferred is empty.

Happy to test Hardik's upcoming i2c-hid-core patch (the IRQ-request-
before-connectivity-check approach Hans described) on this hardware
once it's ready, and report back whether it resolves the original
issue without reintroducing the deferred-probe regression.

Let me know when there's something to test.

Best regards,
Tran Tien Dat


V=C3=A0o Th=E1=BB=A9 2, 17 thg 8, 2026 va=CC=80o lu=CC=81c 18:12 Thorsten L=
eemhuis
<regressions@leemhuis.info> =C4=91=C3=A3 vi=E1=BA=BFt:
>
> On 8/17/26 11:51, johannes.goede@oss.qualcomm.com wrote:
> > On 14-Aug-26 12:09 PM, Hardik Prakash wrote:
> >> On Wed, 13 Aug 2026, Thorsten Leemhuis wrote:
> >>> Hardik, could you submit a revert to the lists? And then I'll provide=
 my
> >>> Tested-by and ask Linus to directly pick this up?
> >>
> >> Sent: https://lore.kernel.org/all/20260814100719.9548-1-hardikprakash.=
official@gmail.com/
> >>
> >> Verified on my end that it builds clean, boots clean, and correctly
> >> restores the original Yoga 7 race (expected tradeoff) without
> >> introducing anything else.
>
> Hans, thx for looking into this.
> > Thank you for submitting a revert for this. Note it looks like Torvalds=
 himself
> > beat you to it and already reverted this for 7.2 final :)
>
> Yeah, I pointed Linus to this and a few others issues and then he
> reverted the change directly:
> https://lore.kernel.org/all/628bbf10-29f1-4e9e-b23b-4c47657433b9@leemhuis=
.info/
>
> > I hit another problem caused by this now reverted change, where the PMI=
C
> > i2c bus would not show up on many Intel BYT/CHT devices. I wrote a fix =
for
> > this (attached) on top of the now reverted commit.
>
> FWIW, meanwhile "Tran Tien Dat" (now CCed) with -next ran into a problem
> on a MSI Modern 14 H D13MG that the revert seems to have resolved. But
> the symptoms were different: the two DesignWare I2C controllers in that
> machine apparently deferred probe forever and are never retried:
>
> 16.429266 platform i2c_designware.1: deferred probe pending: (reason
> unknown)
> 16.429286 platform i2c_designware.0: deferred probe pending: (reason
> unknown)
>
> For details, see: https://bugzilla.kernel.org/show_bug.cgi?id=3D221889
>
> Ciao, Thorsten
>
> > I think my fix might also have helped for the broken touchpad issue fro=
m this
> > thread, but I believe there is a better way to fix all this, so IMHO it=
 is
> > good that this was reverted.
> >
> > If I understand things correctly the problem the reverted fix was tryin=
g
> > to fix is i2c-transfer errors happening before the GPIO controller driv=
er
> > is ready.
> >
> > The i2c-core will not initiate transfers itself, so the problem is that
> > the i2c-hid driver is initiating transfers before the GPIO controller
> > is setup.
> >
> > The i2c-hid driver does actually request the interrupt itself, so we ca=
n
> > simply wait for that to succeed inside the i2c-hid code. ATM the i2c-hi=
d
> > code starts with an i2c-connectivity check because some ACPI tables lis=
t
> > non existing I2C-HID devices.
> >
> > But we could make the i2c-hid driver start with first requesting its IR=
Q
> > and if that fails bail (with -EPROBE_DEFER) before doing any i2c-transf=
ers.
> >
> > And then do the i2c-connectivity test after requesting the IRQ. So basi=
cally
> > swap the order of i2c-connectivity test vs IRQ requesting.
> >
> > The IRQ requesting should then use the IRQF_NO_AUTOEN flag to keep the =
IRQ
> > disabled at first and explicitly enable it later when the rest of the d=
river
> > setup is done.
> >
> > Hardik, can you take a shot at coding up the suggested i2c-hid(-core) c=
hanges
> > and test to see if this fixes the original Yoga 7 race in a cleaner man=
ner ?
> >
> > Regards,
> >
> > Hans
> >
>

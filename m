Received: from mail110.out.titan.email (mail110.out.titan.email [44.217.104.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C972F99B8
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.217.104.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783753887; cv=none; b=dZCZWx4mgX+Rb1WTsPYVtODoCLAhcD2ZArCEioqL7ovI70kJit3hCqdXz1uQF0fhq8H0GSxHFBha1+JF7WMv3MdcaqLFAA/iXeDpmV8bkuiodT27UqlfwgFKkvgC3XHYfSiw0o2U6MeJ4WdW35o7ujbR/F/BiWuEtoE+tfwHR/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783753887; c=relaxed/simple;
	bh=xa4WMx9BfQAH5JqDsv4CCAoB7Hwb0RCrNcYezqbIitA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIL3A0hopVELoz9kt+nhIIhrYfaIHsKvyU8G1YRO1n5XNfLXWU8crIKF/rn+U3U2SzwGDm/dO66+hFrfFu0CjZYyjBi+suN//MG8A3H/n2cBeLC+lvm6dbqo7Jjl0vRV2VAxChmq08vjrh0svpT1h+/SAYySY1TNncStERl7nbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudharilaw.com; spf=pass smtp.mailfrom=chaudharilaw.com; dkim=pass (1024-bit key) header.d=chaudharilaw.com header.i=@chaudharilaw.com header.b=BnMgMdku; arc=none smtp.client-ip=44.217.104.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chaudharilaw.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaudharilaw.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaudharilaw.com header.i=@chaudharilaw.com header.b="BnMgMdku"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4gy0HB66xSz4vyN
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:11:18 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..rIRy_x0_4L00IlV8.2ldSn5QWVB4JWeyCbFXdt0430askwDS_yBZEpjyfDzVOOd0lnelZ7EcdVVpFnlpX1D8qedUjPgqHMpKjPSZMwBrTgvPh_Sk9K7aKgdgUiGhdj8I.TKJmlmaBmqr4OIwAhos2lA
DKIM-Signature: a=rsa-sha256; bh=QRIvUoVIkIR2VN6nZqA0C6GyNXLSigHelcTzhQANptk=;
	c=relaxed/relaxed; d=chaudharilaw.com;
	h=mime-version:references:from:date:to:cc:in-reply-to:message-id:subject:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1783753878; v=1;
	b=BnMgMdkutYFISUw06fz8bRNuOd1AE2iKz8su8wfAsisANg6/lP+/V4gTAaVf47OC2yY+4nB5
	w0uf4AEsy6aqfHKCNnzKQ/DKN2B+9izYUusGdSoDfKQ1NPe4ULbV5S1IQealBLpM2aYgNpocjZg
	tgAJL28IZts12JdfnBPeowFE=
X-AuthUser: papool@chaudharilaw.com
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4gy0HB4YmMz4vyR
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:11:18 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-667d8f7dc59so253503d50.1
        for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 00:11:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yywc0HjL1x4iuwDZcfXWa1AmMyP7ymHMpkfIV6CTGBCV2mmeaF8
	U6uY0bpfMTHNlPSegXrK9MIC+hq3XX5JoXUdnW0DW6u3ENa8y2EaOaRUobGXRu43R/nUxTdwTBC
	BJCSJb0KNRBAM5+ISD80pmjyY2mv8IlI=
X-Received: by 2002:a05:690c:d8e:b0:81e:d40:c054 with SMTP id
 00721157ae682-81e901ad8b2mr14259117b3.60.1783753878276; Sat, 11 Jul 2026
 00:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
 <2026070936-geologist-yapping-31f4@gregkh> <CALcz8n6VtL5D20WCJEsiBRDRKOE6GsF+YPCc+XuS2xr-mqnSTg@mail.gmail.com>
 <2026071109-armchair-civil-7b62@gregkh>
In-Reply-To: <2026071109-armchair-civil-7b62@gregkh>
Feedback-ID: :Papool@chaudharilaw.com:chaudharilaw.com:flockmailId
From: Papool Chaudhari <Papool@chaudharilaw.com>
Date: Sat, 11 Jul 2026 01:11:06 -0600
X-Gmail-Original-Message-ID: <CALcz8n4XCt8GK0X=JTDOkMn32Z73HpHKRNaRCdSf=mzr3+r27A@mail.gmail.com>
X-Gm-Features: AUfX_mzbZhDNzY69xxn4EEj0BLo7Y5eHhiMNfi1X05QFhKd0sdJA6rMY1d44PeA
Message-ID: <CALcz8n4XCt8GK0X=JTDOkMn32Z73HpHKRNaRCdSf=mzr3+r27A@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_2017_Pixelbook_backlight_control_do?=
	=?UTF-8?Q?esn=E2=80=99t_work_with_7=2E1_kernel?=
To: Greg KH <gregkh@linuxfoundation.org>
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1783753878652739466.27910.6576920751286053414@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=IOwyzAvG c=1 sm=1 tr=0 ts=6a51ec96
	a=tbj0bKezJ46NowarHtOQqQ==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
	a=CEWIc4RMnpUA:10 a=5KLPUuaC_9wA:10 a=LlsA0amxAAAA:8 a=ag1SF4gXAAAA:8
	a=VwQbUJbxAAAA:8 a=mPEHRz-_w2sDqkBA1IMA:9 a=QEXdDO2ut3YA:10
	a=eWfnMeD-lb2Coh31ngwQ:22 a=Yupwre4RP9_Eg_Bd0iYG:22
	a=7kaH8xG_SJH6XRsnliyG:22

I tried reverting commit b3793af3277f65d256d67f9949e760b434ff66dd on
top of v7.1, but the resulting kernel completely hangs at 'Loading
initial ramdisk'. Even when adding 'nomodeset' via GRUB, the crash
happens so early that no kernel text or console output is ever
printed. It appears this Intel THC merge cannot be cleanly isolated or
reverted on v7.1 without causing an immediate early boot failure on
this hardware.

Papool S. Chaudhari
PRA Law
14011 Pebble Hills Blvd. Ste 105
PMB #1003
El Paso, Texas 79938
(214) 702-1150
Papool@ChaudhariLaw.com


On Fri, Jul 10, 2026 at 11:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, Jul 10, 2026 at 11:09:34PM -0600, Papool Chaudhari wrote:
> > Greg,
> >
> > I did git bisect and this is the offending commit:
> >
> > b3793af3277f65d256d67f9949e760b434ff66dd is the first 'bad' commit
> > commit b3793af3277f65d256d67f9949e760b434ff66dd
> > Merge: 51cc1c427461 88919bedabb8
> > Author: Jiri Kosina <jikos@kernel.org>
> > Date: Thu Apr 16 21:08:14 2026 +0200
> >
> >    Merge branch 'for-7.1/intel-thc' into for-linus
> >
> >    - power management improvements to intel-thc-hid driver (Even Xu)
> >
> > drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 16
> > ++++++++++------
> > drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 47
> > +++++++++++++++++++++++++++++++++++++++++++++++
> > drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h | 4 ++++
> > 3 files changed, 61 insertions(+), 6 deletions(-)
>
> Odd that a merge commit is the issue.  ANd if you revert that change,
> all is good?
>
> thanks,
>
> greg k-h

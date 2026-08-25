Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9473543F4B4
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694218; cv=pass; b=FpnF+hQrHFisfNIQfHRtvoYHln9Y0jWnB6A8FdQ9UY3OwZpens1MfB7fEs0Pnj/GeWzXoY4T5Cku49CpSLiJDEe1vlaJfhWT62cHa5HElAzXo1Ed2gXVvn/A7PL0RNzgfhpUc5ssDs1SYhPom3uMvSI7z8/th9dlBvFjECNDf/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694218; c=relaxed/simple;
	bh=gTQdpnJPXFvK+dH5XFeLn0W2hRaHVNhffzbwns+IEi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrpzeHjgwEdFbPa7N7zEd4PJSiVrYwxgQM89YSQhbF5xZWrCN7U5UBpNlW0TtIdh1J+XEc1Xl29+UAsDWC+DlnEyGv0oMbG15uk9jX4SrmwxcpSwHdqyfowobqa2QM+ipUKYW8QrQm0kOdHQo5ciM1yw6g3K75UQN3RrFmY+AH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyEcmKgY; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyEcmKgY"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so266279e87.0
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 14:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787694214; cv=none;
        d=google.com; s=arc-20260327;
        b=T5k0Q1KMXGthjRCCc0JTiu1SgqNPZT/gdQhVLYWTTfyAtTZA9fql2ME4oZ76fA4+Iq
         Kcgsb5j4br+yQ73czFPxEp5b6sfMoYMG3Njo9SyP6TZuvxJxIWqYIBDJ4xW7+FS71QHS
         R3KmfYgptCEO0lXsjoZ+NSiMP9BxaG4icRPQHv/BbkVKb3Biq16+72tI5iUyrwWN2T8f
         Z1hiRahHy8S3NPRyikjIAPWpWyAEtzuv/znBMOzjzcxkPxQWb5Knv4b/RD90LEbjfRI4
         96hK3Zbbx1KoFb365AWqCs8zwUHhbfvM/jhL4XUg82w3nFDWxxQAr6vDhdmb145YLZbO
         wDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gTQdpnJPXFvK+dH5XFeLn0W2hRaHVNhffzbwns+IEi4=;
        fh=UgHAQyiOYANTgSnfgEnefVNFacrY3oa3DYbvSiERHWA=;
        b=l7sDXKjytEgVhBewqApNdQM6G6XZvFdOxGTRd2huGl/sGhH08v8+Gw9JpNmHcqD9m1
         VCJ5EiPpgTFuTA60rDedU7Y4CEK0dtbzElgJ0la+9O3MM5y8g/z4ouHFFF45GGbzpV3g
         MCO5fevl66yiFb3tB8P6xNp5BUd/zdrWee/8kGO/2FFhtkGBToNop8dgWXHDQN34PH7m
         bQ3Ed33FM1yHDtHE0R5ICLMnextBeFsublVVVUqn4sUtvcdiy6P5EIHaYdwv4VufJRx0
         P/+q19AAJqRKmJkaLuR54T8Dk+9EVpFnldPSBsR++ZcZKAtf0IA0O2fGoRsqYO16ZWPt
         HjHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787694214; x=1788299014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTQdpnJPXFvK+dH5XFeLn0W2hRaHVNhffzbwns+IEi4=;
        b=eyEcmKgYcwsjhtboY3JVRwY/Qcu7TdoDwbU1rj2NaGWXOy3eJmBIl/FOKywZRRF/tk
         mqFlx7JVAO/edVB6CRbUjofjM848BMvkQOEz0a96gxNZnqrjXzB+hthcYLKQ4RaktYVV
         z2a+bjpRM8xLbjZcGHJb00JL+uPOs3tS0X24cqZK4esbJ4KWYL1S5dZqFdCZAa2XH0IN
         v3MkKe2WUQtMx6i/P5KD5LNTtzAuicHZcnGYQlQr1qvGjSNBfoTnh9f9lAhpq4PS1Gfb
         cIwp0kpxer7SOb29bczCBiuXUrjlSP3YA+TR2EuBD6QmMScI064FK1CpaI1Wpcd+5k+f
         pHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787694214; x=1788299014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTQdpnJPXFvK+dH5XFeLn0W2hRaHVNhffzbwns+IEi4=;
        b=tIglmOw+WfBVHQfA1nVSWXSFwaZFl9yTyysOGyaUgNMxnms3kzLAjn2/l30RW6IUhm
         h+OAiwehUJdVqJAv/Zs63yJgLEmfJcMnVU2q4lWHdqZ1ICxOukBcE7mE2PN6UgBQoal3
         OmLH4Cfa3qauYBtzT2eUrdgUWxAyKYyM42VvLX1mrniTPCjMJu5t/c/KqsbXH3hCNmtL
         pIa8yJLZdFPKGKz3Bzz/ZVLBnM5neNFUEiaM4SxARb1zQlTQr7V3LDXB9PCGe450LNEY
         igEWBhyDjJ8M9sZqKY6mS14oCkmUwXEIc6m/8fGB4nBj0WrLjL8h8K9vtjaQBD4QWux1
         5mHw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9B1c2FnL/WdGGlZmL/dYL2mHojFqrVsRhrryeQQmhM6DtXxBwqnPKBc6G6d/zeR2z6d5JX0BsMj3rMg==@lists.linux.dev
X-Gm-Message-State: AFuF++k7iVtBgkbOh7QEdSXYISML7jd24hh0ZK7ydJPbG/u6l6FLE43G
	rtHG2yxNvkJ6g1f8E83F/YyyVMSYIfSm+8PJIX03pW5nHDRfUKqNek5Me7wu/MLTyTgukCtBLVv
	pCRZcroMA590HFoMkVmUc7OAtAs2ZtDc=
X-Gm-Gg: AR+sD101bxe9S4jMEALBCAk2Rr1bJHzMTX5JWfVVR/CxRpTRBU3oK0Hu+3to9XRaMDr
	BHF0fy7cfvoCQtDhik8bToYBi46delGXXrH+nVujN0BOlO23d+CoWzM8b427xvFIZkPKL4eEQTX
	qYJOl1Bo2vlD7x9rFw9ao9sgERuCDC8WMc69meA8WtTdp9Vg9cpOq2m4q61YoKCFyDJReK1ftZf
	pGjMRHeCyFLa0KeffcCoyq08Ksj3mzpwkvClsf8wUvu1UwciWJcpLvnpQ1DqYWy5mzN9+LkCTP+
	YWAQSxgSmCZoamxbCMhZ5XVgcBaiT0/Gz/QcksCEhYwhZoKTIaDatHyqMfp2GH3+sd1m3xhG6ir
	WFqaXw3U2pA0=
X-Received: by 2002:a05:651c:31db:b0:3a1:1181:b2e with SMTP id
 38308e7fff4ca-3a1fd67c986mr3121441fa.12.1787694214237; Tue, 25 Aug 2026
 14:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info> <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com> <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com> <ao1ovvdPAy6n_F7I@eggarch>
In-Reply-To: <ao1ovvdPAy6n_F7I@eggarch>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Tue, 25 Aug 2026 23:43:22 +0200
X-Gm-Features: AcwNN1XMZ3b0XN7GsnQg8cfRR84V6LJh9PVf6rA8xjQi1iFnVttUPqbLHwxSCcY
Message-ID: <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> If you need me to do some further tests or experiments, let me know. I w=
ill
>> be more than happy to play the guinea pig here.
> Was this result after applying the small patch I sent above?

The patch you sent makes the issue go away. I am now running the exact same
scenario for 2 hours, without any crash.

However, I am not sure if this can qualify for a proper fix, since I
do not have any
external hub connected to my motherboard: All my USB devices are directly
plugged into root hubs (and at the moment, there is only a keyboard and a
mouse).

On Tue, Aug 25, 2026 at 12:06=E2=80=AFPM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> On Mon, Aug 24, 2026 at 09:37:55PM +0200, Mathieu Fluhr wrote:
> > Yes. As mentioned, I first thought that the emulator itself triggered t=
hat by
> > doing something that the CPU did not like.To be honest, I barely play w=
ith old
> > Android versions anymore, but seeing that I could reproduce it even wit=
h
> > Android 13 or 14 made me suspicious.
> >
> > I _guess_ Google implemented a workaround inside adb for version Androi=
d
> > 15 since using this version, it remains stable for more than 2 hours.
> >
> > But, in the end, the situation is that from a simple user account havin=
g access
> > to some usb plugged in devices (I usually add my user account to the pl=
ugdev
> > group and use some known udev rules to access my Android tests devices)=
,
> > you have a way to crash the complete system.
> >
> > > Opinions seem to vary on whether CPU load must be present or absent.
> >
> > On my side (and I am here only speaking about my TR. I don't know about
> > other Ryzen CPUs), I can't reproduce it under load, and one condition t=
o
> > reproduce it is my CPU going in C2 state.
> > -> I did a 2:30 hour test using several youtube videos playing at the s=
ame
> > time on my desktop, also stressing the emulator with some 3D Mark runs
> > (as mentioned, I first suspected the nvidia driver to be faulty). As lo=
ng as my
> > computer was busy everything went fine. But then I let it stand still f=
or a few
> > minutes, and it just crashed.
> >
> > If you need me to do some further tests or experiments, let me know. I =
will
> > be more than happy to play the guinea pig here.
> Was this result after applying the small patch I sent above?
>
> Regards,
> Lovekesh

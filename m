Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3C38888E
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600291; cv=pass; b=L88/bTnbSEBgbLRX8XgPw/UCtj6Wrs859q+wQ41wbVvkxvbX1Y6v+G/R+QlRWHxYGxvW8zIHOAASvPBztsHlnjx8/W1+dlhea+rfl5tqJoXVrh7V4o4pQc2fXJjUITmApKDP7/SK4Fcdf6efhITSD5CV0ukJfen2mCfX1Hzmhxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600291; c=relaxed/simple;
	bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKL2kFSth4nguRCq98KJ3fasx009alOC/W1mz6LWTKvsrbj4JRC1QM1QyOLmR/UdWUBdCFS6Kz3rFWr2EfvHAHmrvGRxFHU92PJip6SvQzlpXWBk0YVUh6yUiywzmqbUnSCEZ4Bqo17aBXvIfXyY9jjIjL6c9m6FEjcAAVaRYsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfMe9emR; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfMe9emR"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39f1ac13687so26112531fa.0
        for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 12:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787600287; cv=none;
        d=google.com; s=arc-20260327;
        b=YBFu9vgyJ9sjd7PEmNKEItsCZGqs3JDVObOJQlBuXvZPZkKu2CnkIlENGHo2vLIj+t
         cKejCVXmpUuUe1QyWV7qqqb5utsBesseLG/VTTW0mN8d+3Vu025kFNwje70kRBrdqRR8
         D6X2ViV0894t+yh3b0a6GbaYwz/JQ47peTVEKhtkU0YH8y2ULP+Z7uGHOXIaT88ChVwC
         zyH5EV3k1nT6o5jBXzIRiHMnKsQ4vNLZ7tueDogitINZ3s/g4GR1M+T0MgQEbZdkcXxg
         VHWg6K71bKhcqtRm8kg4eE2t3u1FZA/U64J8bovY01ELPt+9gHf2LDfFDiUgjP74k1E+
         zv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
        fh=ef16a6hzGqYaIWJTz9hvsNNAIk8ZHGGeDlYA//hVZBw=;
        b=pET9rbczNyxrrhtF2X8DYsV9wypLVEZ7fvF7Kg6t31otc+Im9d/OxvEoNrtU9JPWhl
         oTmgJRYHI+lx0lTNhXVvAqo1369NbMIqmwf9fmpxr1As0NEiULWPCoD7raVB3btytsfn
         kMq9g6lbX1P+N2Fhn1RpvG6GQAyMwcC38ndMSe+BaqeKoNZlOg471Wl163ECEN6R6N2Q
         h8ubViM5LIV8y3op2QRhYTuDYY8DH7GAjasIqVJWEoqkiAXEWWSzy4G6HsFsmJpKW3hL
         KctPZWGyU9Z/K7T7w/CJRl7yjcSpOPZx5FGp3Bvx2yfff1Sj76BbCtrlFdO+1bR1O4zg
         ZJXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787600287; x=1788205087; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
        b=lfMe9emREwQ8D4Rewk2Gf1Kr/AuCeXJcjRtYmy/Ppgn0EYfA5rp8x+wzNw8eUTtEhM
         3/yli1XG/3jGDRSsGmQLT0gvpjkoU7Y4JNauvJrg2guGuPobVvlnf+1OLn7qho2v/5Xs
         rY/l4gzQiywmqGLpmQV9gJ3sE8G3NujpBd6JehCNYWO2dQMW9KgEo9DYv0lflOKaCjDy
         PrZoEVXxL4U//kH6ROFytoY91++KpFQiVTwDB+jV5+IyrjeYKbC38dPPiTYtmPNfd/sv
         SXFw2QYIOeKh8Vji0R2mkqS/lDfSDrJxDqIu4mWZ6iSwICHNYN66ubn+EXZ/Bh4qqDWB
         0f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787600287; x=1788205087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHeHpucERJjVL5+r2NcJqPbPArlHtoL5ieMLJnSAk1Y=;
        b=nEDi1J21Ha7BTwBpYXp3v+RXeWajvPlpTDS35U+aoacwNSiqhfNv+RfL95E9vS/OvI
         y7Ev3ouZ9hiSWLwjQKNHNOggd7erB80/rsw7/ui0AJUCwFV/HCpKcrvt6RfLR7F/NGOQ
         t083X20EJkBhnKQlKjyYx0YE39HYbI3vMkahWBrOffRCB3A5N71zYal4xDXeDIrcrjqH
         SToWZRFG1BUfQ9853bxgmwIe2sDfloDqC6GkeBACRN9w31xDHT3KOzm4l3OKA6NrlnJn
         k8FPziYhEOmZTpUcvkz+wFgJEQ3rUY4XxIpIwUbzFqxLzT3p7BA2u80+0ne44N2onI+G
         bMYA==
X-Forwarded-Encrypted: i=1; AHgh+RowOr6mGzVmLJVrRsAPkOJsSOW4f78x2LVeQpFSZOSQ2pEOIT7ewdt71QGeGkIuUPACAAdhRsmt//uT6w==@lists.linux.dev
X-Gm-Message-State: AFuF++l8UX4hFXhV8SGcj3yH3DgUlz6LwQVmLJibmwtavF1IsxYnPdJ2
	eT1C/kUuZxRJSwi/GY+ZEUVzkQXXyWR+5XVWd/1HDT7RfUVaEiZOc9pgrkS5ij1mXK6qgtReycD
	JUXVy0Heo4cB+9M5oM6wN0/z4CwH4fLg=
X-Gm-Gg: AR+sD13uE8H4yvS7hX0v+RRdCqzgac8O/Esc279QlJGW660AN50K8yR7H7Hr/VEfEbZ
	bgGdsELXt+8h1YJkxYAik4PVygaW2xKE4XXkh875RGABn5FBFNZay4i9ltQ9rJK+3PnFJwxOTDX
	lkLdISThXNlUKmLT+1B1b+MRpp3DxR2h7Cp/P1+uYIjS1nRW+Q2DjnPTBQgh2zbRabG9U85bW/I
	N2swgQTKYtwPhMWW+4Z6XbwLnRWVRnCuq1Z4UUrcknAbqehbqGdzGuI8RhEbmP2S/MY/lPLGY+Q
	l9BKFwpGg0bMtp66p+pRp+D1/CvyT9wuJ6WirJh7nZuC7LLlQG2cfr0PbXYFd3DG+21STFEJ/Jt
	u
X-Received: by 2002:a2e:a983:0:b0:38e:a12c:418c with SMTP id
 38308e7fff4ca-3a1ef5775bdmr1370571fa.11.1787600287017; Mon, 24 Aug 2026
 12:38:07 -0700 (PDT)
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
In-Reply-To: <aoser8dLytrwqBC2@eggarch>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Mon, 24 Aug 2026 21:37:55 +0200
X-Gm-Features: AcwNN1WiVe33vc8h6QVQzrHv4uzYMmh-8zMzWXxnjMlLCWrcww5TjCW4pcQuiCo
Message-ID: <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
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

> The issue is obviously a severe HW malfunction (you mentioned MCEs, the
> Ryzen CPUs simply totally locked up), triggered by poking certain xHCI
> controllers on the I/O die of these CPUs in some wrong way.

Yes. As mentioned, I first thought that the emulator itself triggered that =
by
doing something that the CPU did not like.To be honest, I barely play with =
old
Android versions anymore, but seeing that I could reproduce it even with
Android 13 or 14 made me suspicious.

I _guess_ Google implemented a workaround inside adb for version Android
15 since using this version, it remains stable for more than 2 hours.

But, in the end, the situation is that from a simple user account having ac=
cess
to some usb plugged in devices (I usually add my user account to the plugde=
v
group and use some known udev rules to access my Android tests devices),
you have a way to crash the complete system.

> Opinions seem to vary on whether CPU load must be present or absent.

On my side (and I am here only speaking about my TR. I don't know about
other Ryzen CPUs), I can't reproduce it under load, and one condition to
reproduce it is my CPU going in C2 state.
-> I did a 2:30 hour test using several youtube videos playing at the same
time on my desktop, also stressing the emulator with some 3D Mark runs
(as mentioned, I first suspected the nvidia driver to be faulty). As long a=
s my
computer was busy everything went fine. But then I let it stand still for a=
 few
minutes, and it just crashed.

If you need me to do some further tests or experiments, let me know. I will
be more than happy to play the guinea pig here.

On Sun, Aug 23, 2026 at 7:05=E2=80=AFPM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> On Sun, Aug 23, 2026 at 05:40:59PM +0200, Michal Pecio wrote:
> > But I'm not sure what you mean by "1Hz stress loop" and why is slowing
> > down the suspend/resume cycles or moving suspend from close() call into
> > a work supposed to create problems?
> >
> > I would naively think that doing things *too fast* is more likely to
> > trigger races and break the HW. The whole issue smells like a HW bug,
> USB2 roothubs still do 30 ms cycles and are harmless, only stretched SS
> ones kill the box. So if speed were the issue the faster ones would be
> dying first and pre regression kernels ran fine.
>
> About 1Hz, adb scans the bus once a second,
> every open resumes the root hub and host controller out of D3 and close
> puts it back this existed before regression too but with 30 ms of
> close() and slept for rest of the second and now it keeps it
> in D0 well after close(), the suspend itself happening later from the
> delayed work, so this d3 - d0 - d3 trip of ~230ms repeats on
> each scan. That's the loop I meant.
>
> > Can it not become a problem for external hubs, under other workloads?
> Possibly yes, but nobody reported that so I'd rather scope where the
> harm is proven.
>
> > Also, what if we connect a downstream SS hub to the root hub? Will this
> > not cause the root hub to stay awake for 200ms again? Problem is back?
> The root hub itself skips the hold since the check is on its own parent,
> but it will be kept awake anyway while the downstream hub or devices are
> in use which is normal activity based PM.
> If heavy polling behind a real hub ever causes trouble that's probably a
> xhci/platform level fix anyways since real hubs can't really just drop
> the hold.
>
> Regards,
> Lovekesh

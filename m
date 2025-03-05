Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C580A204F98
	for <regressions@lists.linux.dev>; Wed,  5 Mar 2025 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741204681; cv=none; b=reWN/BY7ZCtCbRePRNOrvp8NDPEeNBh44GT5zcenxWa14afLCjSx7GZwH1D7cBvOdvsFc/JjkFG7ijdpgoVIFbHC7R801FcfKNUfbYQM3Y1nlXU6vT5GjrLDtIzxzaqKY1+xEBoVB08B/80W4aCpOxbke5FCh0tUQGa8syfXARM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741204681; c=relaxed/simple;
	bh=3SofOfUEe1y4VYfO2piZ8r/sTxcae5BWEc8HQTleXOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXuRdIWja4RBB4zJcwWPXyywxywYxghgJCTP3cTbjC75aUMCdHhXaYkSUH0BODBF7gq1agdewNxQ9BH1Wii1JkWeoUft6OmfikHsIj0iv9U0cy3c5tKVA7SZs1PIZfQ31qzlEDnKYk57ARwLGDxlYgusDo+PtBCLtHZh20VVmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ST7EOSua; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ST7EOSua"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac0b6e8d96cso545725666b.0
        for <regressions@lists.linux.dev>; Wed, 05 Mar 2025 11:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741204678; x=1741809478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/ZXpjJi+S5vVQ+v/vLI8CHzh++7gcgmV+BrUYvx3Nk=;
        b=ST7EOSuan5ohJbdApMx5TkGjABvr+zPXaEUMVW7YJmEyvyd4uaQjOEdiJtiYr6tHFU
         Cu0EsKhJo90q/AQNV6eM1A93N91ODzhQHdQt6obICSCaKDR6WedxrtH1UXigeXIpYEGd
         BE1x+Nr/xjhweqXMhS1ZKJ+cSD2eevLwdonkjoJsxesmvbZaKTlBD9u3zfsR+MITv/QZ
         UOJZ9V0S3j/nU3QJU9pt5pjv8bKwRKCWunjcTAh0ByYog+YPeJSxqe6jSkpaSpsiPJ4m
         EqXzEWDG3PutgAyubSop1H6sD+nHWlghaNuBeVR9t98xzCs8I5uXWz3048j7AwNwUv3j
         6jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741204678; x=1741809478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/ZXpjJi+S5vVQ+v/vLI8CHzh++7gcgmV+BrUYvx3Nk=;
        b=U5wql86tby8D/HU4283pChdzmJlPwxdv7IqivtgEvU7GMgq3ZJpa+NqQPNxMERQJiB
         Tye5qdwU22GLor9wwO0iE+jjCYHRy3qv7j00zzKyA4j/7IKKPuRiZDkfjvpJO7ShJ668
         X4rlSGmOsnjQ2jGFN0XIbXPYNm7PkLRCG4u2Ks8lgTRyGDJE23eKheDXL4GChd7ohWb+
         /NXGy+d9g40fpwKeiBLNG1oN/mGI697FyqmSqeIN8wjc2s2qkOlMU9AcQjGR4TmiaGTE
         BUYRcOvL3bKE7jX4/1j2OJikzJiSPGXYV3fFuQEQ8FHiFinR2Xv8A40d4BgcyeSFs/Ud
         wfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv2onF4FiaOkux07S37Y3AtRngmAuMBPBv1pAsNRRpFPSLR/Sz4HnVR9W3W/xvotgjh4LzByT9feQT3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjqVoy4RTKKMiCTt4wiE9VZ5iS5JTISBVMT1RSZZPj56TUFRqN
	quZiCDCX4Rm/mX1Io1qySxFLCiyHX//Rz3llsqWqcJfk5gLHqMWH9+6u0FxmkBu8SKY/0OJ1Qr1
	UzIfYxceeOP5jvuva7OSymGkEhV8=
X-Gm-Gg: ASbGncvOLICa1LRLr2OGtYRZbl/fIUjy1s/Y7ClV9js95qRd6nEyPZYH+IZMQ5oZuag
	OAm2f5lVyhhP6GW7+QBljZpJs6FxKYohA/LQnuL/pwydai3qEJCbFdXkqd9mRA274qZGZZLPU9+
	IuW/j8wq/M0NS9/v8mpU1w7PAX
X-Google-Smtp-Source: AGHT+IEuPBQlxzGis7PUyBClL+qVCjee9w2SsaScpchDplJcvi/zqf/o++iTiWSQpCI+U46NgmAzyGnlqYNRUYoLkUw=
X-Received: by 2002:a17:907:2da2:b0:abf:7af6:ea64 with SMTP id
 a640c23a62f3a-ac20da89861mr509314966b.45.1741204677419; Wed, 05 Mar 2025
 11:57:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMpRfLORiuJOgUmpmjgCC1LZC1Kp0KFzPGXd9KQZELtr35P+eQ@mail.gmail.com>
 <2025030559-radiated-reviver-eebb@gregkh>
In-Reply-To: <2025030559-radiated-reviver-eebb@gregkh>
From: =?UTF-8?Q?Se=C3=AFfane_Idouchach?= <seifane53@gmail.com>
Date: Thu, 6 Mar 2025 03:57:41 +0800
X-Gm-Features: AQ5f1JpQ1z6G7iloHzXVBiJZ3GUkFE92JcFSnEm6C7EdbyJf1xaWNLQKx29oq8s
Message-ID: <CAMpRfLMQ=rWBpYCaco5X4Sh1ecHuiqa91TwsBo6m2MA_UMKM+g@mail.gmail.com>
Subject: Re: [REGRESSION] Long boot times due to USB enumeration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dirk.behme@de.bosch.com, rafael@kernel.org, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 2:26=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Mar 06, 2025 at 12:32:59AM +0800, Se=C3=AFfane Idouchach wrote:
> > Dear all,
> >
> > I am reporting what I believe to be regression due to
> > c0a40097f0bc81deafc15f9195d1fb54595cd6d0.
> >
> > After this change I am experiencing long boot times on a setup that
> > has what seems like a bad usb.
> > The progress of the boot gets halted while retrying (and ultimately
> > failing) to enumerate the USB device and is only allowed to continue
> > after giving up enumerating the USB device.
> > On Arch Linux this manifests itself by a message from SystemD having a
> > wait job on journald. Journald starts just after the enumeration fails
> > with "unable to enumerate USB device".
> > This results in longer boot times on average 1 minute longer than
> > usual (usually around 10s).
> > No stable kernel before this change exhibits the issue all stable
> > kernels after this change exhibit the issue.
> >
> > See the related USB messages attached below (these messages are
> > continuous and have not been snipped) :
> >
> > [...]
> > [    9.640854] usb 1-9: device descriptor read/64, error -110
> > [   25.147505] usb 1-9: device descriptor read/64, error -110
> > [   25.650779] usb 1-9: new high-speed USB device number 5 using xhci_h=
cd
> > [   30.907482] usb 1-9: device descriptor read/64, error -110
> > [   46.480900] usb 1-9: device descriptor read/64, error -110
> > [   46.589883] usb usb1-port9: attempt power cycle
> > [   46.990815] usb 1-9: new high-speed USB device number 6 using xhci_h=
cd
> > [   51.791571] usb 1-9: Device not responding to setup address.
> > [   56.801594] usb 1-9: Device not responding to setup address.
> > [   57.010803] usb 1-9: device not accepting address 6, error -71
> > [   57.137485] usb 1-9: new high-speed USB device number 7 using xhci_h=
cd
> > [   61.937624] usb 1-9: Device not responding to setup address.
> > [   66.947485] usb 1-9: Device not responding to setup address.
> > [   67.154086] usb 1-9: device not accepting address 7, error -71
> > [   67.156426] usb usb1-port9: unable to enumerate USB device
>
> That's a real issue, but should not be due to the commit id you
> referenced.
>
> > [...]
> >
> > This issue does not manifest in 44a45be57f85.
>
> What does that commit have to do with this?  That's just a build break
> fix.
>
> > I am available to test any patches to address this on my system since
> > I understand this could be quite hard to replicate on any system.
> > I am available to provide more information if I am able or with
> > guidance to help troubleshoot the issue further.
> >
> > Wishing you all a good day.
> >
> > #regzbot introduced: c0a40097f0bc81deafc15f9195d1fb54595cd6d0
> >
>
> We know there are issues here.  That commit was "fixed" by commit
> 15fffc6a5624 ("driver core: Fix uevent_show() vs driver detach race"),
> but then that caused a different problem, so it was reverted by commit
> 9a71892cbcdb ("Revert "driver core: Fix uevent_show() vs driver detach
> race"").
>
> There are many discussions about this on the mailing list, with a
> proposal to add Dan's "fix" back.  If you could try that, it would be
> great to see.
>
> I think your USB problem is different here, but if you add 15fffc6a5624
> ("driver core: Fix uevent_show() vs driver detach race") to your kernel,
> that would be great to see.
>
> thanks,
>
> greg k-h

Hello Greg,

Thank you for your time.

> What does that commit have to do with this?  That's just a build break
> fix.
This commit comes right before what seems to be the bad commit. I got
to the cited (maybe) bad commit after a bisection and wanted to
confirm the results.

> I think your USB problem is different here, but if you add 15fffc6a5624
> ("driver core: Fix uevent_show() vs driver detach race") to your kernel,
> that would be great to see.

After reapplying the patch (15fffc6a5624) at v6.13 (ffd294d346d1), it
indeed does not resolve the issue.
The behavior is bit different than at the reported commit
(c0a40097f0bc) in the sense that it seems that the block is happening
earlier in the boot before even systemd has started because there is
no mention of a wait job.
However the end result is still the same; the boot will only continue
after the "unable to enumerate USB device" message.

staying available if you have anything else

Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F28D51B
	for <regressions@lists.linux.dev>; Mon,  5 Feb 2024 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707116971; cv=none; b=jwfrZ7ZJo/Bn17ganFGu5HDCyr05lLuy5OsZx1DwmoCrqQegdiiol8ba9SAxYZW43JjZX3kzHhT+YZtGD6r2PROqHOmzUFSficbilr6GIwxq5m4BQEvt0XE+/OuXL0cQ3SWuBcKN2SXyM1An58hEuG8pdfNIMJJpPza4HPlanPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707116971; c=relaxed/simple;
	bh=0HWTyJnF7cZWV5uhr1xy2sa3Kokjs5AlpLAQuJ5RMns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZkw4vfXO+95dCdGYcqvCoqesoLbtUX2l1XlsB68/koRMQEDwx/9ruM4WPSkHKgR1S7cCvVN/M4tqpoK5Ryd+X+KZp4mQhQHjucIBKpijyNGW/djGMNa3xxCXhmH59t7hvnFDAHuirw1Tmg+VEhRYEuHigJIhO7X/el0w/yY+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ln/snPGc; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ln/snPGc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a349ed467d9so474544566b.1
        for <regressions@lists.linux.dev>; Sun, 04 Feb 2024 23:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707116968; x=1707721768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHtD0SBsqpOCqsRqynKKiqdaU6jxk/8r+8X131ttTZQ=;
        b=ln/snPGc3tSj8rvLEjHGpTpCa7115MFU7R1HqzSlRgUJrERlEPP+OeGWp2wF90oJ4O
         aQFyekeh/N7rm4RxlmVCqAemjLRBxqNc87uhbK0NbZCyyzFvm4lR6i/RmajtNvMaTGs4
         omTIbmOCbx2I6FjgspebcWLCg/v2MvDfVUbXS2zQ/XIUxgf3LH4s7+4aGA8PsCMKAdev
         BO7xtODsqrxSe5XyNEkRFxyxyH1FK19qPndnEfpTLfOf+n2LIFH+f9vOWBdA9k0/BqYs
         7Lp4qbLAeZh8w4wd+829V755cXhMumMXTCqBAJ7LZePnS35QoOp0ovOJQ8B+ccd0U1dQ
         Q9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707116968; x=1707721768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHtD0SBsqpOCqsRqynKKiqdaU6jxk/8r+8X131ttTZQ=;
        b=Cj70PlcisFP9bjpGBQkjWke53jcKDkf8mifpY6iPwj1yBOACnF8o2vqr07c0OiPpuN
         +9iOVMYGCULAAbFqk6Gb5EAoGczMEQK6MCL9ZKQtKuv0OPZYPL4523QzceWbKURNVMvy
         ZBhYkPx8Jij11rRCkoHKp0S9F9ZZJPVzSB+UkPXuwejK+ZPEwkrnBO20UItIbyfk80eA
         yfAkv6GErMvaVVmMk+XhjPMRfMk3LXo1WlaecXQEz0321bYZbRhXJnlgBWh7nnuotw47
         tsyladlavIYDkbN+paxXTQB1llUIyThNkOfyKoWMMVK8+J70d+VAFEB0tBJEg5a7rqHy
         w1cw==
X-Gm-Message-State: AOJu0YxRdcg25aKlTXC0I1quYmz9lK+YHtUR/OwDY/Pzxf4iqTnJ5VKZ
	r2QDEABnZ0CylTJbC3ESOQd4ee/B3inXhB5YehjeQtytXTVCKaseSSw6Hc/6p+PfEc3+/vc2b9N
	I2ZJx4NN9AJogdr3/hGtQyiga8hPeRbElM1A=
X-Google-Smtp-Source: AGHT+IEaiPB/WBdvTY0Xy9HmY2UTVqCSq6/bTFChmLjdYOwg3RgsGcf1VGS6PC79lQ4LEZx1oVfK2TsLN24i19dHJgg=
X-Received: by 2002:a17:907:77d5:b0:a36:cfdd:1fe8 with SMTP id
 kz21-20020a17090777d500b00a36cfdd1fe8mr5139298ejc.50.1707116967614; Sun, 04
 Feb 2024 23:09:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMBK1_QFuLQBp1apHD7=FnJo=RWE532=jMwfo=nkkGFSzJaD-A@mail.gmail.com>
 <2024011723-freeness-caviar-774c@gregkh>
In-Reply-To: <2024011723-freeness-caviar-774c@gregkh>
From: Serge SIMON <serge.simon@gmail.com>
Date: Mon, 5 Feb 2024 08:09:01 +0100
Message-ID: <CAMBK1_S2vwv-8PfFQ4rfChPiW7ut5LXgmUZRtyhN=AoG3g5NEg@mail.gmail.com>
Subject: Re: S/PDIF not detected anymore / regression on recent kernel 6.7 ?
To: linux-sound@vger.kernel.org, regressions@lists.linux.dev
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Any news on this ?
Just to say that i tried the 6.7.3 version and i have the exact same
problem as described below
("linux-headers-6.7.3.arch1-2-x86_64.pkg.tar.zst" for the exact ARCH
package, of course with a system fully up-to-date and rebooted) : no
more S/PDIF device detected after reboot (only the monitors are
detected, but not anymore the S/PDIF output at motherboard level-
which is what i'm using).

Reverting to 6.6.10 does solve the issue, so per what i'm seeing,
something has definitely been broken between 6.6.10 and 6.7.0 on that
topic.

Is this tracked by a bug somewhere ? Does i have to open one (in
addition to these mails) ?

Regards.

--=20
Serge.

--=20
Serge.


On Wed, Jan 17, 2024 at 6:39=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Jan 16, 2024 at 09:49:59PM +0100, Serge SIMON wrote:
> > Dear Kernel maintainers,
> >
> > I think i'm encountering (for the first time in years !) a regression
> > with the "6.7.arch3-1" kernel (whereas no issues with
> > "6.6.10.arch1-1", on which i reverted).
> >
> > I'm running a (up-to-date, and non-LTS) ARCHLINUX desktop, on a ASUS
> > B560-I motherboard, with 3 monitors (attached to a 4-HDMI outputs
> > card), plus an audio S/PDIF optic output at motherboard level.
> >
> > With the latest kernel, the S/PIDF optic output of the motherboard is
> > NOT detected anymore (and i haven't been able to see / find anything
> > in the logs at quick glance, neither journalctl -xe nor dmesg).
> >
> > Once reverted to 6.6.10, everything is fine again.
> >
> > For example, in a working situation (6.6.10), i have :
> >
> > cat /proc/asound/pcm
> > 00-00: ALC1220 Analog : ALC1220 Analog : playback 1 : capture 1
> > 00-01: ALC1220 Digital : ALC1220 Digital : playback 1
> > 00-02: ALC1220 Alt Analog : ALC1220 Alt Analog : capture 1
> > 01-03: HDMI 0 : HDMI 0 : playback 1
> > 01-07: HDMI 1 : HDMI 1 : playback 1
> > 01-08: HDMI 2 : HDMI 2 : playback 1
> > 01-09: HDMI 3 : HDMI 3 : playback 1
> >
> > Whereas while on the latest 6.7 kernel, i only had the 4 HDMI lines
> > (linked to a NVIDIA T600 card, with 4 HDMI outputs) and not the three
> > first ones (attached to the motherboard).
> >
> > (of course i did several tests with 6.7, reboot, ... without any change=
s)
> >
> > Any idea ?
>
> As this is a sound issue, perhaps send this to the
> linux-sound@vger.kernel.org mailing list (now added).
>
> Any chance you can do a 'git bisect' between 6.6 and 6.7 to track down
> the issue?  Or maybe the sound developers have some things to ask about
> as there are loads of debugging knobs in sound...
>
> thanks,
>
> greg k-h

Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D865339E
	for <regressions@lists.linux.dev>; Sat,  8 Jun 2024 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717849502; cv=none; b=Jn8fnjQhxee2AplACvVM9mGzjjHdecMGcrGhA9F4Ce5ENe8AJZ2NpEGHVmFgpngGeM0VYCRRM8aFp3q2J3AKZZ8WNbUTGsancKx+KV1yj6Z7XTOEDkT+szIyNpraFw7n68D7VQ1FeAIVvTa8ziiiIAKW4aU5gRbrZ16F5s67Iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717849502; c=relaxed/simple;
	bh=QoinzhZ0NTt2RazVwLGKw0mPLwu4odIDkMio21l5+mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mopuIC3sHGkQ/j9hlCV6YaHpB3E0ar+q7r4LLoDmOydSJyb04cfP1I/YWO31gGu6BC3pmOPgh+y9okfgQ48MVE/qd2iIAvMRFvYJusFtuIDS+Pwp0CAy19kxSGwtrbwhwciygs6gvLZI+10LMvqcvd8EaN+uG6Tk/E7QY3Ylplo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAdqko9N; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAdqko9N"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7955b839aeeso148885a.3
        for <regressions@lists.linux.dev>; Sat, 08 Jun 2024 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717849499; x=1718454299; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoinzhZ0NTt2RazVwLGKw0mPLwu4odIDkMio21l5+mU=;
        b=jAdqko9Ns9N9ZGmgSIkZw/Qv9CnQIyKJbG6z99UFdD/hKN/osWOy0kU/NeBL1dM45z
         zKKqkLzsVmNIdfS5J8wlyDOoa+C03Q4VdemWv+elWquizg/npTUw9qoxv3+sgaAt98iH
         FbDNVTmfibYihkm/LEz7LpH+zkYcfM6cKADWJ/emke4GpSCidMTLmzCwRcPX66j08+PO
         YCP5x2kuSrTqn2uPA5asvEUITdfJseHupoXe4kN7Nbamh7FMuQyTAoyv4oCTrXMf8lC0
         W8fSxyg2Au42ZGVwGCoprKpqFZWr0AoiPmD0dBfu7EWI3k+uIgb7i3Y4RWsWT+M5HpV7
         BITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717849499; x=1718454299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoinzhZ0NTt2RazVwLGKw0mPLwu4odIDkMio21l5+mU=;
        b=CKo3drJzSOQEbYTRy1q4wnrQiauXjHaL4K8Hzct7hPhB5VB9CwKAS0C/NrOiGqjtF0
         6/pPHDq+FFqCHfENn+uQ+9ojHlGjmPZ5xkSenN7oyb29mOi94LQC61u3QYmG9iR90NuU
         WYq8MYbZgCqbkovp3khYafz8mUiRj5cAf6tX6m7dts48X89rf/LaC9azB3FadapaQM9J
         mLIKYF9zwVP+zJfSNWbIV5aUShKjk+6ECbKok4nQ/SsXbFWiSAVn0su/Xh7TYO1I/tdU
         Ur4FEQfVgmnJskwSaxGwmsAgOxlTG4/HrmWyw9botNMcPpCYKvOEtWSGIfupfaU8izpt
         9nOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUnnbcIpSff/40KqvvqrX+Ehz2vXg99v4D50JUoB0AfIY/uicB5DR9og9OeQRgD7dncGdgFDVRds+5OfCyM/tVqIm3X5rduSiqLPs=
X-Gm-Message-State: AOJu0YwQq8MFZJYs30BjSoXBxlTNIiwKiXJoSZBK3QJKPSSa1SLTGfVt
	RCi9VL3BWZcDKf34+tltC0SHa9GGO2XK4lZ1gRt+965CJgm1VZPFR67AvGse582GG5Snn7vFWjX
	nKy26y2UPfdKvUGRGpSnJj9Gub4o=
X-Google-Smtp-Source: AGHT+IFzVyQrf/hm5K3mdu8pWgHJLLh8th/uXE0cNXLmjwJDQLLEinNWXgKtNEL7KXbD5e5wZHkVVgBzgM73hlOOh1A=
X-Received: by 2002:a05:620a:2853:b0:795:4bfb:fe2f with SMTP id
 af79cd13be357-7954bfc037emr370896785a.1.1717849499349; Sat, 08 Jun 2024
 05:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com>
 <CABBYNZLE9uYiRM-baoBt=RQktq__TguMETgmVWGzfeorARfm4w@mail.gmail.com>
 <212fca4c-fc1f-4da4-b48e-c6a4b64a2b35@leemhuis.info> <CAGew7BseJ18yjTu5AFWr=B3c41gXe4T=B0JqFWvXjQYvcDPfTA@mail.gmail.com>
 <CABBYNZJqULvfnafB5vA4PHPtzs_qmEQK8JZ3C09Q=wmvSZqwBA@mail.gmail.com>
In-Reply-To: <CABBYNZJqULvfnafB5vA4PHPtzs_qmEQK8JZ3C09Q=wmvSZqwBA@mail.gmail.com>
From: =?UTF-8?Q?Timo_Schr=C3=B6der?= <der.timosch@gmail.com>
Date: Sat, 8 Jun 2024 14:24:48 +0200
Message-ID: <CAGew7Bu3FBQfUya4vK-qr+D6zRiP4dquXY_0uND9TaHh-VT10w@mail.gmail.com>
Subject: Re: Bluetooth Kernel Bug: After connecting either HFP/HSP or A2DP is
 not available (Regression in 6.9.3, 6.8.12)
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: regressions@leemhuis.info, stable@vger.kernel.org, 
	regressions@lists.linux.dev, linux-bluetooth@vger.kernel.org, 
	luiz.von.dentz@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,
as requested I opened an issue. Please see:
https://github.com/bluez/bluez/issues/865

Best regards,
Timo

Am Sa., 8. Juni 2024 um 00:01 Uhr schrieb Luiz Augusto von Dentz
<luiz.dentz@gmail.com>:
>
> Hi Timo,
>
> On Fri, Jun 7, 2024 at 5:43=E2=80=AFPM Timo Schr=C3=B6der <der.timosch@gm=
ail.com> wrote:
> >
> > Am Fr., 7. Juni 2024 um 08:10 Uhr schrieb Linux regression tracking
> > (Thorsten Leemhuis) <regressions@leemhuis.info>:
> > >
> > > On 06.06.24 23:23, Luiz Augusto von Dentz wrote:
> > > > On Thu, Jun 6, 2024 at 4:46=E2=80=AFPM Timo Schr=C3=B6der <der.timo=
sch@gmail.com> wrote:
> > > >> on my two notebooks, one with Ubuntu (Mainline Kernel 6.9.3, bluez
> > > >> 5.7.2) and the other one with Manjaro (6.9.3, bluez 5.7.6) I'm hav=
ing
> > > >> problems with my Sony WH-1000XM3 and Shure BT1. Either A2DP or HFP=
/HSP
> > > >> is not available after the connection has been established after a
> > > >> reboot or a reconnection. It's reproducible that with the WH-1000X=
M3
> > > >> the A2DP profiles are missing and with the Shure BT1 HFP/HSP profi=
les
> > > >> are missing. It also takes longer than usual to connect and I have=
 a
> > > >> log message in the journal:
> > > >>
> > > >> Jun 06 16:28:10 liebig bluetoothd[854]:
> > > >> profiles/audio/avdtp.c:cancel_request() Discover: Connection timed=
 out
> > > >> (110)
> > > >>
> > > >> When I disable and re-enable bluetooth (while the Headsets are sti=
ll
> > > >> on) and trigger a reconnect from the notebooks, A2DP and HFP/HSP
> > > >> Profiles are available again.
> > > >>
> > > >> I also tested it with 6.8.12 and it's the same problem. 6.8.11 and
> > > >> 6.9.2 don't have the problem.
> > > >> So I did a bisection. After reverting commit
> > > >> af1d425b6dc67cd67809f835dd7afb6be4d43e03 "Bluetooth: HCI: Remove
> > > >> HCI_AMP support" for 6.9.3 it's working again without problems.
> > > >>
> > > >> Let me know if you need anything from me.
> > > >
> > > > Wait what, that patch has nothing to do with any of these profiles =
not
> > > > really sure how that would cause a regression really, are you sure =
you
> > > > don't have actual connection timeout happening at the link layer an=
d
> > > > that by some chance didn't happen when running with HCI_AMP reverte=
d?
> > > >
> > > > I'd be surprised that HCI_AMP has any effect in most controllers
> > > > anyway, only virtual controllers was using that afaik.
> > >
> > > Stupid question from a bystander without knowledge in the field (so f=
eel
> > > free to ignore this): is that patch maybe causing trouble because it =
has
> > > some hidden dependency on a earlier change that was not backported to
> > > 6.9.y?
> > >
> > > Timo, to rule that out (and it's good to know in general, too) it wou=
ld
> > > be good to known if current mainline (e.g. 6.10-rc) is affected as we=
ll.
> > >
> > > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' h=
at)
> > > --
> > > Everything you wanna know about Linux kernel regression tracking:
> > > https://linux-regtracking.leemhuis.info/about/#tldr
> > > If I did something stupid, please tell me, as explained on that page.
> >
> > Hallo Thorsten, I tried with 6.10-rc2 and it's the same problem on my s=
ystems.
>
> Could you please create a issue at
> https://github.com/bluez/bluez/issues and then attach btmon traces and
> bluetoothd? This is a really weird regression, also is your system
> using pulseaudio or pipewire?
>
> --
> Luiz Augusto von Dentz

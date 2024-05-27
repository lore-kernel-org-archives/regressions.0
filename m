Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8E155C8D
	for <regressions@lists.linux.dev>; Mon, 27 May 2024 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716828061; cv=none; b=YYKWVvfFRxlgqPhehAesDy/TV7ZivGCfZ70Y1oLDVoAZb9oPb+3FB6be8GGcOCYS0SIcysfRFZuxDKNbVfFy4LKRNINyd6SPbfwxuledFgHhipewp1GN/832YuYPHD0Lt3zjG8BoEdCCeyELWtqtit5mkdsH4h8m3wsv5kWkVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716828061; c=relaxed/simple;
	bh=dfkfDaQUMpGwTtp2bomb4Iu2aKjA9XikV5FqpfBCsSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3kUf/kz+mNl/MIbRSBqVmjhMaoZmb5KsnvHlRFo/YKsh5gfCZAiAECwTxoa1vngR/1eEoTL1XT3Q5yRsxfaDJ5LxZj4NOj26oCYbTBnFv/9y8EXcagtQr9tNVc17Wdlb+fqwwf3a2/tcx2jeJTZlVwFFRthah+kVPZ+m+SKHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYpRAuZ+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYpRAuZ+"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so91497671fa.2
        for <regressions@lists.linux.dev>; Mon, 27 May 2024 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716828058; x=1717432858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXhZGnNO1k1I5G/0gxKase3G2b7JBGSEOc1kPGMl+NM=;
        b=DYpRAuZ+4dscOnXuat98h+viIOeFtJ0d0wmZB+msehZVUnhtuZ8lvHqV8LE6XYjINI
         qeBnf1c5vODOptDjSETnYEaitEOlwUEfGBfSXS8oaSR7iAyjhHKcghccAHUFaTNKejRm
         u4UAUSQI5hG7xwZJHNqAI8nM6LipqsN6suj1mUj8bnGCiKeun4IPVKz6kAOQs5x/xn4r
         ZXC01CKLoUkEqiWAogs/VzfeoovolpHVuQNJCPrKN1vjzU7rTfKPMOREqpMZWLPsSAyD
         YGKfUjSsvq/WiZGvfOwNN68Y16M0PW7oycLxicI2lW3Xrl5jcUwVbYIX4wRYzYvjAyks
         W36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716828058; x=1717432858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXhZGnNO1k1I5G/0gxKase3G2b7JBGSEOc1kPGMl+NM=;
        b=qsXlb3loFoE++98k0N3rScZ7PEDuEPtEify/iImo/pHYGyJgT/JnoVcVsJ0MF7xjzb
         jognfRFOaHBpmONYtPGGqj+CF2P1OQdst0t4UODVXBe8LWnPXnXv/9VC1CTWyyPlHlGp
         pgNgp0Kw8ponir4Q5ViKI9KKwPmJkP6WjlHfLirKCb+JOp85GXZIIBR/JEN0CTRVFWG4
         vscjEZcdd5qlNE//HtmDH+Cv4ISeeARe2oAx7A7Ljl6OMI3PK6o1BbaMzxVTr34Xyecu
         WI3nQD3PZ9rp+2LHnM8R/eqSgkBwcG+XG6Dn1yoDqHDH6H2FfrmFgbLhADK82fmavmGs
         pmrg==
X-Forwarded-Encrypted: i=1; AJvYcCVS5MBrwHrddefmFdPLBDRMuke8u9C+z3oEmLHh83A6YDf9j/IVBqy6zhOS2Y/KO70+bKSziCzzWgoV+w2WcpdWmAEwF87BI2c4Sfw=
X-Gm-Message-State: AOJu0YyRckQFL9U+YfC/NcmLHnAG2xTSyDmgCZUaVIrvGZhMMMKlPMJR
	/VDw/YXqF/cNxLttfI+R+qG9B4okIBBCeq9HuKcq2DXRTr25kw4yZ9EO8Ob4lPYCgmxdJyG3GhT
	MBKgaEH/5pcwG0oPrXT3TG2F6jBE=
X-Google-Smtp-Source: AGHT+IEsccTJyokgadctxD4gUbLFqcCCT0IkiQsUawd8VegpGiS5XsBpVEQl3nAm3VoXKG7/pPR0CRO43bwFcNIF1xc=
X-Received: by 2002:a2e:bc08:0:b0:2e9:570e:1cf with SMTP id
 38308e7fff4ca-2e95b3089d9mr71753261fa.52.1716828057942; Mon, 27 May 2024
 09:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE4VaREzY+a2PvQJYJbfh8DwB4OP7kucZG-e28H22xyWob1w_A@mail.gmail.com>
 <5b79732b-087c-411f-a477-9b837566673e@leemhuis.info> <20240524132008.6b6f69f6@gandalf.local.home>
 <CAE4VaRF80OhnaiqeP9STfLa5pORB31YSorgoJ92fQ8tsRovxqQ@mail.gmail.com>
In-Reply-To: <CAE4VaRF80OhnaiqeP9STfLa5pORB31YSorgoJ92fQ8tsRovxqQ@mail.gmail.com>
From: =?UTF-8?B?SWxra2EgTmF1bGFww6TDpA==?= <digirigawa@gmail.com>
Date: Mon, 27 May 2024 19:40:21 +0300
Message-ID: <CAE4VaRGaNJSdo474joOtKEkxkfmyJ-zsrr8asb7ojP2JexFt-A@mail.gmail.com>
Subject: Re: Bug in Kernel 6.8.x, 6.9.x Causing Trace/Panic During Shutdown/Reboot
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

I took some time and bisected the 6.8.9 - 6.8.10 and git gave the
panic inducing commit:

414fb08628143 (tracefs: Reset permissions on remount if permissions are opt=
ions)

I reverted that commit to 6.9.2 and now it only serves the trace but
the panic is gone. But I can live with it.

--Ilkka

On Sun, May 26, 2024 at 8:42=E2=80=AFPM Ilkka Naulap=C3=A4=C3=A4 <digirigaw=
a@gmail.com> wrote:
>
> hi,
>
> I took 6.9.2 and applied that 0bcfd9aa4dafa to it. Now the kernel is
> serving me both problems; the trace and the panic as the pic shows.
>
> > To understand this, did you do anything with tracing? Before shutting d=
own,
> > is there anything in /sys/kernel/tracing/instances directory?
> > Were any of the files/directories permissions in /sys/kernel/tracing ch=
anged?
>
> And to answer your question, I did not do any tracing or so and the
> /sys/kernel/tracing is empty.
> Just plain boot-up, no matter if in full desktop or in bare rescue
> mode, ends up the same way.
>
> --Ilkka
>
> On Fri, May 24, 2024 at 8:19=E2=80=AFPM Steven Rostedt <rostedt@goodmis.o=
rg> wrote:
> >
> > On Fri, 24 May 2024 12:50:08 +0200
> > "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.i=
nfo> wrote:
> >
> > > > - Affected Versions: Before kernel version 6.8.10, the bug caused a
> > > > quick display of a kernel trace dump before the shutdown/reboot
> > > > completed. Starting from version 6.8.10 and continuing into version
> > > > 6.9.0 and 6.9.1, this issue has escalated to a kernel panic,
> > > > preventing the shutdown or reboot from completing and leaving the
> > > > machine stuck.
> >
> > Ah, I bet it was this commit: baa23a8d4360d ("tracefs: Reset permission=
s on
> > remount if permissions are options"), which added a "iput" callback to =
the
> > dentry without calling iput, leaving stale inodes around.
> >
> > This is fixed with:
> >
> >   0bcfd9aa4dafa ("tracefs: Clear EVENT_INODE flag in tracefs_drop_inode=
()")
> >
> > Try adding just that patch. It will at least make it go back to what wa=
s
> > happening before 6.8.10 (I hope!).
> >
> > -- Steve

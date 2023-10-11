Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A612A3992D
	for <regressions@lists.linux.dev>; Wed, 11 Oct 2023 17:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="QbnbXO95"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7eef0b931so1332537b3.0
        for <regressions@lists.linux.dev>; Wed, 11 Oct 2023 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1697045194; x=1697649994; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNew73H8cLV959XSqwiYY0ad0O2l97cOQFlYDKMA/zo=;
        b=QbnbXO95fmmaHfac2JHuqvvjPliYTBfv+afXwtBpEG+0wum36iHip6cNLohVEorC59
         S4sRyg5wILWQkIkPCw6OC8NAaWDOB7sfHgj0t7iQhiD7ujSXpVDroQvMobesZhGkFtYD
         1VE7iV+4JwAVXrJE3jI0H8DGZKji/tfn/oZKmauBqbfIK9FTiB3o3/ta3nUYnATcW1I5
         1pHXM5X8xmqe9BjdpSk/SKtFKV0jJxgEU2RMqK6gphbrz1I3cBNRtrNBdDoslGsdRvgn
         vhAmeRuyuCdw/1iVZ5l6QCluamzbGOSd9m05rJzPw/W7NLCSGyivy+narhlHkSrSwfdE
         N57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697045194; x=1697649994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNew73H8cLV959XSqwiYY0ad0O2l97cOQFlYDKMA/zo=;
        b=RiOIlWyihGNcDkXTRhFvgZTuT84aebocPqxOWupS+ljWe6JZZrFlsKowTvnbDvm5wX
         6sDZpR0/AEMm61jCJeYBd1J420DODnat6KiQ5cFVSQdBKAWZrb+gx1g4BNkR1U02U0gt
         FI2Er6CSLJItii/iBLmPNizZHzOtB2zbUYuVSmZR8/kTWo3RMz5NDdVh8a94mj+vgyTD
         1M8aB9BNuxS1xA802a/bCnWUmksTXPbPxc3tKWZ3BRFv4OBqzf2T8fAK3Mek8pO58l4u
         l7K5GM149Y0pKdiO8nsHJaFutzPjM8QhomhcZt9xkNoxdTAL9jNPjTzsnzBVuaX+5FAM
         HOcA==
X-Gm-Message-State: AOJu0Ywmwz1nBgvW8WCP3//ZnFOqmIQCUb8MNZ5GRbAwgw9GxnJtu42E
	ZAfa2KWrbc52rlpTLDSEKvyu1XvGRX9YWvYTFsOZBg==
X-Google-Smtp-Source: AGHT+IEp5ojjWgF2jbZMwhTPCU3vssABraPBQDjt2Us+Xxi5NO6ntvquWBFk9mwc8p87fRKuk04zCdroPyd0DKql4c0=
X-Received: by 2002:a25:9012:0:b0:d9a:5f25:d0df with SMTP id
 s18-20020a259012000000b00d9a5f25d0dfmr5073058ybl.57.1697045194529; Wed, 11
 Oct 2023 10:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <065a0dac-499f-7375-ddb4-1800e8ef61d1@mojatatu.com> <0BC2C22C-F9AA-4B13-905D-FE32F41BDA8A@flyingcircus.io>
 <20231009080646.60ce9920@kernel.org> <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
 <20231009172849.00f4a6c5@kernel.org> <CAM0EoM=mnOdEgHPzbPxCAotoy4C54XyGiisrjwnO_raqVWPryw@mail.gmail.com>
 <7058E983-D543-4C5B-91ED-A8728775260A@flyingcircus.io>
In-Reply-To: <7058E983-D543-4C5B-91ED-A8728775260A@flyingcircus.io>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 11 Oct 2023 13:26:23 -0400
Message-ID: <CAM0EoM=jXYtbzo3W7eaVD5a=8DJde5Mu1wCQ7MvYigDT1k_Mkw@mail.gmail.com>
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC requirement
To: Christian Theune <ct@flyingcircus.io>
Cc: Jakub Kicinski <kuba@kernel.org>, Pedro Tammela <pctammela@mojatatu.com>, markovicbudimir@gmail.com, 
	stable@vger.kernel.org, netdev@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 1:32=E2=80=AFPM Christian Theune <ct@flyingcircus.i=
o> wrote:
>
> Hi,
>
> > On 10. Oct 2023, at 17:02, Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> >
> > This is a tough one - as it stands right now we dont see a good way
> > out. It's either "exploitable by root / userns" or break uapi.
> > Christian - can you send your "working" scripts, simplified if
> > possible, and we'll take a look.
>
> Sure, what kind of simplification are we talking about? Something like th=
is?
>
> #### snip
> #!/bin/bash
> modprobe ifb
> modprobe act_mirred
>
> uplink=3Deth0
> uplink_ingress=3Difb0
>
> tc qdisc add dev $uplink handle ffff: ingress
> ifconfig $uplink up
>
> tc filter add dev $uplink parent ffff: protocol all u32 match u32 0 0 act=
ion mirred egress redirect dev $uplink_ingress
>
> tc qdisc add dev $uplink_ingress root handle 1: hfsc default 1
> tc class add dev $uplink_ingress parent 1: classid 1:999 hfsc rt m2 2.5gb=
it
> tc class add dev $uplink_ingress parent 1:999 classid 1:1 hfsc sc rate 50=
mbit
> #### snap
>
> This should provoke the error reliably. You might need to point it at wha=
tever network interface is available but need to be prepared to loose conne=
ctivity.
>

Ok - thanks, we'll look at this from the perspective of both ensuring
UAF is gone and making your config happy. TBH, in my view UAF comes
first but we can debate that later.

cheers,
jamal
> Christian
>
>
> Liebe Gr=C3=BC=C3=9Fe,
> Christian Theune
>
> --
> Christian Theune =C2=B7 ct@flyingcircus.io =C2=B7 +49 345 219401 0
> Flying Circus Internet Operations GmbH =C2=B7 https://flyingcircus.io
> Leipziger Str. 70/71 =C2=B7 06108 Halle (Saale) =C2=B7 Deutschland
> HR Stendal HRB 21169 =C2=B7 Gesch=C3=A4ftsf=C3=BChrer: Christian Theune, =
Christian Zagrodnick
>

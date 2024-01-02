Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E160ACA7F
	for <regressions@lists.linux.dev>; Tue,  2 Jan 2024 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N5CN7Sap"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so93925a12.1
        for <regressions@lists.linux.dev>; Tue, 02 Jan 2024 02:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704189977; x=1704794777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaBFQhgGMCNl0CKoyiieJpbOY1dp0lCjQtKd7lErKQk=;
        b=N5CN7SapA27zF179XyMASAJMIywuKrKEbAeVhbS3WSVCb9KKFJsNO+0l6qzhokoAuP
         VqYyl846SneRhZwyYuTgKnkI9KMmgXQCnfVAHufjOOVln81KyKCpyrFqJxV1anc1Rhcs
         S/L/NbHjzw04HrB/Mt7PU9Ye22Owd1i+Dyx4e4z3DMA55s+g8mBC0p9QkVSvvjJxg+Is
         1Z6RKjzjCm9lue59WGWinQwTU9sByk+9AAkeRE9fdUODV2/zV4JaScbpl0cgZwohVpzY
         8sWaXZa+QH1BFMjCsBLzRtmvspCOtpCrVI4o70rKQ6TswhKn5NPmd6rq9E/B9yOi8z/f
         cLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189977; x=1704794777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaBFQhgGMCNl0CKoyiieJpbOY1dp0lCjQtKd7lErKQk=;
        b=vRLxLJFHAJhylYsPzgmI7Mk40zOS8TyOk88FrakOdsAD8BthQvMP9d5vEtl+X/A38J
         nU8eacXWltDz0Q0n6rqyDjunYU7IImT0D91LGnfn6h7gk2D0oOVOxiChqO3NQqPZo4Wt
         zN/aILuSOYPeI00is0JtU6sC//WG6+SpuydFjIhjMPlwhNAEaCQMctD0x4C2pcDmeBBu
         FlnWj789LOp+PgQEHNYeJVpFg5PNFBcPg2BEgzoV4awJOJ7MYQbVNgbFHb6Rvs/T9NIU
         LNGy262Eksr8BlFEqpPPqfI7TBKhBZwryjFaaVfDH8fwanSwg6HFZB8vVH9BuYjv73ZF
         lggw==
X-Gm-Message-State: AOJu0YzGNa9LzJqX20/eZlNCUVtVuNnKdyADwC/K98zKgCOc6As5HHhz
	vt6SxDvHlCWpM5+O1TWsVINQBtPZdGvU7P42yhvBAJok0nr0
X-Google-Smtp-Source: AGHT+IHfeBarGiDK3r6PPvb6mDuBpyt7wTIW58KV3ZsWFRLsg712Ke/PyIEnebgkH0oDh8qG+p/cywKdVMPMcVyOMPo=
X-Received: by 2002:a50:d705:0:b0:553:62b4:5063 with SMTP id
 t5-20020a50d705000000b0055362b45063mr1057944edi.4.1704189976931; Tue, 02 Jan
 2024 02:06:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <MN2PR12MB44863139E562A59329E89DBEB982A@MN2PR12MB4486.namprd12.prod.outlook.com>
 <CANn89iKvG5cTNROyBF32958BzATfXysh4zLk5nRR6fgi08vumA@mail.gmail.com>
 <MN2PR12MB4486457FC77205D246FC834AB98BA@MN2PR12MB4486.namprd12.prod.outlook.com>
 <CANn89i+e2TcvSU1EgrVZRUoEmZ5NDauXd3=kEkjpsGjmaypHOw@mail.gmail.com>
 <cdf72778-a314-467d-8ac8-163d2007fd70@leemhuis.info> <20231227083339.GA6849@unreal>
 <CANn89iK_Q38g1ieEb1MVvmVgiKQxmv9Hzngu_pCcXcwGs7cPLQ@mail.gmail.com> <20240102095529.GE6361@unreal>
In-Reply-To: <20240102095529.GE6361@unreal>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Jan 2024 11:06:05 +0100
Message-ID: <CANn89iLp_xeGScTWnQA50zGPo+eo7=GFcqGxCrSLRteYONtc8A@mail.gmail.com>
Subject: Re: Bug report connect to VM with Vagrant
To: Leon Romanovsky <leon@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Shachar Kagan <skagan@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, Ido Kalir <idok@nvidia.com>, 
	Topaz Uliel <topazu@nvidia.com>, Shirly Ohnona <shirlyo@nvidia.com>, 
	Ziyad Atiyyeh <ziyadat@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 10:55=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Tue, Jan 02, 2024 at 10:49:58AM +0100, Eric Dumazet wrote:
> > On Wed, Dec 27, 2023 at 9:33=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > On Fri, Dec 15, 2023 at 10:55:05AM +0100, Linux regression tracking (=
Thorsten Leemhuis) wrote:
> > > > On 08.12.23 11:49, Eric Dumazet wrote:
> > > > > On Thu, Dec 7, 2023 at 2:03=E2=80=AFPM Shachar Kagan <skagan@nvid=
ia.com> wrote:
> > > > >>>> On Thu, Nov 30, 2023 at 2:55=E2=80=AFPM Shachar Kagan <skagan@=
nvidia.com> wrote:
> > > > >>>>
> > > > >>>> I have an issue that bisection pointed at this patch:
> > > > >>>> commit 0a8de364ff7a14558e9676f424283148110384d6
> > > > >>>> tcp: no longer abort SYN_SENT when receiving some ICMP
> > > > >>>
> > > > >>> Please provide tcpdump/pcap captures.
> > > > >>>
> > > > >>>  It is hard to say what is going on just by looking at some app=
lication logs.
> > > > >>
> > > > >> I managed to capture the tcpdump of =E2=80=98Vagrant up=E2=80=99=
 step over old kernel and new kernel where this step fails. Both captures a=
re attached.
> > > > >> The tcpdump is filtered by given IP of the nested VM.
> > > > >
> > > > > I do not see any ICMP messages in these files, can you get them ?
> > > > >
> > > > > Feel free to continue this exchange privately, no need to send MB
> > > > > email to various lists.
> > > >
> > > > Here this thread died, so I assume this turned out to be not a
> > > > regression at all or something like that? If not please speak up!
> > >
> > > No, it wasn't fixed and/or reverted. Right now, Vagrant is broken and
> > > all our regressions around nested VM functionality doesn't run.
> > >
> > > Eric, can you please revert the bisected patch while you are continui=
ng
> > > your offline discussion with Shachar?
> > >
> >
> > This is not how things work.
> >
> > I have not received any evidence yet, only partial packet dumps with
> > no ICMP messages that could be related to the 'Vagrant issue'
>
> Revert of the original patch worked, so it is strong enough evidence to d=
o
> not break very popular orchestration software.
>
> >
> > Patch is adhering to the RFC.
> >
> > If an application wants to have fast reaction to ICMP, it must use
> > appropriate socket options instead of relying on a prior
> > implementation detail.
>
> Maybe yes, maybe not. Right now, Vagrant is broken.

Maybe, but after one month, I still have not received any evidence of the i=
ssue.

Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA7747C
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 17:42:57 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so816759566b.3
        for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695145376; x=1695750176; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kny2NAkyZcSHmecq8iXutP5/vcR/e3ga9/aerU/vXg=;
        b=TNsvRArR7k0BLqOkK8q0F6sNCwUkshOjEuarGkj9uTik3loGZdfah+bb2cFDosNyGF
         5Ez8gK9LhDYPNWw+VmuJGb4RHND1Zh3TtWVQna+5IAlJYNcmF51qcVAmSqPZsov5jRyv
         wdRQwiUYPOGK5fKLeDRkmDZnAtOPQ5NHGCDbPxR8m4TaP89ZUK3+bBBD9FgboHvpXd3d
         Qd2w4+bHDik4/toeCrTS48I3S/iLgXDUzpSWgqlTkGKoHIyUU95hVqERddOjQwDPaeVM
         GJahslE2WLXqPoJPRX5T3e0YJNsY3x0pzx161tVTVbO3iZv3hdv+e+w400oOLk4882cY
         hrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695145376; x=1695750176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kny2NAkyZcSHmecq8iXutP5/vcR/e3ga9/aerU/vXg=;
        b=SKyTHsm/ui+gNpfxXBe9b2xMHjhe+T/pZf0sAEnMPaQUmve+9R2PXh7hoY1Ts9Vj0x
         +cocjVZkUlWPBwPlTbZdpNQbwGWw3+wrby99DcmMpi0GHRgNJuSLcJNANqc+xXjWVj8y
         AvN9QcFMFVnVLSGrtI4PZvlVe0r2mFisKJ7pcwphI/1BMfPhEB/SCNkU9eDDJfKuC1g7
         WBP0lFpf2gFabfGMzuOprz6/mRuBitCS1XeQvReLOxGhH9Kjxm+SoZIDLJZrd9nPoIZM
         cQVNI6yVu3yq0+w2oG7MZBrwdmt0/qLrmfzeIWUBusNAMGfc9cZbnJI9tj7ZA0GblTgT
         uYTg==
X-Gm-Message-State: AOJu0Yx3jMZtMFwx4CDx9IjYmrkqU0DYL4y/aYon2tUEWohuEoAAvQ+N
	y6MAXPh8BpZZ2Jm9xWeT4qRMcOZGjrJk64mTOgg=
X-Google-Smtp-Source: AGHT+IE6twjvIwO3u2Iuo7xdl0w22r53GB2hC5iMi6jq4Adj5X9LcZ61kvCJAbML/0D/GHEd0Fx1a8yrLELm4mkBBM0=
X-Received: by 2002:a17:906:18:b0:9ae:38c5:1d94 with SMTP id
 24-20020a170906001800b009ae38c51d94mr71777eja.70.1695145375580; Tue, 19 Sep
 2023 10:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me> <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
 <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com>
 <CAH2r5mtUedfLSv81Z-Yb3_=AbD_QpT3tVbU1PRzMTituaw7bgA@mail.gmail.com>
 <CAH2r5mt6YzapEKDo=hQ64yvBn7=jwMmY1c85NOABKcMPKPp3KA@mail.gmail.com>
 <CAO+kfxQtOKoKdb+LtMeFxgu8VXa73nbmTPSfscbdwjUXM7ME_A@mail.gmail.com> <CAH2r5msNf9WDHrBZSi5FhHDSewSNxMAuXTetMJDnoNh3CF_oMA@mail.gmail.com>
In-Reply-To: <CAH2r5msNf9WDHrBZSi5FhHDSewSNxMAuXTetMJDnoNh3CF_oMA@mail.gmail.com>
From: Brian Pardy <brian.pardy@gmail.com>
Date: Tue, 19 Sep 2023 13:42:44 -0400
Message-ID: <CAO+kfxRS8JKympxZGKiP48cTdM+QQjd_4VX=Q5ix02gH7EJdeA@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Steve French <smfrench@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Paulo Alcantara <pc@manguebit.com>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <nspmangalore@gmail.com>, 
	Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 12:39=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> Minor updates (pointed out by Paulo) to patch. See attached.

I can't comment on the updates between the two versions of the patch,
but I can confirm that the second patch also works as expected to
resolve this issue on my system.

-Brian


> On Tue, Sep 19, 2023 at 8:21=E2=80=AFAM Brian Pardy <brian.pardy@gmail.co=
m> wrote:
> >
> > On Tue, Sep 19, 2023 at 1:36=E2=80=AFAM Steve French <smfrench@gmail.co=
m> wrote:
> > >
> > > Does the attached patch help in your case?  It avoids starting the
> > > laundromat thread for IPC shares (which cuts the number of the thread=
s
> > > in half for many cases) and also avoids starting them if the server
> > > does not support directory leases (e.g. if Samba server instead of
> > > Windows server).
> >
> > Hello,
> >
> > I applied the 0001-smb3-do-not-start-laundromat-thread-when-dir-leases-=
.patch
> > you provided against the 6.5.3 kernel.
> >
> > I can confirm that it resolves this issue - no laundromat threads are
> > created, and the reported load average is as expected, not falsely
> > high.
> >
> > This appears to fully fix the issue in my case.  Thank you very much!
> >
> > > On Mon, Sep 18, 2023 at 10:00=E2=80=AFPM Steve French <smfrench@gmail=
.com> wrote:
> > > >
> > > > Paulo and I were discussing the laundromat thread at the SMB3.1.1 t=
est
> > > > event (at SDC this week) which is now going on - will let you know
> > > > what we find.
> > > >
> > > > One obvious thing is that it probably isn't necessary for cases whe=
n
> > > > the server does not support directory leases, but we noticed anothe=
r
> > > > problem as well.
>
>
>
> --
> Thanks,
>
> Steve

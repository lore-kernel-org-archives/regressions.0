Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A627718
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 18:23:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5033918c09eso361143e87.2
        for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695147836; x=1695752636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwdzojJepsaJdah6ocqUuoQIoGD1sEl1BnvEuQsR990=;
        b=QfTn4zuAMYo5mgdT171EH+SiqgOcPKCGIMdJXNcxUjgauugodzoM7WjfXfW+g5mb6O
         O9eUtoBwRjvHDn+veiy/Ae0HmfKmnZFZKmiyeOaOuF/8bt1lf7auf681LZLxkJgp9jAq
         /4MfuWmBIxgzkDggGFsSLve9PFrQCabv5Gsb8HOh1Ujgq+mWoZKntTHzX5weMO5Dv9cJ
         90FL9e8Gb7mAlzgTy2sIp+lhCX3lYD+eliR6Akvo0DOBlASX/ibyfvcGXmvr4qT+b7v5
         NoMOVztONJTDGID0TlBenb5q7hszKJ7jbpxszDjVoIe+I3dp1YE+BpoiYZIHZlqd7fBV
         0fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695147836; x=1695752636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwdzojJepsaJdah6ocqUuoQIoGD1sEl1BnvEuQsR990=;
        b=S0DCMwU1ceeiIeNyJ2OXb/9ww76Dz03Rinvz+0cFR2gKWNCJnV+iIcplAs/DNris6D
         MdGjV49SA/l1+TmNN5JPrWblBveiejAJL0L87QGlxbM/neYM/eyd5j7GTHQ3az6VlI1s
         Dvw19I29pzXSVByc1r341bEvgL1zxc3R4/XHp7d4hxOpwegn+yM+dCR9RDaMC28SRJ4w
         DKFhwi8LxysiPzsMmoIzkHiBXbvLPyXN3NslpTNC5LVXDJGIDkHWEhnTBHOvV+/t217k
         Doq/iN3lEzs0Q2Jg+74qz18SV8AEDRauXh9im05D9Wkb7x54uZAU2za1sGXt1ReKVIzo
         uE/w==
X-Gm-Message-State: AOJu0Yy/iXp0GOW6y/Gnwc1MPBcVrWdhOApv9gO4dw29WoH6PKUdMhaY
	51sqHxw9yvi1vKYsgGRu+fssYMN5yUDszrvbEA0=
X-Google-Smtp-Source: AGHT+IG7gFNTF7iTz5rY5TEprFxZe6zQ90t2hC4Tzng9aArvXIfBQ31lvfKSBX8kjpfFzT5cXvxUkkCpkmu2BVUC1vk=
X-Received: by 2002:a05:6512:2f6:b0:4f9:6842:afc with SMTP id
 m22-20020a05651202f600b004f968420afcmr370132lfq.64.1695147835658; Tue, 19 Sep
 2023 11:23:55 -0700 (PDT)
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
 <CAO+kfxQtOKoKdb+LtMeFxgu8VXa73nbmTPSfscbdwjUXM7ME_A@mail.gmail.com>
 <CAH2r5msNf9WDHrBZSi5FhHDSewSNxMAuXTetMJDnoNh3CF_oMA@mail.gmail.com> <a895f860-11fa-e6d9-d042-a32bd08f9e9d@talpey.com>
In-Reply-To: <a895f860-11fa-e6d9-d042-a32bd08f9e9d@talpey.com>
From: Steve French <smfrench@gmail.com>
Date: Tue, 19 Sep 2023 13:23:44 -0500
Message-ID: <CAH2r5mszCxPtdURenMVgeVDX5zc8knumH=ASXyUufPa7SxbJBw@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Tom Talpey <tom@talpey.com>
Cc: Brian Pardy <brian.pardy@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Paulo Alcantara <pc@manguebit.com>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <nspmangalore@gmail.com>, 
	Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 1:07=E2=80=AFPM Tom Talpey <tom@talpey.com> wrote:
>
> On 9/19/2023 9:38 AM, Steve French wrote:
> > Minor updates (pointed out by Paulo) to patch. See attached.
>
> So, was the thread crashing before??
>
> +       if (cfids =3D=3D NULL)
> +               return;
> +

Without laundromat initialized cfids can be null - so we need to check
if cfids is initialized in a few places (may help in a few corner
cases if there is a race in closing laundromat thread at umount but
was added to avoid oops at unmount if laundromat not initialized)

> These changes are good, but I'm skeptical they will reduce the load
> when the laundromat thread is actually running. All these do is avoid
> creating it when not necessary, right?

It does create half as many laundromat threads (we don't need
laundromat on connection to IPC$) even for the Windows server target
example, but helps more for cases where server doesn't support
directory leases.

> > On Tue, Sep 19, 2023 at 8:21=E2=80=AFAM Brian Pardy <brian.pardy@gmail.=
com> wrote:
> >>
> >> On Tue, Sep 19, 2023 at 1:36=E2=80=AFAM Steve French <smfrench@gmail.c=
om> wrote:
> >>>
> >>> Does the attached patch help in your case?  It avoids starting the
> >>> laundromat thread for IPC shares (which cuts the number of the thread=
s
> >>> in half for many cases) and also avoids starting them if the server
> >>> does not support directory leases (e.g. if Samba server instead of
> >>> Windows server).
> >>
> >> Hello,
> >>
> >> I applied the 0001-smb3-do-not-start-laundromat-thread-when-dir-leases=
-.patch
> >> you provided against the 6.5.3 kernel.
> >>
> >> I can confirm that it resolves this issue - no laundromat threads are
> >> created, and the reported load average is as expected, not falsely
> >> high.
> >>
> >> This appears to fully fix the issue in my case.  Thank you very much!
> >>
> >>> On Mon, Sep 18, 2023 at 10:00=E2=80=AFPM Steve French <smfrench@gmail=
.com> wrote:
> >>>>
> >>>> Paulo and I were discussing the laundromat thread at the SMB3.1.1 te=
st
> >>>> event (at SDC this week) which is now going on - will let you know
> >>>> what we find.
> >>>>
> >>>> One obvious thing is that it probably isn't necessary for cases when
> >>>> the server does not support directory leases, but we noticed another
> >>>> problem as well.
> >
> >
> >



--=20
Thanks,

Steve

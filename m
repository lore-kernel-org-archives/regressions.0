Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7071863
	for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 02:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfZ/LflM"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-507d1cc0538so5832057e87.2
        for <regressions@lists.linux.dev>; Mon, 23 Oct 2023 19:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698115893; x=1698720693; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZaWM6/+je0+6Ad3eiiKjXQ3HfajEyj0oCdz07xSxDw=;
        b=VfZ/LflMMKSijKTHvD6B8W580Psr7FBJD/qGjLBvwHWD3/kqhutvA00R/AE0Am8HWq
         fnMAEAWS5jXCCQ0Yf+Tpkya9lv2SoTqnrCzdt02BWlwizZiU0PQyzktMq9diTPpAkJXy
         19A9CUskBiyckySeqme5ZnKoVUim2NDVOGpwMIQ38eYmeBsz95fsA/FlCjlFvpWD/imy
         tKj2ZOCADnJn2meSXeymoOagXe4IVZn/X5rV6nmxI71XhvLVWre19VrtMg+aQnFR4eD6
         ZbE1jlIexPwKmP5nRiOBZ1V1IjneYCxSW1j0RSr5OQ2l3cUVIIvxvl63gpijU2P9MT9Y
         0mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698115893; x=1698720693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZaWM6/+je0+6Ad3eiiKjXQ3HfajEyj0oCdz07xSxDw=;
        b=gkcgHTmsKPQ8N/02RiuZSYfSnRBsAiqtU+a44MOpsQJ+OqSWK5EE+OHvbLBkacbpD9
         h4ABBlTLLJ9ZmwUiwV9Uc5lWvA+o9u2LCHo740/T0MW//iPyn2Y0UuJUSGbEC+6i1yzT
         P8JpHMoC7pw+j8HBbXiQMfWd4ZNor0IR3Pbn0xOkpMlW5fR6iPUMbPb1UN1Ff3JfK/+A
         ZS6SoGRLvKswqUlhdAU5ZQWqr2DV+XlJKznNBI8KzVws078mGxjr2kwXCmL3Ubou9vue
         H8/SSylDhYkuPs/hWEZKT93iUWcwLpSs95S6dA2f343xMJ2xAx4cTtr+hxJQip4w1VZj
         YKfw==
X-Gm-Message-State: AOJu0YzUNjU05DO4jmBBvXfhuWs1fynxkjBQ0FW8CFeKVhUD12hSTQR8
	5jvAoCJdQIDYf05C7rTomplqbpiedqzC9uvXE+w=
X-Google-Smtp-Source: AGHT+IE15gUn9K7p+MAoiUp78PHfvPFV8p3z4lXTdH0WVzVhQJC7geJvFnoRawPbvYwyDQxTWNWSLhDT2MuUwDpIUfo=
X-Received: by 2002:a05:6512:10c9:b0:507:aa8d:a572 with SMTP id
 k9-20020a05651210c900b00507aa8da572mr9566227lfg.49.1698115892433; Mon, 23 Oct
 2023 19:51:32 -0700 (PDT)
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
 <CAH2r5msNf9WDHrBZSi5FhHDSewSNxMAuXTetMJDnoNh3CF_oMA@mail.gmail.com>
 <a895f860-11fa-e6d9-d042-a32bd08f9e9d@talpey.com> <CAH2r5mszCxPtdURenMVgeVDX5zc8knumH=ASXyUufPa7SxbJBw@mail.gmail.com>
 <ZRN9MtBqYnT6oX60@vaarsuvius> <85d538fec5a086acf62d5a803056586a6c00e4bd.camel@uniklinik-freiburg.de>
 <83d00d50bc628a85db71adb440d8afb5@matoro.tk> <E1F307C7-9B1E-40F6-860B-6050856E8395@manguebit.com>
 <CA6E0F87-65FD-4672-AA0C-A761E5006B7D@manguebit.com> <CAH2r5mse_2sfXF+tdTmie5LLtBuc+6DOumDH3rn=5V24yhrYVQ@mail.gmail.com>
 <c88b2ecd27524153c2acd8aba6ae3c80@matoro.tk> <457a5483c3c4ca5bb6c7ec6f4231074c.pc@manguebit.com>
 <779ef3ac542e7e39027dee19d669ad2f81b05bcc.camel@uniklinik-freiburg.de> <b8e37bfc992532038f9d562f5596cbf3.pc@manguebit.com>
In-Reply-To: <b8e37bfc992532038f9d562f5596cbf3.pc@manguebit.com>
From: Steve French <smfrench@gmail.com>
Date: Mon, 23 Oct 2023 21:51:21 -0500
Message-ID: <CAH2r5muM71aR9gwgu7ep0dP3SBTkMjVnH5OmXz5JEiB2JsuBBw@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: Paulo Alcantara <pc@manguebit.com>
Cc: "Dr. Bernd Feige" <bernd.feige@uniklinik-freiburg.de>, 
	"matoro_mailinglist_kernel@matoro.tk" <matoro_mailinglist_kernel@matoro.tk>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>, "bagasdotme@gmail.com" <bagasdotme@gmail.com>, 
	"paul@darkrain42.org" <paul@darkrain42.org>, "tom@talpey.com" <tom@talpey.com>, 
	"ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>, 
	"bharathsm@microsoft.com" <bharathsm@microsoft.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"brian.pardy@gmail.com" <brian.pardy@gmail.com>, "nspmangalore@gmail.com" <nspmangalore@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We probably want this one as well ...

commit 2da338ff752a2789470d733111a5241f30026675
Author: Steve French <stfrench@microsoft.com>
Date:   Tue Sep 19 11:35:53 2023 -0500

    smb3: do not start laundromat thread when dir leases
     disabled

    When no directory lease support, or for IPC shares where directories
    can not be opened, do not start an unneeded laundromat thread for
    that mount (it wastes resources).

    Fixes: d14de8067e3f ("cifs: Add a laundromat thread for cached director=
ies")
    Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>
    Acked-by: Tom Talpey <tom@talpey.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>



Any objections to adding that one to the list as well?  The patches
all seem to apply fine to current 6.5-stable-rc

On Mon, Oct 23, 2023 at 9:07=E2=80=AFAM Paulo Alcantara <pc@manguebit.com> =
wrote:
>
> "Dr. Bernd Feige" <bernd.feige@uniklinik-freiburg.de> writes:
>
> > I can confirm that the patches apply cleanly on 6.5.8 and help a lot
> > with the issue here (vers=3D3.1.1, gentoo client, MS AD server with DFS=
).
>
> Thanks for testing it.
>
> Steve, I would suggest below commits for v6.5.y
>
>         238b351d0935 ("smb3: allow controlling length of time directory e=
ntries are cached with dir leases")
>         6a50d71d0fff ("smb3: allow controlling maximum number of cached d=
irectories")
>         2da338ff752a ("smb3: do not start laundromat thread when dir leas=
es  disabled")
>         e95f3f744650 ("smb: client: make laundromat a delayed worker")
>         81ba10959970 ("smb: client: prevent new fids from being removed b=
y laundromat")
>
> If OK, please ask stable team to pick those up.



--=20
Thanks,

Steve

Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC455235
	for <regressions@lists.linux.dev>; Sat,  7 Oct 2023 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwEQknz0"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d8195078f69so3480055276.3
        for <regressions@lists.linux.dev>; Sat, 07 Oct 2023 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696708820; x=1697313620; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwM1iWct0z/jMK9BzYjRLXMP58MQWKX6vFsJvwxFbqE=;
        b=fwEQknz0fqbWKrcKjRFkP5mQAAiRWnnqzmt9R5GNHZmVbQG1G+aYAlwKAsay6hXING
         L5vnReFKjL3bK4X1I6oXsa7tjeHOK6gMiDqYq00/Hm1p5hn5EswktHzui+kUS5Nhv945
         IWbnI4BGcZZTPInZGHYmRnYDeEx01HyZLxbfy4xeNG/U0wUCkOsy0KD/GWk+duWCQxjH
         Y41dg1VKfOORAEwABwBr5Irwmb60RlrYpiA1A49+Am2ew+gqUi9SnycngE7MH4pcS8Ob
         gkbc//lfP7jjJ+DpfeAM9HPtNBVjEHdcLBpwMX9c4mQS/umJlmPwsRdEL8s4tRfY37z6
         KMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696708820; x=1697313620;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwM1iWct0z/jMK9BzYjRLXMP58MQWKX6vFsJvwxFbqE=;
        b=C9IMHmWwXxovsl0brqlIqOLpE0TExU/dteCoprjZyuCv/F5FakQT+pwYfgjCaXnFzu
         3h5j0HNwSlj47qKLZg3Yy9Z+WFDIGUP2t9HLHaMNWEoO7WHUD22WDTZNaUL4evYOrAcU
         izkBGvkhb/mmukp2akCKXWl+/G7oI6vOcFNosypY/go0mZrr1gAUgEdX2IXtDz4sYSbV
         OccAjsxPydU/J9XHPGB+ReCMK0JwqgEw3H3Swli/eWobUDuoYDTFqaBPoDQOgPJc93fk
         U4Z/NdHg4oesvlE+TwNlt87P3UjN9byvU9LZqHKmGc6rVCqTe9+QdOgPmXQwdp1vAsxI
         CQuw==
X-Gm-Message-State: AOJu0YyuLs8FaWuGo2nM0qr9jjdXrxfpYBOYdzRZ0KlblEmnhnheFBiM
	x0Q5VD31XzcpJPWHWKL2krGhHVhqnAfTvzIa7zyLlZAy
X-Google-Smtp-Source: AGHT+IHrBBXRlqMc1vpg0AkBL7jmHXsGapipcAcnw7eZvGVUdXj7wOAr1KpaIbT5wkkGIS8bzb5OSqi+j0rb5rPWhEo=
X-Received: by 2002:a25:d18a:0:b0:d84:b0f8:90e with SMTP id
 i132-20020a25d18a000000b00d84b0f8090emr10965962ybg.5.1696708819772; Sat, 07
 Oct 2023 13:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me> <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com>
 <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
 <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com>
 <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info> <CAH7-e5v6jQyjeYDYr0zRXw_7XsdD1M2bbsBBcg0MZ3nZifhJ4g@mail.gmail.com>
 <14ca8dd4-655f-4935-bf46-a9fbc024ad6f@leemhuis.info>
In-Reply-To: <14ca8dd4-655f-4935-bf46-a9fbc024ad6f@leemhuis.info>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Sat, 7 Oct 2023 22:00:09 +0200
Message-ID: <CAH7-e5vo2ysfpr4_z+cny+0c_iqKSEnJErx+a=8Mj9i12sr3SA@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Oct 2023 at 10:28, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 05.10.23 17:11, Erik Dob=C3=A1k wrote:
> > On Wed, 4 Oct 2023 at 07:20, Linux regression tracking (Thorsten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> >>
> >> On 03.10.23 18:10, Erik Dob=C3=A1k wrote:
> >>> Sorry Tomasz,
> >>>
> >>> that must have been a reality glitch with your commit (cant find the
> >>> page refering to your commit now). But yes it is probably a kernel bu=
g
> >>> as it manifests kernels 6.4 and not in the 6.1 LTS version.
> >>
> >> Could you then please try a bisection to get us closer to the problem?
> >> You might want to try mainline (e.g. 6.6-rc4) first, with a bit of luc=
k
> >> the problem is fixed there already; FWIW, a few BT fixes that might or
> >> might not be relevant for your case are heading that way and will most
> >> likely be in 6.6-rc5.
> >
> > after more than a day of netto compile time my bisection goes as follow=
ing:
> > kernelbuild:
> >
>
> That's not what I meant with a bisection. I...
>
> >
> > I could compile the latest 6.2 kernel maybe things will get better and
> > i can test again.
> > But it seams that this is a pre 6.4 issue not like the article on the
> > world wide interwebs says.
> > In theory we could assume that it happened between 6.1latest-artix and
> > 6.2first-vanilla
> >
> > What do you propose now?
>
> ...meant a bisection between a working vanilla version (apparently 6.1 =
=E2=80=93
> but ensure you try with vanilla first, maybe "latest-artix" contained
> patches to make things work) using "git bisect". Such a bisection finds
> the commit that broke things and often requires compiling ~15 kernels.
>
> Ciao, Thorsten
in the meantime my artix lts kernel changed to 6.1.64 and bt stopped
to discover. i better compile the kernels again to compare but first i
need to setup distcc here. give me some time.
E

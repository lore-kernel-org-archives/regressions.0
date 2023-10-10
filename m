Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5733219E
	for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFwuVYN8"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d84c24a810dso6842289276.2
        for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696966973; x=1697571773; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb9/UBoU+sGxRk0+u2fOuV25K17fyjzmVgFaVOOXY7U=;
        b=eFwuVYN8DZYvSeGw5cOFA9DlGf0fZhT1Ihq0CuuhZAjOEa57unth2KEppgn8XTygEY
         r3VlA7j6lmz+NxKzQiVKG5QCZH8KO9ntPqiR9wPvgfaDOmlbGOuEEPnyj8xZhB2fYkCb
         x/aDYhx6QR45wzE5PWMsyLN+1uryLdCbgju88iHUqF7kjNyOsJaSgflFEBSdfnjTUVvS
         RsC4O0KjTK3DhYs93jCq2GkBY9N7WWm5wS3+UvDFQV/TtZVuZ4kUXcWrdYI1cEOb9UPl
         As+izMJjH1+h1osjS5WjqC68yTJBblbhbHEbpwQyirmPiw28GUP4p6H+GAEJX1s6F1FT
         D0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696966973; x=1697571773;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nb9/UBoU+sGxRk0+u2fOuV25K17fyjzmVgFaVOOXY7U=;
        b=Rz5XqAaTmKC7MmqdMhpOb9X/f7zCKkyeaZ3Ei4lHXP5vNnGJvnPQdV8rjh6FFwFAlu
         AW4ZvBEr0bVRCIfTGxGTWrRgRao0BJ3QDjlLzneBeACSrg7Ve/3ikfN4WrmjlTN64myP
         Wbq1zxcdU/q0gRYiq2hSYQSq0Mqkvw748r4yNUsV3rdQTDlvD4JRoljhTs/1m54EwhRG
         +9BhU3iqJyFAMiMN44Wfe7YR5v/XDOqhIyPwVoG4B4EbtX8gmRwyn48ZBwwQA/2h9oVP
         P8c7H1u7ZOC0MDPsH32KWA51m4lZp194cYDYEmt/Nps+lcj4iegGUXXyOeiqI+otRN2Q
         KbCQ==
X-Gm-Message-State: AOJu0YysYuO4WfmuRJKO91qiNOWPw39Mmi4IDoAVudn21NnwseuIDCnt
	s6rm/9XWA+00jgK49NsqXehck1EIcNJDUerZXQaHCAp3GK4=
X-Google-Smtp-Source: AGHT+IHiufhTlSC7p8PmsI7qdcQykATMovF4tKxYBER7xQtnXt+kkv2q3vD+VDYTfFHxSqg00G5KpDEQ7gEBYaav/xo=
X-Received: by 2002:a25:21c2:0:b0:d00:cc5b:8a9f with SMTP id
 h185-20020a2521c2000000b00d00cc5b8a9fmr15332469ybh.16.1696966973083; Tue, 10
 Oct 2023 12:42:53 -0700 (PDT)
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
 <14ca8dd4-655f-4935-bf46-a9fbc024ad6f@leemhuis.info> <CAH7-e5vo2ysfpr4_z+cny+0c_iqKSEnJErx+a=8Mj9i12sr3SA@mail.gmail.com>
In-Reply-To: <CAH7-e5vo2ysfpr4_z+cny+0c_iqKSEnJErx+a=8Mj9i12sr3SA@mail.gmail.com>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Tue, 10 Oct 2023 21:42:41 +0200
Message-ID: <CAH7-e5s+omk3tJCaUF3skLWDJ_VCufYonEUQK=7_UvusD04xDw@mail.gmail.com>
Subject: Fwd: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Erik Dob=C3=A1k <erik.dobak@gmail.com>
Date: Sat, 7 Oct 2023 at 22:00
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other
bt devices - /linux/drivers/bluetooth/btusb.c
To: Linux regressions mailing list <regressions@lists.linux.dev>


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

---edit----

well. did setup the distcc. compiled vanilla 6.1.38 and 6.1.55 and
what a surprise both of those did not have a discovering BT.
unfortunately i cant get the LTS Artix version of 6.1.38.

thank you for your support i rest my case.

E

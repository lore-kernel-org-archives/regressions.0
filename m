Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D2236B
	for <regressions@lists.linux.dev>; Thu,  3 Mar 2022 01:27:24 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id i11so5848110lfu.3
        for <regressions@lists.linux.dev>; Wed, 02 Mar 2022 17:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NJ2B08gabJYFOVfBFYdoJ25PiQBivMoWx7JQUDugqj8=;
        b=XK9g8de1WlKR4Ep1aunBAzRbzL518T38TZYa+51FTG7FvSU8eLsi/nPu656mKCH3tV
         JH4GFqGnnFtf2my/pCAoyx47iWRGwifeiqCC/OsIPznUnTM480n+pYXRyVT1Jr4LcZE8
         osGTSqU24WTVrl81+DZWGMqkEbT7dv4j0f8NPM48OMpy9n5HTOl7X7M6MLLk8ySG6qbE
         7HyxRjPwSLMvCIi+2Ltqij3/T/09vIWT4r8KR53HvfWG4TeSGu2Pi9/mWCuB+2UympSV
         7sH0wXU9YBz8I3fn6OtNut9/J79iOUxbLowji/gOK4aMzilo1tkX7lJaqiH6QF6+LQFk
         V+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NJ2B08gabJYFOVfBFYdoJ25PiQBivMoWx7JQUDugqj8=;
        b=Xjun+QbgAaqe952RVf2oBZFTMhrHxcUIs2Ps2dNAWZP54pjvSbxkSc2V9zvwyr4x40
         sdBOKdPjjp5gQekZ2AcS06OfFzXarcNEzpVGfwq3Mem2f3pT9hjJCiUW+LSy6jYDkTP/
         4dWY5u6zaqKmzDf1bw2xgLcxeG2RUadhijbWVmVsxq39azNlGYZbJG4GbAgfdXFcTfRj
         u7zceF/dFn8QtkPy5j3Az5wAMON88LlQZKYAv6g0eO2/k3+Rb01I0x9D9BCcoZTmvviF
         ixRCa7qzfCWwzgNVd0T2iO73C0PHtXl7cheaLlh7g8p4QMZh9oRzvctMqyNEx1SnLaal
         teFA==
X-Gm-Message-State: AOAM533DOeRHrb58hJ1WwPbXxVb+mg/IkgQ+DvzFBw6QmBcLgZwsz68w
	c2vTwq6Xz33eCCw0BaRggaTmh6N1t+SvmLN2+37DNWwedaE=
X-Google-Smtp-Source: ABdhPJybVffnhsMu3mAEUolbs46+nnRBt8avMFeRcwJ2+g9t25FCJJ53mhJ8wrGGNqA36LrGqEDGOHuh7DCGTPUkUik=
X-Received: by 2002:ac2:5c11:0:b0:445:b993:bfff with SMTP id
 r17-20020ac25c11000000b00445b993bfffmr3943357lfp.595.1646270842893; Wed, 02
 Mar 2022 17:27:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJjP=Bt52AW_w2sKnM=MbckPkH1hevPMJVWm_Wf+wThmR72YTg@mail.gmail.com>
 <CAH2r5mt_2f==5reyc0HmMLvYJVmP4Enykwauo+LQoFGFbVFeRQ@mail.gmail.com>
 <CAJjP=BvNVOj3KRnhFgk6xiwnxVhxE-sN98-pr6e1Kzc5Xg5EvQ@mail.gmail.com>
 <CAH2r5mvsetx5G+c=8ePh+X8ng7FvMrnuM9+FJ4Sid4b3E+T41Q@mail.gmail.com>
 <CAJjP=BvqZUnJPq=C0OUKbXr=mbJd7a6YDSJC-sNY1j_33_e-uw@mail.gmail.com>
 <CAN05THSGwCKckQoeB6D91iBv0Sed+ethK7tde7GSc1UzS-0OYg@mail.gmail.com>
 <CAJjP=BvcWrF-k_sFxak1mgHAHVVS7_JZow+h_47XB1VzG2+Drw@mail.gmail.com>
 <ebf8c487-0377-834e-fbb7-725cceae1fbb@leemhuis.info> <CAN05THRJJj48ueb34t18Yj=JYuhiwZ8hTvOssX4D6XhNpjx-bg@mail.gmail.com>
 <f7eb4a3e-9799-3fe4-d464-d84dd9e64510@leemhuis.info> <CAJjP=Bus1_ce4vbHXpiou1WrSe8a61U1NzGm4XvN5fYCPGNikA@mail.gmail.com>
 <fe156bb6-c6d2-57da-7f62-57d2972bf1ae@leemhuis.info> <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Wed, 2 Mar 2022 19:27:11 -0600
Message-ID: <CAH2r5mvQnQTDQaci-NbLBjRb=gCPtMewrKhLBOLGrN2_Zpc3Bg@mail.gmail.com>
Subject: Re: Possible regression: unable to mount CIFS 1.0 shares from older
 machines since 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Davyd McColl <davydm@gmail.com>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

We have been looking to see if we could setup some VMs for something
that old, and we are willing to test against it if it could
realistically be setup, but it has been harder than expected.  Ronnie
had some ideas and we are willing to experiment more but realistically
it is very hard to deal with 'legacy museum style' unless we have some
VMs available for old systems.

Feel free to contact Ronnie and me or Shyam etc (offline if easier) if
you have ideas on how to setup something like this.   We don't want to
be encouraging SMB1, but certainly not NTLMv1 auth with SMB1 given its
security weaknesses (especially given the particular uses hackers have
made of 25+ year old NTLMv1 weaknesses).

On Wed, Mar 2, 2022 at 6:51 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 1, 2022 at 10:58 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > Thx for the update. I pointed Linus towards this thread two times now,
> > but he didn't comment on it afaics. CCing him now, maybe that will to
> > the trick.
>
> So I have to admit that I think it's a 20+ year old legacy and
> insecure protocol that nobody should be using.
>
> When the maintainer can't really even test it, and it really has been
> deprecated that long, I get the feeling that somebody who wants it to
> be maintained will need to do that job himself.
>
> This seems to be a _very_ niche thing, possibly legacy museum style
> equipment, and maybe using an older kernel ends up being the answer if
> nobody steps up and maintains it as an external patch.
>
>              Linus



-- 
Thanks,

Steve

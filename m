Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C84566C
	for <regressions@lists.linux.dev>; Mon,  6 Mar 2023 17:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13931C4339C
	for <regressions@lists.linux.dev>; Mon,  6 Mar 2023 17:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678124929;
	bh=p+285oYfxGT6oBTqHONjb6ZZM55PJciuUnjkNQRO/l8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mLukCiu6l58LxMHAFOYSqQ4tDWy7q06yDh7VqDDp6QPQEu+lL8E2cmYL2RViflJMl
	 HBscU23mm//Dr/O3xDo/uCvbaCP1w2RRDHfiQaKnvYBPn24+sQeWtLkGA6kYYrQZC8
	 420Av6Crf12BbjSeH5z/C99Q20K6JTHpOgAwaeYLG1EeASUMNePxPHzOcs3dLfZ6xe
	 Cjf5beR8XB3IgiqtB4IX6LpDWjnhnUVWQRGtZspfftRWxUbgOeo81ecwU7LKEZNTiD
	 29ZYgnmooHENwAexUIstb8rtfNEjvSTZ3lp7ai8Rt+fZ0oFF6Wa0Rh5JQxgVGPC36Y
	 ZY4benJ/1LLBQ==
Received: by mail-lf1-f50.google.com with SMTP id j11so13801159lfg.13
        for <regressions@lists.linux.dev>; Mon, 06 Mar 2023 09:48:48 -0800 (PST)
X-Gm-Message-State: AO0yUKWoMovZWcYfVN1pHstPbx2v2UrYhYof9z4qSkrFMGUUFA52hRuT
	YqewbhdQOQlsM0E+bQnBCpz6bxW7s+/Im+trfXk=
X-Google-Smtp-Source: AK7set96s98VtUg4tvq8jDeVcoN4cW8Y4Vt0icc1TFcZ9YMAnc7rz9TIMDGuN7rDsHZUSneArEil7nQkSsY+3mQdkcE=
X-Received: by 2002:ac2:5ece:0:b0:4dd:a74d:aca3 with SMTP id
 d14-20020ac25ece000000b004dda74daca3mr3592321lfq.3.1678124927094; Mon, 06 Mar
 2023 09:48:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a13cd3b5-cc41-bf2f-c8ac-e031ad0d5dd7@leemhuis.info>
 <CAPhsuW7ZWthh0PZt71hQh1_51C0yMSpOqWYJKc_+VzzTmW_r5A@mail.gmail.com> <167805126796.8008.3635368722810568057@noble.neil.brown.name>
In-Reply-To: <167805126796.8008.3635368722810568057@noble.neil.brown.name>
From: Song Liu <song@kernel.org>
Date: Mon, 6 Mar 2023 09:48:34 -0800
X-Gmail-Original-Message-ID: <CAPhsuW64R2ze1AYZhEmQcGf0cKBjjX=4EZZowD+=Cr=VPg1QYg@mail.gmail.com>
Message-ID: <CAPhsuW64R2ze1AYZhEmQcGf0cKBjjX=4EZZowD+=Cr=VPg1QYg@mail.gmail.com>
Subject: Re: [regression] Bug 217074 - upgrading to kernel 6.1.12 from 5.15.x
 can no longer assemble software raid0
To: NeilBrown <neilb@suse.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Jes.Sorensen@gmail.com, 
	linux-raid <linux-raid@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Nikolay Kichukov <hijacker@oldum.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 5, 2023 at 1:21=E2=80=AFPM NeilBrown <neilb@suse.de> wrote:
>
> On Sat, 04 Mar 2023, Song Liu wrote:
> > + Jes.
> >
> > It appeared to me that we can assemble the array if we have any of the
> > following:
> > 1. Enable CONFIG_BLOCK_LEGACY_AUTOLOAD;
> > 2. Have a valid /etc/mdadm.conf;
> > 3. Update mdadm to handle this case. (I tried some ugly hacks, which wo=
rked but
> >     weren't clean).
> >
> > Since we eventually would like to get rid of CONFIG_BLOCK_LEGACY_AUTOLO=
AD, I
> > think we need mdadm to handle this properly. But the logistics might
> > be complicated, as
> > mdadm are shipped separately.
> >
> > Jes, what do you think about this? AFAICT, we need to update the logic =
in
> > mdopen.c:create_mddev().
>
> mdadm already handles this, but only if
>    CREATE names=3Dyes
> is present in /etc/mdadm.conf
>
> Maybe we should flip the default for the next mdadm release, and patch
> the kernel (with a stable backport) to select BLOCK_LEGACY_AUTOLOAD if
> BLK_DEV_MD=3Dm
> Then revert that - say - 6 months after the new mdadm is released.

I like this idea. I guess we also need to select BLOCK_LEGACY_AUTOLOAD
if BLK_DEV_MD=3Dy?

Thanks,
Song

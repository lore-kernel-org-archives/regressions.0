Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2FF2135B9
	for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562491; cv=none; b=M50rIs2JFHStSZfpbCn2oqymVaUrXoC+rKRQVjE16CBheUIXhnoHlA41OJVUMQKwU97o6fbG0b1jEKUmlrSNlM2zKjFftRqfOBLKptwBdBllVf7+0ShEOdkGhIof4XkFy3dfyAsf+3w5+ijEjiGfsQ9Q+IxAzjlr93CNUgx4GFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562491; c=relaxed/simple;
	bh=L90sZMVSRI61zDd+r0xCrvsVnNL+fFVXJgWGwi3VFZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RubiP60SDSZXEyYZGIpN7Fg+syJ7vYGzU3Ukm8l+vyTzhjfRuehiBk0j21H5g5s8XvTc5xHTWWh0Z3Ta1AwvFKGLLWOF/8kWns2QKTxFrqqACr+Vq+TYu0Bg21FHGPJyvkVVzKmVwPC4ZQbzTm9slieijFprUkRM13vsN6uvb7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpfDFxgf; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpfDFxgf"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5188b485988so2147390e0c.3
        for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 08:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737562485; x=1738167285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L90sZMVSRI61zDd+r0xCrvsVnNL+fFVXJgWGwi3VFZs=;
        b=UpfDFxgf9oSq6ims9rN6q6XWqxom6pGFu56EGo1bNjtAobrYilX9puhqYaXTnEbShq
         UWgd3gUzURtV7GFmH2H8gmBM3zpx0+VoPEghK5lxpRqXD2hqgxAsWPO6EJJZ82i/LFDb
         IYiaBXkm0sKEJMW8hhZ510VhqXAq9kGBloE4oxNmYXT5t/KizA2DrtegQElrrPUoflIm
         d+Jmc2a1x5NGub9JFJL0ATFvch5texZKLJhufVnT4JT1HPENMsVcZHm7fiDIxIQKQ4lK
         CvkCEfp8cCSEQXIdRdxwcGvP/7fxS6Yv675K5UMyyvpQXnCTYBMAycTJR75MvJWt57io
         a4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737562485; x=1738167285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L90sZMVSRI61zDd+r0xCrvsVnNL+fFVXJgWGwi3VFZs=;
        b=Dj98BBnuiLYhTDYfKm1c/t2RyYns2WsPVnGQKkHA/WMZ8cMNVVmVfwjpHEjltjfszS
         5EudJ98YrvxGfV+rkuNBriB06muIvsgUAk6peLGyMTuJgO5HXusk77eBxSOdlgTLJ9PZ
         74ZcYIyWbTvlGM0yw4W/q77OFrE047ghmF9Z8hhWyjIu7rVPsI7w7A3MagjUL5MInP3r
         heGnTUmPim9DaYMvPAFEg2Xp7yeQ21XNGdb1EhGq2i2oq86irniG5RzcCsWMDEHdnqNj
         Z0/FugW0nNfl3UrkR8obO3fhd3esPkUPtCAdNnrdYekLxaRd3HoSYavanftpMKP4e8pN
         NUoA==
X-Forwarded-Encrypted: i=1; AJvYcCWVARbHw2STbYNX2AXR3JfL+Co8n1j5VHKHGZBSfsHYGUs+HcmdmDHQI0MTDDH9JsehfMXwOlLdd32IbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDIgTR/0mLez1ZbpD6E3s6U13Up+3gA0bDQtxkJ2+Sy/+0dPoH
	FDnsF43bzxCDyo/AG0jG/YDsco3Nz/bULSi0VPsOObvXhERASK7MOpzif+yTe33Z4n+3Ew5XER+
	CiMH91NacJtzHSRONmRY2fDAk5Rg=
X-Gm-Gg: ASbGncuJU9VZ9MLRaza61NpalmyFQWEAS139fN4Q4P76HmEcbmthcu87A/ERPvR5q7n
	DTGTpqjPd4ubGFirbAoKSpXI89qcah5n/dhov79ujV30swSecCQ==
X-Google-Smtp-Source: AGHT+IH9Ho83lBV6TMHgYgljDAwNsqtklElSNEk9D5aJEBsAKrdJ/QgR1X1viYVpeLp+Sc9VJAf6nhfXBEx1VpGYIzY=
X-Received: by 2002:a05:6122:3704:b0:50a:b604:2bb2 with SMTP id
 71dfb90a1353d-51d5b39b8a2mr18644132e0c.11.1737562485302; Wed, 22 Jan 2025
 08:14:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-7QEMKA+LUAzFJ+srmRCzSuLk2G7shWt0SGR9SfmxwOjA@mail.gmail.com>
 <CAGxU2F4_59X-Fj7vRCoDqM394699uxqLQZ5yCuH+jXUYcYO81g@mail.gmail.com>
 <CAGxU2F40eWaLxS8tsQaFeQ_ndjwdQXMj7VghH3VidcbkcVPrgw@mail.gmail.com>
 <CACW2H-4UivUO+aVt-Bb7GGwxLWite7hKSBzJ5WhSXyvWCkh8bg@mail.gmail.com>
 <CAGxU2F57EgVGbPifRuCvrUVjx06mrOXNdLcPdqhV9bdM0VqGvg@mail.gmail.com> <CAGxU2F4F2jETc9+NFi=9xNkthAbRDOKCVa4-UeOpyfzHjtLdeg@mail.gmail.com>
In-Reply-To: <CAGxU2F4F2jETc9+NFi=9xNkthAbRDOKCVa4-UeOpyfzHjtLdeg@mail.gmail.com>
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Wed, 22 Jan 2025 11:14:34 -0500
X-Gm-Features: AWEUYZmZcU1GmKMuuZTPJ57CKZtgRLQaOvxIv78qf1vkO56jfpONopN1Ypi4Jw8
Message-ID: <CACW2H-4Z6PTUrQQas=YGeM4vjxSPbw3iBm3=dymPUiMsWvbT3A@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.10.1
 and kernel 6.6.70
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: heruoqing@iscas.ac.cn, Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin KaFai Lau <kafai@fb.com>, Kuniyuki Iwashima <kuniyu@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks so much Stefano and to Moritz Sanft
https://github.com/containerd/ttrpc-rust/pull/280

We've rebuilt and everything is again working as expected - all resolved.

Thanks again everyone
-Simon

On Wed, Jan 22, 2025 at 6:12=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Wed, 22 Jan 2025 at 10:23, Stefano Garzarella <sgarzare@redhat.com> wr=
ote:
> >
> > CCing Ruoqing He
> >
> > On Wed, 22 Jan 2025 at 04:48, Simon Kaegi <simon.kaegi@gmail.com> wrote=
:
> > >
> > > Thanks Stefano,
> > >
> > > The feedback about vsock expectations was exactly what I was hoping
> > > you could provide.
> >
> > You're welcome ;-)
> >
> > >
> > > In the Kata agent we're not directly setting SO_REUSEPORT as a socket
> > > option so I think what you suggest where SO_REUSEORT is being set
> > > indiscriminately is happening a layer down perhaps in the tokio or ni=
x
> > > crates we use. I unfortunately do not have an easy way to reproduce
> > > the problem without setting up kata containers and what's more you
> > > need to then rebuild a recent kata flavoured minimal kernel to see th=
e
> > > issue.
> >
> > I talked with Ruoqing He yesterday about this issue since he knows
> > Kata better than me :-)
> >
> > He pointed out that Kata is using ttrpc-rust and he shared with me this=
 code:
> > https://github.com/containerd/ttrpc-rust/blob/0610015a92c340c6d88f81c0d=
6f9f449dfd0ecba/src/common.rs#L175
> >
> > The change (setting SO_REUSEPORT) was introduced more than 4 years
> > ago, but I honestly don't think it solved the problem mentioned in the
> > commit:
> > https://github.com/containerd/ttrpc-rust/commit/9ac87828ee870ecf5fb5fea=
a45cc0c9e3d34e236
> > So far it didn't give any problems because it was allowed on every
> > socket, but effectively it was a NOP for AF_VSOCK.
> >
> > IIUC that code, it supports 2 address families: AF_VSOCK and AF_UNIX.
> > For AF_VSOCK we've made it clear that SO_REUSEPORT is useless, but for
> > AF_UNIX it's even more useless since there's no concept of a port, so
> > in my opinion `setsockopt(fd, sockopt::ReusePort, &true)?;` can be
> > removed completely.
> > Or at least not fail the entire function if it's unsupported, whereas
> > now it fails and the next bind is not done.
> >
> > I don't know where this code is called, but removing that line is
> > likely to make everything work correctly.
>
> It looks like they already released a new version of ttrpc to fix it:
> https://github.com/containerd/ttrpc-rust/pull/281
>
> And Kata is updating its dependency:
> https://github.com/kata-containers/kata-containers/pull/10775
>
> I hope it will fix your issue!
>
> Stefano
>

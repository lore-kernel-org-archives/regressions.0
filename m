Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3A184523
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829247; cv=none; b=CZXYRxXVfYr76Jt1uUoS+JCmhneHGcYxgzdavJceAgW19rBjNLjQPlbeqY6rZuXVs89YDsUpbu+NMgr5fjqMTtA5/Ls2iK9W1IqudL5oCx0ZnljsO1ziB8OtyACn24o5RrBQKZgtyYN5Fh2iM9HEPeeV6hQJQDZeoIwBk1VnzxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829247; c=relaxed/simple;
	bh=nxRGfdKu402C7VQamMw8fwDXVn8rXiAjwz8nAg5lvSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrxUhXRPFcm7sGB5zlcOIrhrOyaVuuIg0wC6MdDTL9WJSSP2WVguL5ndZ8NNilFfYKAQWqPdzLcDAOW9XmseZ4tBXrgJyMsxxsWHK3D1WlMIjvAcNxLLHAvv9rn4EBdTK6qrfvVh+mB1FQeU6amjatOifj6LQM8wuuZVVlXu/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCmu1y2X; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCmu1y2X"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so54982281fa.0
        for <regressions@lists.linux.dev>; Tue, 05 Nov 2024 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730829243; x=1731434043; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kXhkkwOqtZ3i9+hpxeg/zIGdRdlhB56p/0BEtcthVk=;
        b=SCmu1y2Xva5dU0pfnBk9G1tCctxhv5fyi97fySo/TyJ29QE6XbyQWSSUYOKhkBYZBm
         UU2oNullpwxOOaOm7/EBn+JyIioQryFlOoGcUy0S5861eJG+iDc4jZTBciP26jLjF3SS
         ruvLW+v4DEF+UbkPrCtKbGLkLzh3lRFM4xwPnH0Bw8qDR/k2Q3OD8pVUEZwAyK3qZUMj
         ysPsZejS/fyGuzmDiSRbmS0Sw4Fd/YbdZqpGlc1jqOKw1leFsHJxbnNvY19bzRoTrJWx
         mP4xsL//Thjp+pW6a8VXyWZIH3FLBiQhQvdjxV063+ZrR4c5AoW2TKIqhPqA+sl3nlbL
         b5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829243; x=1731434043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kXhkkwOqtZ3i9+hpxeg/zIGdRdlhB56p/0BEtcthVk=;
        b=iOMCavcsnbjMwr0n4JI+DRfh4EFYdLuL1Awh5IIxN335DZgcBwf6bm2Rr+hAtLITP5
         u89bBfZj/GLWzUJbILHlJWW7zCsnDuI+7fT2Ib0mg1YhM0tSTQNc3dgOi8Ct9LUr3GM8
         lrZ+D5S59Kvf+NgRSECZHSF7IhS7vP/64fOfKzH1qr8wZofKpq00tvb6URctP3K2dAWl
         dwa1aaxGOgE468hA7HJTB7nbowxKXTp4REQ4cfMj+wax/m2qy9UPekiVZgjnOywM3/4P
         6fOBrSjWzaH4hsHb3qLIhDZUXAHUXQ257zJyuBSIuWFVBeKWBvMHdaaZxmj+VSC8lMHF
         bFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+vbtwV50RlIJIImm1zDij2S/g2rt18ZfeHB/UWCmQdr8YhzPUpWtyumOXg4KX7CCg/aYM1ae81L80mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLo0KqYooZgU8KlrV1YpSTYFZsO0qSSyKOQUBDXJMUwpJtM5KN
	c1vrQKhjOf5wRRFhqY2wb6VAxAlxb08P1LP7UvBhKcuYhoTPBiHi07sNqlWkkl20/ZptuONLsGM
	dJQ0+fZtdxD8JejpCjf4tdgDoZOs=
X-Google-Smtp-Source: AGHT+IHnTvioO+ZZYHqdqnt/q19K68C9bX7vrHrZYEHzFcmtHZberBg5omsQ24nYxgr66Thn3hL5+2edxzlCnjBjP7I=
X-Received: by 2002:a2e:b88e:0:b0:2fa:e658:27b4 with SMTP id
 38308e7fff4ca-2fcbdf5fe55mr177137061fa.4.1730829243022; Tue, 05 Nov 2024
 09:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <30f4b18f-4b96-403c-a0ab-d81809d9888a@gmail.com>
 <c09d4f5b-0c4b-4f57-8955-28a963cc7e16@leemhuis.info> <2024061258-boxy-plaster-7219@gregkh>
 <d5aa11c9-6326-4096-9c29-d9f0d11f83b4@leemhuis.info> <ZyMkvAkZXuoTHFtd@eldamar.lan>
 <ab5e25d8-3381-452e-ad13-5d65c0e12306@leemhuis.info>
In-Reply-To: <ab5e25d8-3381-452e-ad13-5d65c0e12306@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 5 Nov 2024 12:53:50 -0500
Message-ID: <CABBYNZKQAJGzA8th8A7Foiy7YaSFZDpLvLZqDFsVJ3Yzn8C_5g@mail.gmail.com>
Subject: Re: Bluetooth kernel BUG with Intel AX211 (regression in 6.1.83)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Mike <user.service2016@gmail.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Sasha Levin <sashal@kernel.org>, 
	=?UTF-8?Q?Jeremy_Lain=C3=A9?= <jeremy.laine@m4x.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 5, 2024 at 12:29=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 31.10.24 07:33, Salvatore Bonaccorso wrote:
> > On Tue, Jun 18, 2024 at 12:30:18PM +0200, Thorsten Leemhuis wrote:
> >> On 12.06.24 14:04, Greg KH wrote:
> >>> On Thu, Jun 06, 2024 at 12:18:18PM +0200, Thorsten Leemhuis wrote:
> >>>> On 03.06.24 22:03, Mike wrote:
> >>>>> On 29.05.24 11:06, Thorsten Leemhuis wrote:
> >>>>> [...]
> >>>>> I understand that 6.9-rc5[1] worked fine, but I guess it will take =
some
> >>>>> time to be
> >>>>> included in Debian stable, so having a patch for 6.1.x will be much
> >>>>> appreciated.
> >>>>> I do not have the time to follow the vanilla (latest) release as is
> >>>>> likely the case for
> >>>>> many other Linux users.
> >>>>>
> >>>> Still no reaction from the bluetooth developers. Guess they are busy
> >>>> and/or do not care about 6.1.y. In that case:
> >>>>
> >>>> @Greg: do you might have an idea how the 6.1.y commit a13f316e90fdb1
> >>>> ("Bluetooth: hci_conn: Consolidate code for aborting connections") m=
ight
> >>>> cause this or if it's missing some per-requisite? If not I wonder if
> >>>> reverting that patch from 6.1.y might be the best move to resolve th=
is
> >>>> regression. Mike earlier in
> >>>> https://lore.kernel.org/all/c947e600-e126-43ea-9530-0389206bef5e@gma=
il.com/
> >>>> confirmed that this fixed the problem in tests. Jeremy (who started =
the
> >>>> thread and afaics has the same problem) did not reply.
> >>>
> >>> How was this reverted?  I get a bunch of conflicts as this commit was
> >>> added as a dependency of a patch later in the series.
> >>>
> >>> So if this wants to be reverted from 6.1.y, can someone send me the
> >>> revert that has been tested to work?
> >>
> >> Mike, can you help out here, as you apparently managed a revert earlie=
r?
> >> Without you or someone else submitting a revert I fear this won't be
> >> resolved...
> >
> > Trying to reboostrap this, as people running 6.1.112 based kernel
> > seems still hitting the issue, but have not asked yet if it happens as
> > well for 6.114.
> >
> > https://bugs.debian.org/1086447
> >
> > Mike, since I guess you are still as well affected as well, does the
> > issue trigger on 6.1.114 for you and does reverting changes from
> > a13f316e90fdb1 still fix the issue? Can you send your
> > backport/changes?
>
> Hmmm, no reply. Is there maybe someone in that bug that could create and
> test a new revert to finally get this resolved upstream? Seem we
> otherwise are kinda stuck here.

Looks like we didn't tag things like 5af1f84ed13a ("Bluetooth:
hci_sync: Fix UAF on hci_abort_conn_sync") and a239110ee8e0
("Bluetooth: hci_sync: always check if connection is alive before
deleting") that are actually fixes to a13f316e90fdb1.

> Ciao, Thorsten



--=20
Luiz Augusto von Dentz

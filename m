Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A572E417
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 05:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170559; cv=none; b=hagIZDrk3LeBuAzDkEpXVx6eeWf2AtW21WJ3Q32MryE3AgJwM0rg1HgTdANrXVQdwHAraTkeVe6O/YeaOQoexKXNZGuFLhDUZ03qaYFPCZ22qOWuvrt6+GobNEey1zrnvyQMWI+5+eKe5b4DqKIhfFoDxFGGJ6VTAC+SaKF4814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170559; c=relaxed/simple;
	bh=8L5KjEap6e1V2hpP+V8+oD92dlNBh9b7WzaJPZZxRdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLwEJK6XxvLL8oFbwphVjfk9i2rRpuLD1JWTiee9PxHGyDKj0FkhjJQz3CzdBH5EIVyO3vKBMMGaEoKMJLnO2Z8hE6ejnuFzOrD7T2EQGRq7AyvjW9ejY/BrCrdBvg6sMH9W5ZMuH8snClQQFGHso2W1rKMqiYOh8LHnu8XEDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjPKLYrX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjPKLYrX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f21ff4e6dso329969966b.3
        for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 22:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718170555; x=1718775355; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L5KjEap6e1V2hpP+V8+oD92dlNBh9b7WzaJPZZxRdg=;
        b=AjPKLYrXSEsO1+GPrBcCCvuoyfGbB4lrm4BhQakPi9ac+/aFvwy3gNmb01KUjO7dsF
         Pti3rcQj2jLJIpEKVJkc9sZroNGSkn1RVmO64yWaqaLW7Z+qTZk1H8SQ/DwqrUdIu4FU
         9ewnr+GYjXlnI3joY/qrh9Id1f9EjhnYeG7TrhW3epSfqVSNgEyarXMwKyfZ+jXTU76l
         ahd0E4cOBSIx0cQczlUS39cd3fyT22f3WsHpjJJQiAFsFe3iyyuC/lPHy/dpqM2Djd9D
         eGS0gxgWpqDaogHEgG9rM1yi9/XhphMCF19yIpjE9AQJbSUCjlRM6ucacbAODPzAkoXw
         Oa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170555; x=1718775355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8L5KjEap6e1V2hpP+V8+oD92dlNBh9b7WzaJPZZxRdg=;
        b=D9o5FhxGoacPpc8XAIoZvfMBDFmH5oe5iiuBri1x0Qtqvk/z1Yzh7ue5qYgkaCJeDm
         KdaX6yUkg4LdcKxJeljjQZUVhQTTm85T4vY1HgLDgseE88fYV9ZfZzMDY3tf02gVRCjW
         4WGfFp59CC/YBJWElJdUjOgIY4AZtlE/p6P8xHLCeAzN3sSmx9gWxj9eFuxuNxR54Rfa
         kft4snyKvwSY4PZhxmnD8jYqQBWPGKIVuiD3rrf1ma5so7C2dJMP/3klruAB+F7PaLst
         vGRypTWWUGQch31XMs7BJ6bxgBK8Nb3/Rk4pYjzM9XVsbyU0CM8ja6nUeFraCyTOb7Sy
         cAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYFB7VMmuadU+Zno655u9JQxmL56r5RQtoiKajZLSSLRVb22rjBzkt1VI5gNPw7EWoUpG4p+yX9x7hdM0fjAJ2P/76x0JKdfhIDCY=
X-Gm-Message-State: AOJu0YyMqTx6Rme+p6a0oeYRIlOLSyMMUX106GvoN+lRvetodWfGXa+H
	PjVnch0zTp59hDYk1ei8d+qxbhot6RmQ25akkiwjD+Zjf5nfAAvtqqHWpfYrfVskeMa4By7LBV/
	WfyMzhPTUX9Oc1Jw5wcH8YSgXUyk=
X-Google-Smtp-Source: AGHT+IF8SKBpiOztMbBdnJAu8LvJWR9zS9OppOdn8p8Bc2oKTRy6V6W021BkucO7e/Zb7pjngxRNtZ8dop9KON8Mo8I=
X-Received: by 2002:a17:906:a08:b0:a68:a137:d041 with SMTP id
 a640c23a62f3a-a6f47d36659mr35762866b.12.1718170554978; Tue, 11 Jun 2024
 22:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130214911.1863909-1-bvanassche@acm.org> <20240130214911.1863909-12-bvanassche@acm.org>
 <Zmi6QDymvLY5wMgD@surfacebook.localdomain> <678af54a-2f5d-451d-8a4d-9af4d88bfcbb@heusel.eu>
 <9dae2056-792a-4bd0-ab1d-6c545ec781b9@acm.org>
In-Reply-To: <9dae2056-792a-4bd0-ab1d-6c545ec781b9@acm.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 12 Jun 2024 08:35:18 +0300
Message-ID: <CAHp75Vd02o_z2swHQ8Tajyvdi25do3ys7+GMES7RAg0NffgAUA@mail.gmail.com>
Subject: Re: [PATCH v9 11/19] scsi: sd: Translate data lifetime information
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christian Heusel <christian@heusel.eu>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Daejun Park <daejun7.park@samsung.com>, 
	Kanchan Joshi <joshi.k@samsung.com>, Damien Le Moal <dlemoal@kernel.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 2:08=E2=80=AFAM Bart Van Assche <bvanassche@acm.org=
> wrote:
> On 6/11/24 2:21 PM, Christian Heusel wrote:
> > On 24/06/11 11:57PM, Andy Shevchenko wrote:
> >> Tue, Jan 30, 2024 at 01:48:37PM -0800, Bart Van Assche kirjoitti:
> >>> Recently T10 standardized SBC constrained streams. This mechanism all=
ows
> >>> to pass data lifetime information to SCSI devices in the group number
> >>> field. Add support for translating write hint information into a
> >>> permanent stream number in the sd driver. Use WRITE(10) instead of
> >>> WRITE(6) if data lifetime information is present because the WRITE(6)
> >>> command does not have a GROUP NUMBER field.
> >>
> >> This patch broke very badly my connected Garmin FR35 sport watch. The =
boot time
> >> increased by 1 minute along with broken access to USB mass storage.
> >>
> >> On the reboot it takes ages as well.
> >>
> >> Revert of this and one little dependency (unrelated by functional mean=
s) helps.
> >
> > We have tested that the revert fixes the issue on top of v6.10-rc3.
> >
> > Also adding the regressions list in CC and making regzbot aware of this
> > issue.
> >
> >> Details are here: https://gitlab.archlinux.org/archlinux/packaging/pac=
kages/linux/-/issues/60
> >>
> >> P.S. Big thanks to Arch Linux team to help with bisection!
> >
> > If this is fixed adding in a "Reported-by" or "Bisected-by" (depending
> > on what this subsystem uses) for me would be appreciated :)
>
> Thank you Christian for having gone through the painful process of
> bisecting this issue.

> Is the Garmin FR35 Flash device perhaps connected to a USB bus? If so,

Yes. It is written above in my report here.

> this is the second report of a USB storage device that resets if it
> receives a query for the IO Advice Hints Grouping mode page. Does the
> patch below help?

I tested the kernel build from
https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/60=
#note_190857
which claims to have this fix and it fixes my issue.

Reported-and-tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. And please add any suitable tag for Christian, thank you!

--=20
With Best Regards,
Andy Shevchenko

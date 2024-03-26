Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277513D273
	for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 16:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711472308; cv=none; b=AlGMzlzYI7huaN17V/8i8YxnA1P4+jpuWEQRhvFJ0n7lh/EilRwRF9Tl3BBFzZeUe1ganBCT4g9hhaZRI2nbKYY4u4j8P3+r96/3D0AmgV+YWFWp9smm07dRWhtQ2HYkOLBY+HVPqe7QIFGZE8YMJr8ILUtLYL3tTh/PL7H+28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711472308; c=relaxed/simple;
	bh=50BqQDcDVQNITuDK3eJNa0b+mguy7/AkzhyNXxuLwAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIQuEmo5Z0GEqGR9YD2tP5IF4wddFGRUmRi3Szq28+ENRrNtoejjJpT0xeQ3Amn6l50xUYLUErV9tY8l+bFipNTqhEUuM6h17ROwtRmv3SmEepfpuup3jrHX+kzzJPhqoTq8WseS/WcVxpL1NMEG2izE+mTiy1Auk8VrB/oMbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwTLk9EK; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwTLk9EK"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d48f03a8bbso69311fa.0
        for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711472305; x=1712077105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50BqQDcDVQNITuDK3eJNa0b+mguy7/AkzhyNXxuLwAs=;
        b=IwTLk9EK/lYtRwbN8szdRjGaxuhEzBigJD2ihOyRc/DNuE7ip8zqo94chi1r2+Ty6e
         sIlqTxKVulrHtZpak8RC4vIVoUeuFPgVGszttF4iDkCTsyi2Fpt+qebVMwjJp43cyWls
         JXj3hIQNig8xieJYE0VSM+sQ5muW23t1VXF0kgb8mf6hUZNbH5aW/STFQlvwqtt+OiOI
         zi0ymfrrVlpAeLq8tmJuXciKlNBd05CE2Imk+CUj+P7/n+cia25VhFpwsw8Qck03oTHL
         gIhpTTBLx+B6O/mcFMmUp1D3HeiBeIcC7nSaYWsbpgQHrjfRouSzvgTn82Rsh0HMXSTf
         HZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472305; x=1712077105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50BqQDcDVQNITuDK3eJNa0b+mguy7/AkzhyNXxuLwAs=;
        b=b8I7hG9Kcrzs2atChFho7dNbN0YmXwed0SnAHb7eph7tFnL57mhBzrVQ17ap07mNvt
         z/nio2jK3PhYz3yLOO8mfI088i6471c7vTIEu69cbkVbOebIvLinE7UhBX3zHfe7dH6q
         J066B81HH7O8CdBvNacOITMEQ2Ge+FysVeJkHTwt6xPVeQzXQl5FmLZmaoXRNhx1EF9O
         jU89xLD/km3li0LYobZdQKlGy/jexCfzytyouIE+bEjuQ8ugeaS4Cnr1ZIZm7seRndyI
         Zu+5Uep6PgpE7EThIecN3wMb1IQTTzO+ZWt/uWmFTqy7MFSVRTQPypE4WrwbypjGEabO
         zJ4g==
X-Gm-Message-State: AOJu0Yx0U1tDHdyJqWJQl8jGWnRmpwLtekEa7G0mCOUB78FAHJgyBpYl
	wKYzPafG//UCyiv+nmX17l+wRYRHgTEaAEgd3NG70bcizUoZJ5yBI0puGHYJP+UBG972KQ4nU5N
	ap4W2DdE+yFzZFD2XCirJISnepbE=
X-Google-Smtp-Source: AGHT+IEuCe2UdhWsZ9pv7297ZbfrjwO9PvFFV1b1MMnC3eyQey151SCgwgx3p7p9BMN5BYGkpdafNnXXiZTJJYvS5Vg=
X-Received: by 2002:a2e:a374:0:b0:2d4:6d2a:2df7 with SMTP id
 i20-20020a2ea374000000b002d46d2a2df7mr753307ljn.18.1711472304649; Tue, 26 Mar
 2024 09:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABBYNZJ0ukd_8=SFzy8CEwgP7hV5unodca0NZ2zDZh+jPJsEFQ@mail.gmail.com>
 <ZgGzWWV4Lh2Nal--@hovoldconsulting.com> <CABBYNZJaXUhu1A+NyVT-TAJw49zcV6TMdGeVy2F+AVKWBOVC-g@mail.gmail.com>
 <ZgHVFjAZ1uqEiUa2@hovoldconsulting.com> <CABBYNZJUVhNKVD=s+=eYJ1q+j1W8rVSRqM4bKPbxT=TKrnZdoQ@mail.gmail.com>
 <ZgHbPo57UKUxK7G8@hovoldconsulting.com> <CABBYNZJFzDaLdXsdNEP1384JaJEN5E78cgmWfOus_LGOREGsWA@mail.gmail.com>
 <ZgJ0okobGv5nPreG@hovoldconsulting.com> <CABBYNZKJJuPHEwyXFRi8Z=P0GyaY-HdamsxmV8sR+R97ETTmEg@mail.gmail.com>
 <ZgLnOHiCzo5AQzra@hovoldconsulting.com> <ZgL10ur0825LgWVK@hovoldconsulting.com>
In-Reply-To: <ZgL10ur0825LgWVK@hovoldconsulting.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 26 Mar 2024 12:58:12 -0400
Message-ID: <CABBYNZ+1vXi51YbcfqaHTwW+z7OL=yDCuab6X8eDB-q+CoO+7w@mail.gmail.com>
Subject: Re: [PATCH] Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode
 exists in DT"
To: Johan Hovold <johan@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Johan Hovold <johan+linaro@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

On Tue, Mar 26, 2024 at 12:20=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> Hi Luiz,
>
> On Tue, Mar 26, 2024 at 04:18:16PM +0100, Johan Hovold wrote:
> > On Tue, Mar 26, 2024 at 10:17:13AM -0400, Luiz Augusto von Dentz wrote:
> > > On Tue, Mar 26, 2024 at 3:09=E2=80=AFAM Johan Hovold <johan@kernel.or=
g> wrote:
> > > > On Mon, Mar 25, 2024 at 04:31:53PM -0400, Luiz Augusto von Dentz wr=
ote:
>
> > > > > All the
> > > > > CI automation is done on bluetooth-next and if you are asking to =
be
> > > > > done via bluetooth tree which is based on the latest rc that is n=
ot
> > > > > how things works here, we usually first apply to bluetooth-next a=
nd in
> > > > > case it needs to be backported then it later done via pull-reques=
t.
> > > >
> > > > The revert fixes a regression in 6.7-rc7 and should get to Linus as=
 soon
> > > > as possible and I assume you have some way to get fixes into mainli=
ne
> > > > for the current development cycle.
> > >
> > > Yeah I will send it later today to be included in the next rc release
> > > and since it is marked for stable that shall trigger the process of
> > > backporting it.
> > >
> > > > The series fixes a critical bug in the Qualcomm driver and should
> > > > similarly get into mainline as soon as possible to avoid having peo=
ple
> > > > unknowingly start relying on the broken behaviour (reversed address=
).
> > > > The bug in this case is older, but since the bug is severe and we'r=
e
> > > > only at rc1, I don't think this one should wait for 6.10 either.
>
> I just double checked the bluetooth-next branch and everything looks
> good now (revert + endianness fix series). Thanks!
>
> Did I understand you correctly that you'll be able to get all five
> commits into 6.9 during this development cycle (e.g. 6.9-rc2)?

Yep, I will be preparing a pull-request with them later this week,
there are some other fixes that I want to get in as well.


--=20
Luiz Augusto von Dentz

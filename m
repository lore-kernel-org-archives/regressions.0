Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9558314534C
	for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259875; cv=none; b=huhxoU/S5im+nToPIm8pmZA+M8MEXRYPRiPSioSVlREXghM71NXkf6tmWO4YuTJA7Y1qFel0z9iK5qpaTLpj4JnFI2BpqtPklwUOftbAn/ss4WZmfWzXd9t7IrnuqC5p/MJyQw5s0PD5SmEiPxGk2Q7Y0CVmlosahdPRs91RQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259875; c=relaxed/simple;
	bh=dC4StydkvhN4D2FnulCowDb8t4nCXLe2HWtCaL9svbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxgDw684swh9a7zMdB3LmX3bAzUEvwegyQgLEGAqCXlCQmPsYedKQOu05JGb1cCWFclRqO1pkzBq67aGXKHupJVOnwJW/pxZEp+vdntzpwk8H4VaKMmDVu+GRjJxIczgAzyMkkCKw+m+tOLadt+IkP4g4JjaJqxh6ACV+cfoLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hicFyD7T; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hicFyD7T"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f0271b0ae9so44472431fa.1
        for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722259872; x=1722864672; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOY+AlMeRwJs0YCYC6hzJCvRhv1dC+GmSx9gBu2yiuA=;
        b=hicFyD7T93IN/0TFpY/iEGT3/luU851r84Fhk4GXGa6LLkM/mPQmBK293mH0NpRk0O
         rG+EeF8FTx+KIuXqaBbwxa0L2ByraxlTaMC7tICxmcZVqzRmTeWJWkoxDfAWEUIb0QPb
         uNICMlMsE2XJ02z0a++J6ZBibgObtcOsx/K+AvUj/H+fJ8XxjK4Y9zmwKPp/iHNj1KjI
         6ogEI95u8LjEQaAUNYtqcJjIQk23zA5BzQv3a3mOK5W3wROpGc9GmCH0GeGjTjRg6ZDd
         oJiz33nfIr4Ma+QeGjgTYsphOkgurVBfD9y44ZWeyK/OsfILyAZGkfBa0n+b7CHagDMN
         BNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722259872; x=1722864672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOY+AlMeRwJs0YCYC6hzJCvRhv1dC+GmSx9gBu2yiuA=;
        b=oL/SY/xNZN4NHxoTnc1SBDdqyfxs/V7OUXVvUmxPgDY0D1WnKoJImGwTqld75wJhuS
         8o7ylS4F9JM72UXWOJDUfUCvsVv5/PsP1TKTmWKfvK3di9sWknPdJLkNWv7C+q9fNtpB
         R2OkHTT09F5+c41ghFPjmuxxT+Pg06yQGbU6WtBBezy1E65zcCbOz1+kmnH4JOWEK1JW
         6qtHG4xMkT+8DixuT/6r92j8STNaJPDcse0+Eqk62qdYbi/JHoYvHbthxCnCv7I6grkV
         HHTWu5361hSWVV3TThvR9GvUvUhDsAeeOd1ZE2j0CKPZGEipEbvKVDKkLBSUyLfi0UDv
         QPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxXfGvllYUZf2zcjKNTHVvLltbC/YR72P3WhxU66fg7UfECaAGZeTeJ6qaY4JoZqe7F+5ZjooCZ/C2QfqrW7/H2R8yiVOLjhQ7luE=
X-Gm-Message-State: AOJu0Yx7Zn+b2gC9z3SC5KLjYBAmzfdjiBk6lsSap4Ncqsh0LXbfGurn
	GM4Z53oT/Up3StjUOBElp7T50Dgbd9YqTAN3TK0mzCdsBBHDK4KH2FN4Phk+FUd0fju6ycXO/zM
	h7Hq1uR0fymtoVL26Uf3pQDNo81w=
X-Google-Smtp-Source: AGHT+IEkj8gJtt7Xa/PRg0sMhXYsUI0z5cB0Kqpuw44BH7fbPSlxtdi/VtkbDXSJ+OEuJ4+ru7ds3EoONnjafiZrjfk=
X-Received: by 2002:a2e:8710:0:b0:2ef:2f60:1950 with SMTP id
 38308e7fff4ca-2f12ee1bdf2mr47796711fa.30.1722259871270; Mon, 29 Jul 2024
 06:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <su3wp6s44hrxf4ijvsdfzbvv4unu4ycb7kkvwbx6ltdafkldir@4g7ydqm2ap5j>
 <aa9d6aec-ef94-4137-b2ff-0c86d9a92d42@molgen.mpg.de> <CAA8EJpqGXe0A0yDpEP==60k-bPEbDORpLUtsiPvGSi+b_XphAg@mail.gmail.com>
 <CABBYNZJP2c4L-nFHtug0isqnKPR+Q0CE09o_ACsPLobjLpHtcg@mail.gmail.com> <CAMRc=McB1hY+Lad-gBj9-_Ve2OeW+rXaRqHL2xO4zDPMRD41jw@mail.gmail.com>
In-Reply-To: <CAMRc=McB1hY+Lad-gBj9-_Ve2OeW+rXaRqHL2xO4zDPMRD41jw@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 29 Jul 2024 14:30:57 +0100
Message-ID: <CABBYNZJXgJmfe=o2bgj_Gs1wsD=OQRokEkzVRc_OhBs5-_+Dww@mail.gmail.com>
Subject: Re: btqca: crash with linux-next on bt power down
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Marcel Holtmann <marcel@holtmann.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, regressions@lists.linux.dev, 
	Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Mon, Jul 29, 2024 at 12:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Mon, Jul 29, 2024 at 1:56=E2=80=AFPM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Dmitry,
> >
> > On Mon, Jul 29, 2024 at 12:01=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > #regzbot: introduced:
> > > 973dd9c4db4746200f88fe46e30eada7054fdbea..84f9288208dfcd955446060a53a=
dd15b9e01af4e
> > >
> > > On Mon, 29 Jul 2024 at 13:21, Paul Menzel <pmenzel@molgen.mpg.de> wro=
te:
> > > > Am 29.07.24 um 04:11 schrieb Dmitry Baryshkov:
> > > >
> > > > > On Qualcomm Dragonboard 820c (APQ8096, QCA6174) soon after the bo=
ot I
> > > > > observe the following crash:
> > > > >
> > > > > Unable to handle kernel NULL pointer dereference at virtual addre=
ss 0000000000000018
> > > > > Mem abort info:
> > > > >    ESR =3D 0x0000000096000006
> > > > >    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > > > >    SET =3D 0, FnV =3D 0
> > > > >    EA =3D 0, S1PTW =3D 0
> > > > >    FSC =3D 0x06: level 2 translation fault
> > > > > Data abort info:
> > > > >    ISV =3D 0, ISS =3D 0x00000006, ISS2 =3D 0x00000000
> > > > >    CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> > > > >    GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > > > > user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000010da63000
> > > > > [0000000000000018] pgd=3D080000010da62003, p4d=3D080000010da62003=
, pud=3D080000010da61003, pmd=3D0000000000000000
> > > > > Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> > > > > Modules linked in: hci_uart btqca
> > > > > CPU: 2 UID: 0 PID: 66 Comm: kworker/u19:0 Not tainted 6.10.0-next=
-20240726-13923-gd3ce7ebd61f9-dirty #2722
> > > >
> > > > I am unable to find the commit. Your tree also seems dirty. What is=
 the
> > > > last working commit?
> > >
> > > Checked the commit range on the linux-bluetooth branch, hope this hel=
ps.
> >
> > Im currently traveling so it would take some time for me to
> > investigate this but I suspect it could be some of the changes
> > introduced by Bartosz with power sequence, @Bartosz Golaszewski
> > perhaps you can help?
> >
>
> Hi!
>
> I just came back from last week's vacation to a bunch of different
> regressions. I will get to it but it may be later this week.

Thanks, looks like there were other reports saying QCA driver is not
working which perhaps is related.

> Bart



--=20
Luiz Augusto von Dentz

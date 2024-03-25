Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F131B977
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395560; cv=none; b=hMh7oC5t27Yn6uvgWQCnIvNAY3PVK/zZ3OVTg1MNMW0NCIFLUhAZQuzjqRe+BvJW4kgEiBi2a2XgH9X5tbEd04CLxvk3MwhWREiC9/LSzUcGLyPp3AWPiDLLB89tIxd3JdZuhDlzE7DnanC3veapurmNLKsT2tnXmVHVZ/b+t18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395560; c=relaxed/simple;
	bh=CsVUf50sObcUku/mroVotClxV0W8lcZ0puo+cGBDLrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQCafsbMXivNaDfNTRScS/stvuEphcTFPiMi12H22p1/+drodkwr4nF3hVh99m25MhlGlDIacxZgOiEAv0TT8BQhnClr2VLA7cOjGkY//BfTuQT5nsEjShNZcrizXRX7a5M1aP4v2ELtHKuV07ht1KNGh4IslZa13hndBY3BWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghopdPeM; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghopdPeM"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d6a1ad08b8so65953341fa.1
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711395556; x=1712000356; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCiFMH0263F/w1Boz/4ACSdzIpxCPhV2O6OirjCh0B0=;
        b=ghopdPeMKX7sUVEp3xwg/OpJ/TfW77Jg0O1FbRKuFMtHBnrlhfLRIt7EC8suC05Mzh
         HkYMx164PR6bHJX/rXHfHoFm04Q/V1fEI1pHL2P72b+5rXDAm94+hTMyo785evg8ZEBJ
         JLW3C3Mj/AlCRuil35eMEGWHQoq1XKzjh60+m1ck4R+7kCHZtteGOorpI00pZ3PjPQLh
         yVZaTsI4scO493wk28bbB/qlXazt5cUkgIJI3ahdc4fG9cI4EjOgZLZOtdzGN/shAepc
         4SPk8es3rgB82qiByXeWvUtCqZIR9Mg+L+lMntTOdsO1Mm6xLgnlW6hdbMOmCUZTnTBB
         zWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711395556; x=1712000356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCiFMH0263F/w1Boz/4ACSdzIpxCPhV2O6OirjCh0B0=;
        b=DpXhyh/e4Ay8jr2Kz/Zjz+396N9ujds7xKCwbeOiH5X5RQzbw0SohORKUTK8ESPVom
         jWLLswuEdcDdYuAOdOVB6FhiPyOPaRDyAES94sShEP8KxxZvGJk7rby17jA/W6sniUdq
         St18BflzTV4leWBug/LD55Go+tXeCiNcbaH212Rt+UCAFeDqJpBpN0NTvLePjXkmjb31
         9t74fG73KOVTkERhBj21I07vdjJTcuGPs3B9TbmRLc0JTP1AMFxrwZlFPbcpxIdDMZiH
         RM/wXIUDh9GBLpuoIrRobehaLiJ1HMEwtjP9ke0AlEOi+0ntmHXHCQVPMKFIbREfZFaM
         JRig==
X-Gm-Message-State: AOJu0Yxxgb8VmGGkBgUVL/zdWVXVmfCp9ygndxhsj6uWx+96r2StfY20
	Mj/xJdR2zOipHi2WlkqIzyHZjexeLln43kPSms0q2yEsV8P1/IVMPhDvRZ9K6wBQsjiB0PuIG0x
	JRxGVnA1528PnOONZuGz36liw64Y=
X-Google-Smtp-Source: AGHT+IEO0HQYH0RAUefHQ88oKPd8VrLRPkmE6nkd2e0YQtTaamD6D0keaaFiiiGRD8g+GOmhBLFR4FTEiV/wSwncUdI=
X-Received: by 2002:a2e:8e86:0:b0:2d4:8fd0:b5f2 with SMTP id
 z6-20020a2e8e86000000b002d48fd0b5f2mr5556267ljk.7.1711395556273; Mon, 25 Mar
 2024 12:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314084412.1127-1-johan+linaro@kernel.org>
 <CABBYNZJV1htg46Gyu=7_iUWdukM+rHLitsLjxmWWYFGXty3tVw@mail.gmail.com>
 <ZfMStHjwtCT1SW3z@hovoldconsulting.com> <964131ff-293d-47d1-8119-a389fa21f385@leemhuis.info>
 <CABBYNZJ0ukd_8=SFzy8CEwgP7hV5unodca0NZ2zDZh+jPJsEFQ@mail.gmail.com> <ZgGzWWV4Lh2Nal--@hovoldconsulting.com>
In-Reply-To: <ZgGzWWV4Lh2Nal--@hovoldconsulting.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 25 Mar 2024 15:39:03 -0400
Message-ID: <CABBYNZJaXUhu1A+NyVT-TAJw49zcV6TMdGeVy2F+AVKWBOVC-g@mail.gmail.com>
Subject: Re: [PATCH] Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode
 exists in DT"
To: Johan Hovold <johan@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Johan Hovold <johan+linaro@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan

On Mon, Mar 25, 2024 at 1:24=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Mar 25, 2024 at 01:10:13PM -0400, Luiz Augusto von Dentz wrote:
> > On Mon, Mar 25, 2024 at 9:57=E2=80=AFAM Linux regression tracking (Thor=
sten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> > > On 14.03.24 16:07, Johan Hovold wrote:
> > > > On Thu, Mar 14, 2024 at 10:30:36AM -0400, Luiz Augusto von Dentz wr=
ote:
> > > >> On Thu, Mar 14, 2024 at 4:44=E2=80=AFAM Johan Hovold <johan+linaro=
@kernel.org> wrote:
> > > >
> > > >>> This reverts commit 7dcd3e014aa7faeeaf4047190b22d8a19a0db696.
> > > >>>
> > > >>> Qualcomm Bluetooth controllers like WCN6855 do not have persisten=
t
> > > >>> storage for the Bluetooth address and must therefore start as
> > > >>> unconfigured to allow the user to set a valid address unless one =
has
> > > >>> been provided by the boot firmware in the devicetree.
> > > >>>
> > > >>> A recent change snuck into v6.8-rc7 and incorrectly started marki=
ng the
> > > >>> default (non-unique) address as valid. This specifically also bre=
aks the
> > > >>> Bluetooth setup for some user of the Lenovo ThinkPad X13s.
> > > >>>
> > > >>> Note that this is the second time Qualcomm breaks the driver this=
 way
> > > >>> and that this was fixed last year by commit 6945795bc81a ("Blueto=
oth:
> > > >>> fix use-bdaddr-property quirk"), which also has some further deta=
ils.
> > > >>>
> > > >>> Fixes: 7dcd3e014aa7 ("Bluetooth: hci_qca: Set BDA quirk bit if fw=
node exists in DT")
> > > >>> Cc: stable@vger.kernel.org      # 6.8
> > > >>> Cc: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> > > >>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>
> > > ...the plan forward here? This to me sounds like a case where a quick
> > > revert is the right (interim?) solution, but nevertheless nothing
> > > happened for ~10 days now afaics. Or am I missing something?
>
> > I guess the following is the latest version:
> >
> > https://patchwork.kernel.org/project/bluetooth/list/?series=3D836664
> >
> > Or are you working on a v5?
>
> This patch (revert) fixes a separate issue than the series you link to
> above, but it is also a prerequisite for that series.
>
> v4 is indeed the latest version, and it has been acked by Rob and Bjorn
> so you can take it all through the Bluetooth tree. Just remember to
> apply this patch (the revert) first.

Doesn't seem to apply cleanly:

Applying: Bluetooth: qca: fix device-address endianness
error: patch failed: drivers/bluetooth/hci_qca.c:1904
error: drivers/bluetooth/hci_qca.c: patch does not apply
Patch failed at 0004 Bluetooth: qca: fix device-address endianness

> Johan



--=20
Luiz Augusto von Dentz

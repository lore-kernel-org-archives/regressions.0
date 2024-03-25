Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7626EB6A
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711398729; cv=none; b=Q0ZMw2TxKr9egE23R3N0U2PVhE5U/SBZXgwa3266+QfMobGAGLOy1ecc0BhtwX9KtKja26S12sMbBbf9+xn5PfO46C4AIzKduua6GaLnmt1tOmyPmX5b8EW6+DJ4eDhbifz7diOuTv7I7/BKePE/6F3KsGpSyq15LeGkW/lxy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711398729; c=relaxed/simple;
	bh=Y1Qv7WFRuuhXfFyptMkixf3iEE+4tSJqSv5rHXMWASQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKlgvFn+Y3NnALSEUgYW1KyCYMcjftG2RDb0sljV7N2LfGfTnuN9PCpPP2el4drvDrMvcB96Gd+Dw4yghoe/UMm2H9LXZgyPsb7xI1FHRIJsC1GhIFV36y+FwPnLGFEDwDfx1fPvhg6vZF87oERtKcCOAfCrxPguTxf3pQaPn68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TocUxspE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TocUxspE"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d475b6609eso60886611fa.2
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711398726; x=1712003526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7RKIz/MrNg9cMTI1c37D8VVxet1bDqKEYSB/zPacp8=;
        b=TocUxspEP3pODWpEDrEGjsE0JjVMhSKkmp6oIFmote6y79TAStR5ONNaVghMgkeOnY
         kxJ3BgEX8aVAlHZdUq3xw7mkfv8HvzcWsxGuuZnohlfPKxO+0qDZAO7NvRZftHuml2rL
         eYss3rj/WGsYFJOaNbbhF0VeE6UWvcMCb3nZYVvC9LiZex7xerWnog1LXnOerF2S+zqK
         vFTd0ToOhNZletAcdrfFCc/UKW8EPb29gq6FY1gk6WGD6wr2wJ4myteUrBHhtgfAz3g/
         +1H+gwSlZSYpwvPPVzcpTNWUwuOpd8EgXwpUC/3z8N4kIYEtW+JvufL+eebVPXJiAItH
         Va0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711398726; x=1712003526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7RKIz/MrNg9cMTI1c37D8VVxet1bDqKEYSB/zPacp8=;
        b=d649iDkrUDIe1g5AJTK7ZkMifvKZzM3FVqaS88Pb7w//J4q2ymmNEFrQ5eXkHqkASk
         7/2XWuz4Xz4HPguudG7W0KeKNHyW8hzsWdyVhQb3eGJP7iYenHXGXG2+CKQIgCuZWKbc
         hmXwxw5BzyY8IuDmP6wd/8DwWk518Wvb4x8ZjXcvtSQCGP7Jo3TG+xk691UEp0pwnxfg
         IyJ/gGuH/X5JHaiybhrx9ZZvf93qHvNEaXZuqvoEJPjPBY3wnbVoNYiCd0m0fVR0sSjk
         gzVeYm/vGd3EDXFsfyriaEowzyJWlsZWLGQSu2EA8cYlCujMkEsOn5rWNuZdPioPfO0W
         Iang==
X-Gm-Message-State: AOJu0YwpGc7GQwtMmByaLcpa8wteDGAL7/x3W4ZzgUNiSotuozNTAWgr
	EuSX0WhpQKntJ2xwV4NtLAEWi+Qbi4sZZnEfUmosp4k1WSw7qPsceAXIasZeaYHUUS2xYSGTu8n
	o1WVFupGypA1pmwCAdy4/B5iFfr0=
X-Google-Smtp-Source: AGHT+IFCzjTe1PrD1iEgUFB5Rziw5BPMZsUhry6xjN8/w0epyu0Je9rqlozlFF04zGALoUPk2yD3Wyk4FTTYaqbbkeI=
X-Received: by 2002:a2e:938e:0:b0:2d4:668f:baac with SMTP id
 g14-20020a2e938e000000b002d4668fbaacmr5741497ljh.28.1711398725984; Mon, 25
 Mar 2024 13:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314084412.1127-1-johan+linaro@kernel.org>
 <CABBYNZJV1htg46Gyu=7_iUWdukM+rHLitsLjxmWWYFGXty3tVw@mail.gmail.com>
 <ZfMStHjwtCT1SW3z@hovoldconsulting.com> <964131ff-293d-47d1-8119-a389fa21f385@leemhuis.info>
 <CABBYNZJ0ukd_8=SFzy8CEwgP7hV5unodca0NZ2zDZh+jPJsEFQ@mail.gmail.com>
 <ZgGzWWV4Lh2Nal--@hovoldconsulting.com> <CABBYNZJaXUhu1A+NyVT-TAJw49zcV6TMdGeVy2F+AVKWBOVC-g@mail.gmail.com>
 <ZgHVFjAZ1uqEiUa2@hovoldconsulting.com> <CABBYNZJUVhNKVD=s+=eYJ1q+j1W8rVSRqM4bKPbxT=TKrnZdoQ@mail.gmail.com>
 <ZgHbPo57UKUxK7G8@hovoldconsulting.com>
In-Reply-To: <ZgHbPo57UKUxK7G8@hovoldconsulting.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 25 Mar 2024 16:31:53 -0400
Message-ID: <CABBYNZJFzDaLdXsdNEP1384JaJEN5E78cgmWfOus_LGOREGsWA@mail.gmail.com>
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

On Mon, Mar 25, 2024 at 4:14=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Mar 25, 2024 at 04:07:03PM -0400, Luiz Augusto von Dentz wrote:
> > On Mon, Mar 25, 2024 at 3:48=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > > On Mon, Mar 25, 2024 at 03:39:03PM -0400, Luiz Augusto von Dentz wrot=
e:
> > > > On Mon, Mar 25, 2024 at 1:24=E2=80=AFPM Johan Hovold <johan@kernel.=
org> wrote:
> > > > > On Mon, Mar 25, 2024 at 01:10:13PM -0400, Luiz Augusto von Dentz =
wrote:
> > >
> > > > > > I guess the following is the latest version:
> > > > > >
> > > > > > https://patchwork.kernel.org/project/bluetooth/list/?series=3D8=
36664
> > > > > >
> > > > > > Or are you working on a v5?
> > > > >
> > > > > This patch (revert) fixes a separate issue than the series you li=
nk to
> > > > > above, but it is also a prerequisite for that series.
> > > > >
> > > > > v4 is indeed the latest version, and it has been acked by Rob and=
 Bjorn
> > > > > so you can take it all through the Bluetooth tree. Just remember =
to
> > > > > apply this patch (the revert) first.
> > > >
> > > > Doesn't seem to apply cleanly:
> > > >
> > > > Applying: Bluetooth: qca: fix device-address endianness
> > > > error: patch failed: drivers/bluetooth/hci_qca.c:1904
> > > > error: drivers/bluetooth/hci_qca.c: patch does not apply
> > > > Patch failed at 0004 Bluetooth: qca: fix device-address endianness
> > >
> > > Did you apply this patch (the revert) before trying to apply the seri=
es?
> >
> > Probably needs rebasing:
> >
> > Applying: Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode exist=
s in DT"
> > error: drivers/bluetooth/hci_qca.c: does not match index
> > Patch failed at 0001 Revert "Bluetooth: hci_qca: Set BDA quirk bit if
> > fwnode exists in DT"
>
> I just verified that it applies cleanly to 6.9-rc1.
>
>         $ git checkout tmp v6.9-rc1
>         $ b4 am -sl ZgHVFjAZ1uqEiUa2@hovoldconsulting.com
>         ...
>         $ git am ./20240314_johan_linaro_revert_bluetooth_hci_qca_set_bda=
_quirk_bit_if_fwnode_exists_in_dt.mbx
>         Applying: Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode=
 exists in DT"
>         $ b4 am -sl 20240320075554.8178-2-johan+linaro@kernel.org
>         ...
>         $ git am ./v4_20240320_johan_linaro_bluetooth_qca_fix_device_addr=
ess_endianness.mbx
>         Applying: dt-bindings: bluetooth: add 'qcom,local-bd-address-brok=
en'
>         Applying: arm64: dts: qcom: sc7180-trogdor: mark bluetooth addres=
s as broken
>         Applying: Bluetooth: add quirk for broken address properties
>         Applying: Bluetooth: qca: fix device-address endianness
>
> Do you have anything else in your tree which may interfere? What tree is
> that exactly?

bluetooth-next tree, why would it be anything other than that? All the
CI automation is done on bluetooth-next and if you are asking to be
done via bluetooth tree which is based on the latest rc that is not
how things works here, we usually first apply to bluetooth-next and in
case it needs to be backported then it later done via pull-request.

> Johan



--=20
Luiz Augusto von Dentz

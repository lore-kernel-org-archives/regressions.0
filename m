Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027F57603B
	for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711462649; cv=none; b=l21//PR+Z5MAwChHK5USo+U0fadT+4I9UME5CkZRBjGv6/vx8MSF88yGOZxQC4OmMToZtWxkh4LqRByQkOmkPCBpEDj9wbpmcCPX/87v7xKUSpE76l1IYJUAYvrH9gOHvfZf81TVY3JL+G/VrYRKK0aBvmYpXPS4rjanCQdBsN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711462649; c=relaxed/simple;
	bh=+krnLDQUclK1illgGMyFVfdlSO05mR2Nuwt4J5jFAKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8E0XO6UuAFkGl17a/skw+2HvHfOYxdCbW3iVmAtg5clcER6iSTOU1I3Km1Qz1R4kJMeXDXF+yGpb39DPYa42xcX9YGFv8GEexqZCLwIL1ZX8FNMbyWJ2t6/N0L6PqKYgau8Q2k53Jatvpej/IZjsBYKx54Y4rS3SNznVzYzWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQ/d1XSo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQ/d1XSo"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d475b6609eso70105211fa.2
        for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711462646; x=1712067446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms8vWcwf7m0AJcENPnkb47qcys5bsP/SBjcv/l6anGY=;
        b=CQ/d1XSoTjP1Xzw3Nhqmhalg1CmjNBeJr4jsYgWGoCN+4OwdRsqWZRFtosFE5K+l15
         x0JkkxUv30wwmEJ7UUoVlYGRQuG/rYrevtNOyJ9NwKr32jGPGAO0HDhtXj2OBVkZDHMy
         TyCQ7rno2CMTNQoRTEnEF4Lio9NakE5gtdtx5RCGkh9GAm01AL0Sjvu20j0+B8pWdmdn
         TfcubSzOdBzsRU9kTkC3e6mSQbGWVEURtEexGpXb/v/Sj9j54N8k2xSK8P1/5jDSiEuS
         q8ubcdxJer69LuPMP29SW8qLc4aH3IhrEKlgU+or8ewhh0PmRYh1A7hDxmQILjJkU96p
         9hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711462646; x=1712067446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ms8vWcwf7m0AJcENPnkb47qcys5bsP/SBjcv/l6anGY=;
        b=Wj3kzagZOT/F0QyizXHENDYAARci17s9koZ6yqYLTSMOiQGnIKY+llQgPJ4j9iKXY8
         bj0i/plACwzk4uPjAAg6Pld357yzNgUZ38IwAXY7beJ9boqxoGkruAbffoSBilVs8W1t
         eJ2uryCtU18NX1XInzMNIlTsFVkiUtzxsqpDOQ1a3Qga7dJkWtpbTywIZ7Bf7uQiZF9X
         CfdOH1EuT3+oFDPKHA79IjsENJDNXDrfyQ+fV+CH9H9xASuJHvc1kAZ+zQdruCKB+KU2
         eI7TzoFmuGHYEDfUgnFHva1QA2VrmjxdmHuB3EZPRKSiJSKJI9i5AZq5MXQiKyKyYAbt
         fMbA==
X-Gm-Message-State: AOJu0YwGD6VPbx+PjvguoeEAtRAYpkiw/FkWlrvAis13UZPDACbFsYuS
	9WF6BvD57g19ntAQ1P51XA761NYkQLtPs80whMLK1fwJ5Cv6v2kdSIes/dYKWRwCFd6aO+yhLI7
	MolnXP0jLujFpGFIotrkh0XLHoQFzL1wAJ0M=
X-Google-Smtp-Source: AGHT+IFL9XDPAaK62k8nut2Lx2rk5TkufZ8U0p7j7fS5DORaIk+YsthRyhtW5kQUXJUoFB0lhQ8JOOEXVg2k4/ITw9Q=
X-Received: by 2002:a2e:93d0:0:b0:2d4:8878:a15d with SMTP id
 p16-20020a2e93d0000000b002d48878a15dmr6894746ljh.7.1711462645848; Tue, 26 Mar
 2024 07:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABBYNZJV1htg46Gyu=7_iUWdukM+rHLitsLjxmWWYFGXty3tVw@mail.gmail.com>
 <ZfMStHjwtCT1SW3z@hovoldconsulting.com> <964131ff-293d-47d1-8119-a389fa21f385@leemhuis.info>
 <CABBYNZJ0ukd_8=SFzy8CEwgP7hV5unodca0NZ2zDZh+jPJsEFQ@mail.gmail.com>
 <ZgGzWWV4Lh2Nal--@hovoldconsulting.com> <CABBYNZJaXUhu1A+NyVT-TAJw49zcV6TMdGeVy2F+AVKWBOVC-g@mail.gmail.com>
 <ZgHVFjAZ1uqEiUa2@hovoldconsulting.com> <CABBYNZJUVhNKVD=s+=eYJ1q+j1W8rVSRqM4bKPbxT=TKrnZdoQ@mail.gmail.com>
 <ZgHbPo57UKUxK7G8@hovoldconsulting.com> <CABBYNZJFzDaLdXsdNEP1384JaJEN5E78cgmWfOus_LGOREGsWA@mail.gmail.com>
 <ZgJ0okobGv5nPreG@hovoldconsulting.com>
In-Reply-To: <ZgJ0okobGv5nPreG@hovoldconsulting.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 26 Mar 2024 10:17:13 -0400
Message-ID: <CABBYNZKJJuPHEwyXFRi8Z=P0GyaY-HdamsxmV8sR+R97ETTmEg@mail.gmail.com>
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

On Tue, Mar 26, 2024 at 3:09=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Mar 25, 2024 at 04:31:53PM -0400, Luiz Augusto von Dentz wrote:
> > On Mon, Mar 25, 2024 at 4:14=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > > On Mon, Mar 25, 2024 at 04:07:03PM -0400, Luiz Augusto von Dentz wrot=
e:
>
> > > > Probably needs rebasing:
> > > >
> > > > Applying: Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode e=
xists in DT"
> > > > error: drivers/bluetooth/hci_qca.c: does not match index
> > > > Patch failed at 0001 Revert "Bluetooth: hci_qca: Set BDA quirk bit =
if
> > > > fwnode exists in DT"
> > >
> > > I just verified that it applies cleanly to 6.9-rc1.
> > >
> > >         $ git checkout tmp v6.9-rc1
> > >         $ b4 am -sl ZgHVFjAZ1uqEiUa2@hovoldconsulting.com
> > >         ...
> > >         $ git am ./20240314_johan_linaro_revert_bluetooth_hci_qca_set=
_bda_quirk_bit_if_fwnode_exists_in_dt.mbx
> > >         Applying: Revert "Bluetooth: hci_qca: Set BDA quirk bit if fw=
node exists in DT"
> > >         $ b4 am -sl 20240320075554.8178-2-johan+linaro@kernel.org
> > >         ...
> > >         $ git am ./v4_20240320_johan_linaro_bluetooth_qca_fix_device_=
address_endianness.mbx
> > >         Applying: dt-bindings: bluetooth: add 'qcom,local-bd-address-=
broken'
> > >         Applying: arm64: dts: qcom: sc7180-trogdor: mark bluetooth ad=
dress as broken
> > >         Applying: Bluetooth: add quirk for broken address properties
> > >         Applying: Bluetooth: qca: fix device-address endianness
> > >
> > > Do you have anything else in your tree which may interfere? What tree=
 is
> > > that exactly?
> >
> > bluetooth-next tree, why would it be anything other than that?
>
> I ask because I did not see anything in either the bluetooth or
> bluetooth-next tree which should interfere.
>
> And I just verified that by applying the revert followed by the series
> to bluetooth-next. In that order it applies just fine, as expected.
>
> > All the
> > CI automation is done on bluetooth-next and if you are asking to be
> > done via bluetooth tree which is based on the latest rc that is not
> > how things works here, we usually first apply to bluetooth-next and in
> > case it needs to be backported then it later done via pull-request.
>
> The revert fixes a regression in 6.7-rc7 and should get to Linus as soon
> as possible and I assume you have some way to get fixes into mainline
> for the current development cycle.

Yeah I will send it later today to be included in the next rc release
and since it is marked for stable that shall trigger the process of
backporting it.

> The series fixes a critical bug in the Qualcomm driver and should
> similarly get into mainline as soon as possible to avoid having people
> unknowingly start relying on the broken behaviour (reversed address).
> The bug in this case is older, but since the bug is severe and we're
> only at rc1, I don't think this one should wait for 6.10 either.

The revert is now pushed, I had to apply it manually though since it
didn't apply cleanly, that said the other set still don't apply:

Applying: Bluetooth: qca: fix device-address endianness
error: patch failed: drivers/bluetooth/btqca.c:826
error: drivers/bluetooth/btqca.c: patch does not apply
error: drivers/bluetooth/hci_qca.c: does not match index
Patch failed at 0004 Bluetooth: qca: fix device-address endianness

So please rebase and send a v5.

--=20
Luiz Augusto von Dentz

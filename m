Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A515ECC1
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713969678; cv=none; b=L7VqleZuhfVUQF8TRX8It8klZ8WEquQ/QKgeNKL1N/LzCN88pbByRFRyWTpmYttOOBTzmDRJxYqejaUztIuQypFRieqSshSR7x24fcy0TWprRC+LzxexBcqFDINczz3u1oxcb1uGX/QSbG6w79b717YOZjo/BlvfoiS80MjoC1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713969678; c=relaxed/simple;
	bh=8CPV7Hz/Aa3JF09vNVqi95ImnV5Er7/aw86QJnKRHBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AioyIKzBCD/KqX9C9Al74a+grwiN1HeiJFxwwe9oxU9GxVXVEyGVluLNkp/j/t77995qw7epnUJWguT1HYtnf5cpkPF/iOao5/UjuK/bj1KWwxQls7zVhZsnQAqfsCiIExgEAb+xqULt6o3FAvyRUvgvAyhnxMiwG0yLxURMLhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsIInxv3; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsIInxv3"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de462f3d992so7259530276.2
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713969676; x=1714574476; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CPV7Hz/Aa3JF09vNVqi95ImnV5Er7/aw86QJnKRHBk=;
        b=HsIInxv3Fz/XHNhB3SitDqn9Nho/pVhg5x+IFdaP1x1dKezKrFkNPAuMaRsC264khP
         1Gs0b4TZZXYTnIirmMXnZNJFHUQBTIolr3QRoYdd103YmfAUoMlY6Mk8rNKgFrULIS4g
         4YVvkPFs0Vq5rE3huR42P05yW1NTg+nlKsBK/YosB66KtbncWD6hLeNAuP1uYpP6TnJz
         H2jtkoTd0hr1Nqu4huGXBDYbTem8nH+EJNhCOnrFt4V5xx/p+Ray3ZbjN7T69GykJOHt
         42VCNYp/lFy9uhewkIrMHLixwXCTstboZOUr1RWlCyvBYQ1YeS+4six88rRTvvjLwstv
         4iLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969676; x=1714574476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CPV7Hz/Aa3JF09vNVqi95ImnV5Er7/aw86QJnKRHBk=;
        b=TgA4uQbiksPctbMB/y1XkiXfqKT+ekoNufBj9Nf2gFwVxgf4DotkauDpviOMc70qL6
         Q4sMsrH5cuaurn5jdaAL1lJlmDYZhpRDse8y6zpeg9F5YNEVZXgb1hquB2bZURVzRwnX
         GM5rXp3s685aOWHLpgAu2oiF6Qxdf6xZEzm7ByDWazMtVjr4w5usCUSO7Lw1xoj9CwZt
         EwXJqKLcMGrwToAuYoPFFxNNbhy0NpbXhXLGGCLCnOF1USPxQ7xPBL7phX6tAV7MRMIl
         9WD8E1HYCspyiR86Byhc56rs+Szrzk2nPwJ6L9JR2t3rqvOZdHynM6LrF7juhYTBhYAb
         tl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCcv/0/niGv91fbSSBYKbt6Ptsl6L3UllFZQ8QCR1gZnPoz5iaM/D+9E9EUBtq3b6Fphz7co8qw6uTcIMgx2HDkadOF1hUOroV7CQ=
X-Gm-Message-State: AOJu0YzxRtFJPlAMFs9osxpb9h3XGtOJn1wjXNKUeyfduhzknRKyb+oU
	bu822yXeKx1Y5zPV+aPsMDTIe+d5CLlbSl3wqfUejvkSrxri8xhtlDPPN3wWVsak5RmRk4wB/Yq
	tyQARPTfGAgGlg6MX7m1KkkYEaaw5AzWxE4KZw2mngQv6ECHc
X-Google-Smtp-Source: AGHT+IE44PmrDGg3pjYHUKBciDxm06BRJEcfKsJPah7XYOdpvq02IADalmXS1S/uro1kQQWb+ceZgJzxNjl2jpykmXI=
X-Received: by 2002:a25:850d:0:b0:de4:f885:5aa9 with SMTP id
 w13-20020a25850d000000b00de4f8855aa9mr2529325ybk.13.1713969676031; Wed, 24
 Apr 2024 07:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1713919602-5812-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713919602-5812-2-git-send-email-quic_zijuhu@quicinc.com>
 <349b27a5-d2d3-46f1-b002-44f81e0cedef@linaro.org> <e8cd122d-e342-45c2-b078-a4ca2d8dcfff@quicinc.com>
 <dfe18768-f6da-4c60-880d-deeae3c3b04d@linaro.org> <8ae32009-5f5e-49a1-88a1-e330f0614f60@quicinc.com>
 <5e363318-c6e4-4874-8026-7940b434d583@linaro.org> <2020a858-c3d9-48a7-ad59-3691c6b98fb2@penguintechs.org>
 <CABBYNZJLCPaLTaFEfeTEn+2FpxLS8Z-W2kT1ry4jKB_W=XYNjA@mail.gmail.com>
 <CACMJSeuWQE4t2KDCRP7n-DeHN9Ndn1bE_KCRc-X2kmM9L2i7_Q@mail.gmail.com>
 <38736db8-eec4-4ebd-b4c4-4b404cea6e42@quicinc.com> <CACMJSev8=gBCw9o-ur87fMMj9K=ZWY-ECzxZjyvERYQ8P=VS7A@mail.gmail.com>
 <CABBYNZ+PvZb6azHoXAbO2czqK2zQnZ1ddcKRb_YX-zGSVfy+KQ@mail.gmail.com>
 <CACMJSeue3kM-G1UvO0REEAJbhU9vOqbeEzy0Qny5udKLB97e8g@mail.gmail.com> <2805ad96-6383-45b3-9b68-66578461bb5f@quicinc.com>
In-Reply-To: <2805ad96-6383-45b3-9b68-66578461bb5f@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 24 Apr 2024 16:41:05 +0200
Message-ID: <CACMJSeuyumcmkO8pYiWk6Gccd7njpke23NdboYrxNZxHx6XjAQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Wren Turkal <wt@penguintechs.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, luiz.von.dentz@intel.com, 
	marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	regressions@lists.linux.dev, kernel@quicinc.com, 
	quic_zijuhu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 at 16:25, quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>
> On 4/24/2024 10:19 PM, Bartosz Golaszewski wrote:
> > On Wed, 24 Apr 2024 at 16:08, Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> >>
> >> Hi Bartosz,
> >>
> >> On Wed, Apr 24, 2024 at 10:00=E2=80=AFAM Bartosz Golaszewski
> >> <bartosz.golaszewski@linaro.org> wrote:
> >>>
> >>> On Wed, 24 Apr 2024 at 15:53, quic_zijuhu <quic_zijuhu@quicinc.com> w=
rote:
> >>>>
> >>>>>>>
> >>>>>>> Please slow down here. Zijun's patch works and Bartosz's patch do=
es not.
> >>>>>>> I don't think Zijun means any ill intent. I am replying to Bartos=
z's
> >>>>>>> patch right now.
> >>>>>>
> >>>>>> Ok, that is great feedback, so I might be picking up the Zijun v7 =
set
> >>>>>> if we don't find any major problems with it.
> >>>>>>
> >>>>>
> >>>>> Luiz,
> >>>>>
> >>>>> Please consider my alternative[1] also tested by Wren. Zijun's usag=
e
> >>>>> of GPIO API is wrong.
> >>>>>
> >>>> why is it wrong ?
> >>>>
> >>>
> >>> I have already told you that at least three times. But whatever, let
> >>> me repeat again: gpiod_get_optional() returns NULL if the given GPIO
> >>> is not assigned to the device in question OR a pointer to a valid GPI=
O
> >>> descriptor. Anything else returned by it is an error and the driver
> >>> must abort probe().
> >>
> >> Ok, but there are other fixes on top of it:
> >>
> >> https://patchwork.kernel.org/project/bluetooth/patch/1713932807-19619-=
3-git-send-email-quic_zijuhu@quicinc.com/
> >>
> >> I guess that could go in but it would really help if you guys could
> >> work together so we don't have more competing solutions.
> >>
> >
> > These threads with their 7 patch versions from Zijun within 2 days or
> > so have become very chaotic. Let me summarize: there are two
> > regressions: one caused by my commit 6845667146a2 ("Bluetooth:
> > hci_qca: Fix NULL vs IS_ERR_OR_NULL check in qca_serdev_probe") and a
> > second caused by Krzysztof's commit 272970be3dab ("Bluetooth: hci_qca:
> > Fix driver shutdown on closed serdev"). The patch I linked here is how
> > I propose to fix my regression only. These fixes don't seem to
> > conflict with one another.
> >
> it is not conflict issue, from my perspective, you fix are wrong.
> do you see my patch change log?
>
> > We (Krzysztof and I) have provided feedback to Zijun but he refused to
> > address it and instead kept on resending his patches every couple
> > hours. Zijun's patch 1/2 proposed to revert my commit 6845667146a2. I
> > disagreed and proposed a way forward by fixing the regression. This
> > fix was incorrect as pointed out by Wren, so I submitted v2 which
> > works.
> >
> v2 is not right from my point as i commented with your solution.
>
> you don't answer my questions commented within your solution.
>
> what is your question i don't answer?
>
> > Bartosz
>

Luiz,

This is an example of how Zijun will borrow any attempt at meaningful
communication under a heap of incomprehensible emails. Krzysztof has
already given up and I think I will stop too now. As the GPIO
maintainer I suggest you take my fix for this regression. I can't make
you though and I've already wasted way too much time on it. Your call.

Bartosz

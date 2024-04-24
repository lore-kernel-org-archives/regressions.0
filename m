Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E9D15DBC3
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713967723; cv=none; b=ty00ApiEv9ANyq/TjAFTI2kJobHFXyq0UdHpf36ySe/Yj7971uPCU+zUrkDl1BJYHrb93qbZCJZ7kpbqTzt+JGeSJhs6HF0potDfMTDc4Tk94cTTO+lPvfe9ZZzLCwNsji5QoCTJD3OORqFMEvhBWN3fIiWGMbd2mQhrkyFOaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713967723; c=relaxed/simple;
	bh=SnDO2gjpJUB+2XC9IrofwbWbPWI3kLTOyzm5wVHD3Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8r/cu7y5n1e9m43jz0ox/iGldq3/ratJU7Y9g9+2Py651VI1LDdie6cZm3+HeyjwqUNFAKRyoZp70Ag3rS2kvY64cfz0kTGX2T+noTCliYu072p2yUHmsiOI/19RKC800DBASE2nIQD53RLuNuUW+8uRi/mucVGAoQv11/Ug/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHJUkGt3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHJUkGt3"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so96885211fa.3
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713967720; x=1714572520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnDO2gjpJUB+2XC9IrofwbWbPWI3kLTOyzm5wVHD3Z4=;
        b=NHJUkGt3pig6U+ZNbWsjNETdHaT5mMYoAVgF7DFnHfL5t7+wN2ZZi3qe1wdvOpigVG
         3+RvJXcjJUxr6Vt8AOAm3XgvGwv3NuHIF12yV1Ey6CZTAYSTanMFkljuZH45YzRLg8/E
         aFyXpffGlC2kxQFlTgpXu7NdbkfaDf8THh/yKGkZvHNs7vd4sfXGJ9lCyxG7i8IaOOBJ
         eWylgJFQCLZXRdCU4uj5enVnyoBtxdEyu+f9ixaKV63Khu+aroTOWiWXob+dE1hjMLC6
         x2hnrzOjpsXIoB6AcNVonO5fJDs+b2O/SMziP1pIAhmmvLioFSC5IsqXvz7XOgSy2JUb
         G5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713967720; x=1714572520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnDO2gjpJUB+2XC9IrofwbWbPWI3kLTOyzm5wVHD3Z4=;
        b=qyle6wRurzBmt4oeNFy9lUtF46+vp6PLLvHJzCqARnPm5m3fvj4Pel95p8jziFClrp
         p+wHYQYY9aFABZAe5lQ4yjkTH3YO7UKH89KHS8sRIEzry6ZspnrdfL6JlU0ES2u3wJlJ
         KNrRBCG1cXmgnBrY2CHOUYapqO5l5F31e2tINkun0bbLPdHkDiqFERRbtWf0e3ZYMZj/
         xik2fZHTRh+NLYxK/pU/wjBlvFveho2TZJ6itSQlpwEgvz/C5eiiCbl/7Jw2IN7OqLx3
         2/Y36snF3HJkZ53Mo5EhGEe3Ctpb4dkh51lavnxXMVgigMXOOO6zNorvLP/WTdKV/ay1
         fkQg==
X-Forwarded-Encrypted: i=1; AJvYcCW2UUTF8U5HOcnfhiV0iMa+3Kr7OQ2le0V+92Sdevj+gx35U2B/o5/UEzd8k6qycn7g8zvG7YPabfL6Er0smKJD+LRbZEc5CFMfPlw=
X-Gm-Message-State: AOJu0YxuJL/mSOYPyXGi9RZ7omvoyWQDcMJpnkSzE+IHMg8Nv+Mh9Lr+
	J4ciRNCH4lh+KHA91vpiLUCf03GBPAJMcsk48IqjhjBvwT5gPBqKuywHNWPsdLjbTS6kcdVw/74
	0SlrcfcWrZeC18JhH91zYgKOo1p8=
X-Google-Smtp-Source: AGHT+IHZDBnCpKtTyU7ioCp+hX0m0M37vMAStFgKBF6gmQo3x3JntTfJQrAh4epIzvmB+1WqKwRD+9iEU5YPWsWrmiA=
X-Received: by 2002:a2e:84c9:0:b0:2d8:8232:8c6d with SMTP id
 q9-20020a2e84c9000000b002d882328c6dmr1640780ljh.52.1713967719358; Wed, 24 Apr
 2024 07:08:39 -0700 (PDT)
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
In-Reply-To: <CACMJSev8=gBCw9o-ur87fMMj9K=ZWY-ECzxZjyvERYQ8P=VS7A@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 24 Apr 2024 10:08:26 -0400
Message-ID: <CABBYNZ+PvZb6azHoXAbO2czqK2zQnZ1ddcKRb_YX-zGSVfy+KQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: quic_zijuhu <quic_zijuhu@quicinc.com>, Wren Turkal <wt@penguintechs.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, luiz.von.dentz@intel.com, 
	marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	regressions@lists.linux.dev, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Wed, Apr 24, 2024 at 10:00=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Wed, 24 Apr 2024 at 15:53, quic_zijuhu <quic_zijuhu@quicinc.com> wrote=
:
> >
> > >>>
> > >>> Please slow down here. Zijun's patch works and Bartosz's patch does=
 not.
> > >>> I don't think Zijun means any ill intent. I am replying to Bartosz'=
s
> > >>> patch right now.
> > >>
> > >> Ok, that is great feedback, so I might be picking up the Zijun v7 se=
t
> > >> if we don't find any major problems with it.
> > >>
> > >
> > > Luiz,
> > >
> > > Please consider my alternative[1] also tested by Wren. Zijun's usage
> > > of GPIO API is wrong.
> > >
> > why is it wrong ?
> >
>
> I have already told you that at least three times. But whatever, let
> me repeat again: gpiod_get_optional() returns NULL if the given GPIO
> is not assigned to the device in question OR a pointer to a valid GPIO
> descriptor. Anything else returned by it is an error and the driver
> must abort probe().

Ok, but there are other fixes on top of it:

https://patchwork.kernel.org/project/bluetooth/patch/1713932807-19619-3-git=
-send-email-quic_zijuhu@quicinc.com/

I guess that could go in but it would really help if you guys could
work together so we don't have more competing solutions.

>
> Bart



--=20
Luiz Augusto von Dentz

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794593378;
	b=PHkib/toB+980TE/1wW8VDmNU2zv/HYr073n5u0tBXJQTn4Y723WDkqXz8rjjXyWOlf4
	 tmJbNBl/eIBKfAXdEyH3CMlPse/4tQs/KIfOZG7XJagH1JlByQEpEtFF+ByWJ/EAO73xi
	 29GC4ez1SiuGBrY76m7XNxZVkmhRtULzyYHFWwbA17iu8F9zgKj1b68Ge0eBySPbNwL9b
	 lse/kI46Fbou12lFRXq3pFPBiZ9vR1dJ87vW+P06xMQnzRSuNBz/hTmE1TC8riAFsRFIB
	 xC/nYPBIoNQ+C6zTB35fNFjRF2Dmq0cLGcmt77HP5h98vknufYMaoNH7NYFodYxtctQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
	b=EV2r3T16nJ/gLPRWgDr4i8Hio8m7X67YLhriuobTUts/2eTQoRowijYKw94KL1AyzWoP
	 Ztak7Sox5YePPVYDlcUG9JVAcVFhZdIQEOpU7EPk96kDKR41/CXYh77u2XwTSsiYgK02X
	 08gfHI9uKGIfavC+EbWliOL5phLFBsugdOB7XinYH8Qnoj6VfiOhiUGORrzvbrR3fWv7m
	 nsyOZXMtYrE/d78RhrJwqaoOFh6ew5v+YQN8H/KaE/LGS4nFSNMbnvQf7i3V3w9S+GyIt
	 AodTNNVoYeCGPaXVUO6wynDfByf639T7IrJaKuIwkZXHAqLYaoHKFKnRxSCQDwzNL7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=YBiXzDRw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC61606A335
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 18:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC61606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=YBiXzDRw
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so16518161fa.3
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 10:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794593375; cv=none;
        d=google.com; s=arc-20260327;
        b=bSfVYBX25DfqTjiq3chgTyaeAldP5nmwygdnb7ZC7/UsM3pq4bTubIAxNY3OpYKaml
         BG/wSzXSdM865eFXuM63DJ1KP2Ci3lZ1nQEMauRlPcZyveJ+19Nu8UY/ise2R9sQxa+q
         NakwLw9LOCRvmoxMdsz72kNgEvzsxUzIrdTcSeigneA2ID1BI3bhvSi8d2hD2CMt1u/C
         sTXAvj0Hrg/qvD0Bz/mJtl04JritQKVsAJQBi/bdrEFfri/3QpE05lgAJ7hQTvny2S6Z
         M8EN00EcFbxcgrUqVcZRX0ezDrUw40dn91/0iXllJyDisdwJefHvRcH5kHCpOdvVHWYt
         ISrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        fh=rjbmlLVfniMzTv1nTJWEWp1FVcMojiqnrZzNafNEqog=;
        b=fBAR9N13gQyGULsk/unLI35gQfzmFf/4+qdW7KvpLeKXX2qpeAL4/Ns5j5sfkhZbTj
         xM/30/kss+gYLcGYNv0zggPBCSjw5ixgKmaS62TDcozhlqqTfa8wY8tgKNEZ/S6LEzak
         GPAN/H9DULaioS+AfjlDVTa27TPP3gFJQBQdXuAdJOUHEFS9q+PcbOutPP8A9pkcZZZU
         0OcgHWXm99b68+L0HnqmkcFHLP47tX7r9BrQSnWkOMn6O+Dz+fJnw4D9/VKbw4YyVhPS
         dB9vj7mTWY/pjb4oBSFVdbergGTYSXaznrpuOALhiNFjdTaWY8T9cKJGRKebjyhpuYSI
         5oSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1794593375; x=1795198175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=YBiXzDRw0l++d6f1Vx3bdkwpD6uXKvluXwZy9MEBBtcJN7nUhxuoLHtLmidbMs4blR
         5DyoLeUP6evIme+L3/FQoZJBhn7wNkQbDP0pktcrw7q1T82qi5oXMrj5gRExFrjkXFyS
         0XbC54z2Nuiin3fUTvcIzYSDarfrYpQVKZMRZxu5CkNywRz0NvUEDLYJKx9U0ed35s74
         d/rLMxkDb+ZhXMtt3lr908W8HkeE/WN9RJtWGgx4bgE+A9N76wUrjO5a5cI+pb5M/0jI
         CeEjyS9o09fMcsmjCJsR4jbF8r5p71P3RYyvt5A11+HgMuyOqaJj1CmIJqiu6ATfHf2T
         0dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593375; x=1795198175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKYJRfOSB0/5ZynWyHsKUs3Uiriv6+4ECNMHGysdRx8=;
        b=toRJRPC0j88DjgSXhTfEKr+TZlbbOT0MP1N4//JhgWqCBq5bSLrFG262qxESOGLIbZ
         Ld2AEKirdLchZQ4y/ovW7MKlAY85AhO3goF3ggS4EWbolLczSsbJdgRTwFxNKH4xipNN
         mUqK7x167lVzP1km10U+2zmRg/xghaydI/y6uxJvdbAxNenr+wWQCB4y86lDcG4D97Ta
         xTj0PFdnlNMfG0C2HNbPanGDfxXV47BFPmEBzB+14Tj8Scs/V+SWtv/ehJukE5Cfs9t6
         mWMHyQy0onxhcAYu2Pv4GaTiSSTUZ14XrgI2teSLR97+ByeMtD+g/CK5aBuwIIbWywVr
         RrZg==
X-Forwarded-Encrypted: i=1; AL+hErHqLXnd4kVhNNwwetgyzs5yXMHA7i1GE+DI6JciZ9GcJfSGxeWF6M8o5HQm53GJBwxceEELdArd5B6c7g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9SdXYM9W6dsl5YiQ4BMLV6eg2kvVSdufE+VF1QthVrV8UpzXkQ
	uRzCj3GvYEDjKZW8zn+zvBaR04D6p/MA+jcGMf4XjiMOiEcXOevZZrH+LMwEUz84AhNucmvPlJO
	Bg3OzgtSJd/uv+AuCotydM9GH4aMlVhrIjY9uvIuAew==
X-Gm-Gg: AYBFou1pNAarYuVrxrKY1DjWKeoB9d+2yBsWGyYj59umGR2snsYqEsU8Us/7H3RLkaB
	O0lZY/n9TyhrfTm3WMr8jcMUe6LCfCGGWWyC7MyUVurk7VbuIhdT5HE2Zi4gSLogyaMSu5hQmxQ
	j+61B/9Vi1UW2oX0duIRlA0sQB4/ya0MtH7W0dgiFvrCKbYevOzAE52ULw7isAW7aj3ETWcIuPg
	xU2O/UmIqM81g5khmfrT4fdO+S62hKnb6+c+J4l6fqyKaPsD8ba4MagTCVGyN8zcSi4wO13hY8h
	vKmTbayOizN4LOTab+9Zt3kUzElKZczy1bpIMZgE1Y3/ga7kxfDGAmvMfYNj3aiG43rUrj2PIaN
	GGdLMZYsAzsFul3wY2fXboITOgIktZSUmPDXAp8shlbJA4WbV/+G8Jfh375BckcSh/mpA
X-Received: by 2002:a05:6512:1188:b0:5bf:b93d:a85b with SMTP id
 2adb3069b0e04-5c17099fafemr1222262e87.25.1794593375264; Fri, 13 Nov 2026
 10:09:35 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
In-Reply-To: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Fri, 13 Nov 2026 19:09:24 +0100
X-Gm-Features: AclHuK_YnjdCkTrewni0BQPjUqpjzPPZv35V1L4cPB8ogSTTtBU8c_5Nldb95ug
Message-ID: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Gaston Gonzalez <gascoar@gmail.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <uajain@igalia.com>, 
	Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:20=E2=80=AFPM Martin Wetterwald <martin@wetterwald=
.eu> wrote:
>
> On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > > Hi Greg,
> > > this is a regression introduced by aa125180c673 (via your tree) in
> > > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > > staging-linus would be great. Thanks!
> >
> > This is not a staging driver anymore, please route it through the prope=
r
> > tree after -rc1 is out.
> >
> > thanks,
> >
> > greg k-h
>
> Hi Florian,
> Now that -rc1 is out, could you take the patch?
>
> I've checked 7.4-rc1 and I confirm the issue is still present.
>
> Thanks!
> Martin

Hi Greg, Florian,

The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.=
c)
is currently listed with Florian as maintainer by get_maintainer.pl.
But Florian tells me he doesn't maintain VCHIQ.

How to proceed now? This file doesn't seem to have any maintainer as far as=
 I
understand.
Any pointer to someone able to take this patch would be appreciated.

Thanks,
Martin

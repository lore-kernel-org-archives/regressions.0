Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793802015;
	b=Bxm3SKPiv6LKK+IDFg0u58xrpXB70dzMq/jYEe8hRsaS7bc09ZpQ+SZWUSrcb9JOjgqi
	 89Ovv5//IkteWxHz0cXR/T0xpKamhTEPSZ4xi/VwtwaVH2UPgncnVXw787N44XrTIqbOP
	 OSQiI3JzeBDOUzpiTbjbKtoHU3W5OItXKtMrofvd0+GpYP56ROA5N+ZgAonG/h+SQS/rF
	 GJewCsW/zzAeUcMQivE6Ch/cv2oUzHWISYJGoQ15T9CvgqCs4Hdjvy131YO/r6d4T+Z+o
	 I73/SwMF82FuZ48yF1dHL/H9V+Bvv0ozxUTOT+htyVzWlmVHbZjPMFBMIZzZCnhnIAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
	b=QPFRv8+yYFsz1cCURTsm44Hpprb69p5bhX7k88d1ZXACucQS+Qs2O0K5OjL7BsWYEJlR
	 DKLLgD4cIfyXXyAn7O22SHRoJAeXgwuXyXcXTAVr9gTAnQnCYMfRHCz3Q7w7eOxtYpymO
	 962TauBje4WCsG6qmadZcP81NG26FroRQaVdUbW5BGJ4P/fwdhph2yU8K89R2L/lubwWL
	 ofbzJMliF/HBRuB29zCFnrfI7GAEorucUK/jBUzVdm58aPi/XHEiX9mr19gjVSj4jtQ2Y
	 LVIeNxI5wwWUUL41zTYiQ3Gblkpmg3xCuIl+pJzwFwieY5YZJscEOcYdMf1qjySzEZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b="VMKQ/7RR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B7606A326
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 14:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F0B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=VMKQ/7RR
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so911485e87.1
        for <regressions@lists.linux.dev>; Wed, 04 Nov 2026 06:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793802012; cv=none;
        d=google.com; s=arc-20260327;
        b=ZI+OQWzgVk2fborVIIQpq/oULopozcmV3XnZilYPC3BJEXd+qnH5DZCB8yEKHzqkzJ
         dAOiAbivURe+FY6u3FfC5jDn7y71IN18qZ7XARbFRVRyR8xO8iNaKDfzDzTf59ci/6P1
         qv7hmgORWcQVqK1Q+fHoUyh5OGy+06nCxoZxtWQiFEcsmDFSrhQr8mrfayP+7sItfcux
         MS6igh5inh2TfXhl/O8009iGT1swOe9FCUCjDqjngBYZbE/0fZ9Hmi+QC9816PmgIrI6
         RTufnO490imbwYBBUEWeIYxrtl8GDfGiEKsnkzNIAuVcNlvPhhkF1m6fPEDB7CKYEvaW
         mjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        fh=kKCgC+M5RNQUfyWMS92cnto1nbN3r0P0pZ9u+t77fFw=;
        b=QnrB3RCg2iXYnhUmci9naFjksd7XK0RBJ+c6sqr7BdId9/LvFTH+LR6+N71L0WrrYS
         gTfK/ETUEL8nVf8S73S1WwPSyw2tcAXAp5SDMLXJNq8rk/blVccPER7lonVIRznmfEr0
         bNG9fen17F2CV29DrFaPBWozUMWdONJuSZd78ZG75FbHnmKuLo8oA8iz4PikIC5Rg6n+
         g+cfwcjImdnId0AAb9jv9MXXL94zwY4JBGwytI6Yn7Hw7BmhGSR7vUee4reBiN39RR2f
         C7XF5ZqlRQvtt7X+KPSygCn4NfkANfpIB9kB81vInBzaV3gOqK7Geg2OFfFipGzmrHEO
         +l4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1793802012; x=1794406812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=VMKQ/7RRy1X3ZpA3dyVt4DYJTjddjl40qxqwOGB0ngcmtxeuwTgXx6+KAWn+5OnquE
         zOOYX5p3JjErFbeilCuB2BinZiMTQ+88o4cby2aHFAeGZ46qvN1x5bNA06+0upUvcqu5
         tZI7iSxc2T2GERoeVk+XBckGkpILqWWPJLNtKOcPuQu4jz6YkJaqPQB6qEg6uQ2kxURN
         3/5OILQWYlL2vfQ9ui1pH8lYnb30dkyEpeuU2oLXUVkIxAAxmio7TCl8ZbrkICVcF/yF
         IiMbUtuh3qADncEnl9+O2QSsVPldItd+QPCSNYpgHc5ZbtctRuJa4It/8Ssg8IOJYp7k
         8cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802012; x=1794406812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=eE1P57/OOtRVdYPS0iqBRcIFHiO7H4We1f9tAPowuQMb0MEWSngkhurWvx5jfzaHrD
         /jB3NtjQED22BFPmx3zn90+q+QG+Fb++Gv6JQrcFXhkEf3lMPCTG/8dGLm3wxlv8C3aU
         9gVmaw3Fa9pde0UzshfV09TMV3qIuL7rkyXEqpLPJ20qROfsFht+FGoutwLhB+u2Cvoc
         F2aS0TUgpQkyrG7w8u61Xnyu3FNurQmKkjQJNc3CxsviBH8qSbDOY4vuS4uqura3w/fP
         LD9C1d1/nYe7ghN1wbq+NOKz/ZUO1CUuPnres0T1cLz0TxcL7r0DWXOauPOrwc20dZ23
         3g4w==
X-Forwarded-Encrypted: i=1; AKwUvBySf4/DZIUPFZn9YGTJdsF0XnRFg54P2PXineKVs7qxwG6ZjKcBoZ+B4kPdkKkGZsP9fVrwtqhbAkZnDA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/jCRvZgcrjiA3f2wIcDX4N401+yfZE9HRIfCczOb3uOEX/NZZv
	Jv6G+hWJWwUN4+ry/u/sqCk4HXPryowWXmZgJo+EWV681EYjkkb2fhFwbLZcW4F4//ZnDzPrr1H
	TJtUbMg7AO4DoP/mLdmHypDA4c8rDHf7sJmg5fPOo2g==
X-Gm-Gg: AYBFou2isTl9CWQ7oyRgJf+xWVBHBuEmoXNJpfNiEc4oDjL6qqII2h6N3TU5+xX+u45
	xZg2VG3nKljwHH8d86sXCHbhVYah1S2dtTf3m+7nQyBLk+NPNK72z7XrCoPTiY8oA025tWTmuG+
	OOWHr4blLfs1dDBrBbmjpL/vqqPWlbDktAsyhxiXfQNuUsHB8+aRiFwTxLCBAxwvkTtZL8vq0Rt
	jtrcrzD2FJnkEK11jSn9GaeHSXwHEfQVvjv1S7kWSZ6me8IMjaJh/pklhG6lyf94V7GMI8fr6Wx
	t8qPvIwb64tmlikKzS8Icegx0JrI2e22dSnKnLKJA29pfyOorj5WWnw9xNwrkBL/fwJXbPbySfz
	F4Ep5YpbYF/El1sY7RFqWhvkgn9VCOA450dOocFX6Y11kFwfqu3UL7jtM2jDhh0n/kKSP
X-Received: by 2002:a05:6512:1394:b0:5bf:d1e5:6533 with SMTP id
 2adb3069b0e04-5bfd951f9a1mr5985954e87.4.1793802012004; Wed, 04 Nov 2026
 06:20:12 -0800 (PST)
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
In-Reply-To: <2026102218-vowel-plutonium-629e@gregkh>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Wed, 4 Nov 2026 15:20:00 +0100
X-Gm-Features: AclHuK_I0DmQgyoOW_ayNCdieQ-bUqhZ24CNIegOfCwJ565mihqQwxeJ6QVlwrY
Message-ID: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > Hi Greg,
> > this is a regression introduced by aa125180c673 (via your tree) in
> > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > staging-linus would be great. Thanks!
>
> This is not a staging driver anymore, please route it through the proper
> tree after -rc1 is out.
>
> thanks,
>
> greg k-h

Hi Florian,
Now that -rc1 is out, could you take the patch?

I've checked 7.4-rc1 and I confirm the issue is still present.

Thanks!
Martin

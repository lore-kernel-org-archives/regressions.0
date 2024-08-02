Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5114C6A33F
	for <regressions@lists.linux.dev>; Fri,  2 Aug 2024 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722634199; cv=none; b=YYxwiL6gt21yWrpCIsqPPtr9NqEiweKtwODhcP/uVoQu6ztRwhK+IU76bDTTq8vFlL8i6bRirpL37gOePcO1b1SDdy/MmpznLtrj/EzIaeLcC5pvsCeGoMTx0r6PYVYMVMHF7HqK3u+Zp+ms3cW5st2byisKmvPAlouXJNPoPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722634199; c=relaxed/simple;
	bh=Eqd5DSqcYMAnbki6Oa/uDzMz0iJTYPIDWjPGs8KfInk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/AKKWwv/zZK9hpFOoSVKmQklMwklijgt6X2pd/Z2v5QAxpie5yrTQLvqPDNVWOKdCsRGMtSgDwS25s2DqCKVIeztOIzjH9SrCcLo2zauCfNzUcw6lfcoWuOAp/g8i8RX6WdV62GqUVcDJJL/odA+RQ4Sf53WyJvN/6fkK5veN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6DKpiGm; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6DKpiGm"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6b96a253c59so12630876d6.3
        for <regressions@lists.linux.dev>; Fri, 02 Aug 2024 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722634197; x=1723238997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eqd5DSqcYMAnbki6Oa/uDzMz0iJTYPIDWjPGs8KfInk=;
        b=i6DKpiGmBjydZllXCpCa3fMflmaqz712xFwTK+EqypurIb5NEcOh6nlUwOE/aIC4vW
         w/+0v05YjdAHrRO+Hy3wH8z1H3vbQoZNL6D0E8+vbztTEfia9T7UKVPli/Fy4O9wxpnt
         ZecSPBz2XxK7O8GSaQrMLrHBRO5tqPRaaEpVpF9R1bkeiYPbZ5LFuc1N7z0/w+2wQtdE
         Y0QXdpVTuNCHNaRVxyIOuNh+v5P5kLYZBaEhr9VyPlnJ0ZQU/PszdKni1E450TY/8zDN
         IWUguHl/VJIaukdYs7aznEHY0S/L/kHTVuCZGDBSafw/cm77c7ppBQSc0Oy65+55Y3Nq
         Fk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722634197; x=1723238997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eqd5DSqcYMAnbki6Oa/uDzMz0iJTYPIDWjPGs8KfInk=;
        b=BI9quuH8tv3pm9YSzvu8SRTXR+INeEyt+7GX08ELyK3zGQvvZjSqvPr0IRydEovw/d
         rDslUmDK+6z7i+4osQoS6mzOUCsmHLZu0TQBtInTFI32iDTwsP4WrPhYkZFc79ZRx0ja
         sJ/g2j/4t8XPbJOYQqOn7yIeYxHWDDO6A9p+V3WvOOXb4/Cn3lTwmDS/+PJABbQsB/Eb
         +BZvAib2DO+Z5fhC0YR2/aUP4N6wwoOLJVLzfUfi3gg5IksLeSdNTOuwkgm4vGn2IOb2
         F/EIft+J86cY0mPAwTp3ok73TXdBwXiqFnhcaSz+jrMlTM0Dag+bbPaAbeG2wkuPHC8L
         AdCw==
X-Forwarded-Encrypted: i=1; AJvYcCVLlhWhRyJF0Fx5pHv+bxoxiCC9LS4GiqV3Ff0WT1K6tFDJgsteYfgPIHUsLPNxLmWV6O7UoDbVG4I9IQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmFuOHb6OYzGlAMaBHCm+KWWtoMBC0IdxbISyLe6PGiOmvGuR3
	clpLAO4rcpXur0AXXbng6DCPDEytm1pvQ/jaEjPajzZDSMh3ZhtKGvyWJsvUioiEEppdfG6rcGr
	4MDypQVdyZRSJ7WlOzbu2pHPLTRA=
X-Google-Smtp-Source: AGHT+IGeyPkk/dWhUIyWDzjMBB8iGs4RL6xounmSFkrEvZlAvm16BiP8UqA0qIQBOFfHGQPdk9Nxri4ADWEeHCXChxk=
X-Received: by 2002:a05:6214:e8c:b0:6bb:3f69:dd0c with SMTP id
 6a1803df08f44-6bb984bab76mr33918776d6.9.1722634197160; Fri, 02 Aug 2024
 14:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com>
 <1266c4af-a000-48c0-bd0d-79c2e918aea9@gmail.com> <CADnq5_O-hKQZoMxuX2=HiukiorxE=bFAJownQFkTbzNR2d411g@mail.gmail.com>
 <CABXGCsM=Q-Xp2d0Ht2J78FupEtOtMh1bhVMUZtOqKqSoiZA8cQ@mail.gmail.com>
In-Reply-To: <CABXGCsM=Q-Xp2d0Ht2J78FupEtOtMh1bhVMUZtOqKqSoiZA8cQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 3 Aug 2024 02:29:44 +0500
Message-ID: <CABXGCsPr++1ViN467+uP5G+wdFmZ_Bnjoor9VLndZoAG4qS-dA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - Since commit e356d321d024 in the
 kernel log appears the message "MES failed to respond to msg=MISC
 (WAIT_REG_MEM)" which were never seen before
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, mukul.joshi@amd.com, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:16=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
> > https://patchwork.freedesktop.org/patch/605201/
> For which kernel is this patch intended? The patch is not applied on
> top of d67978318827.

I am able to apply this patch on top of e4fc196f5ba3 and the issue is gone.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.

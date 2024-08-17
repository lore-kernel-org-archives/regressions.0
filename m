Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA71386C6
	for <regressions@lists.linux.dev>; Sat, 17 Aug 2024 23:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723938415; cv=none; b=tRmiQSyJ+6WOEtVnA4Rzh4cvWlSN2kJKetAmRJVn093I9kDQEGlQsTZ3L4gLA+wdDoiuZOv/AYKvpc/hl1wmU1qaSH8sxW2VY56fy9l8+/Au7sqx8e2F4cFldAcq9ojHcDs+CAPBZRhOSHq1CEkHJayOHi0CWGAnJHuK75OpweM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723938415; c=relaxed/simple;
	bh=l+v85gKWtxhzD66uOw4BW1TzyQEIvhfDX4xdo53zdhA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aeIuomYNr03/ls2eI3KPr3m8Ft38pAra3WVW8kMTE10XAj7TytNufujuSTGO5/Rfl9k0sWLHRRk9QR5nLspQlu6tmAb3T8RPdBFnzjxdGijA/uR2FLuZAewwoJuqmtf4JrJ1QoLh5OpD/iU/5HIoflPGkONtPrrhVwe6NrTtcP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sj1vi1tI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sj1vi1tI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so22712955e9.3
        for <regressions@lists.linux.dev>; Sat, 17 Aug 2024 16:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723938412; x=1724543212; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+v85gKWtxhzD66uOw4BW1TzyQEIvhfDX4xdo53zdhA=;
        b=Sj1vi1tIoAjfsnjynYgSkcsvBZjn/ZwSJXSQc/kLPF3A8Nar0lCBbwnlHM+DTgxby1
         kPXcpDbOYIOokgPU6wu+BPhmWUry6IiGmHnEneZ9e/PZxly1qLUspCRFo+hyZv/pPtz2
         GVxL2f/5ApsFx1Ki9RYZ0Qm4oojKO5fMW+aowDRLiaIl4Eul3JkUFcGTiKaSLkN4onDS
         XdcJev7rcQSLoURZoaw00EjCzzGgqwWa0c/PZ8pBhNX96Vi9NhZ7HnmSxXE4Bk/1VHC+
         wK5QCjKkcREXDDr+J+oaO+OkpDrNtoHXrqugBwPmcx3b6FFS19+xwtRDwR5u7rEHqONd
         7x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723938412; x=1724543212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+v85gKWtxhzD66uOw4BW1TzyQEIvhfDX4xdo53zdhA=;
        b=AJCggYQfyL4VHHPOjQDcvfryaLFyRdvk0htXS7zGcXh4YBqAZU4T85OnnjGUgeo7RD
         Jy4iexIADUuxf7sFkna4bLMgpIDtaGm1mnp2orOleXtSqBiKcUwYem+vAXHBFY3RtF2T
         jHRBujl4wJKikeco9BepvEaC+B6uswmr0r+Uu803vNf8EUU+WO1lhFl/TObIFg4lz1pM
         pwk8sR1pZKr8RSOwSzDhDP9Qtq0uT4a1DiJgG5mTHokaHnfIM0O1IoDVOTu33J7Y3bGF
         +H8KzerI5hQrAKyAA0F66TIwzu89JDG0xEGL/QTvIAvOYo8Fu94VW9qxWkJWlBc9f0Tm
         NW9g==
X-Gm-Message-State: AOJu0Yz3Ia35hJBP/5js4uI3X44Wmy15vFw0S/yjAAwvoj4dj6CfpPpS
	e0OJcNRVKknAPMKnszzmsr0poGRh3cunRqta++RxEkG8+WnXCR8jsnc7VwPl
X-Google-Smtp-Source: AGHT+IG3UALrq/UQ4xcK92W6vqfpkfsnEizhUqmvHtg/EglYTF6LB8XWQKQZog25XQ6bIkcF1BOx2g==
X-Received: by 2002:a05:600c:4f45:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-429ed7ba9a9mr49075005e9.22.1723938412168;
        Sat, 17 Aug 2024 16:46:52 -0700 (PDT)
Received: from [10.33.80.43] (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm60488635e9.40.2024.08.17.16.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 16:46:51 -0700 (PDT)
Message-ID: <1e962f52a2b1bb243227348dc998273eaf19cdab.camel@gmail.com>
Subject: Re: [REGRESSION] Brightness at max level after waking up from sleep
 on AMD Laptop
From: Filip Hejsek <filip.hejsek@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: alexander.deucher@amd.com, serg.partizan@gmail.com, 
 amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 hamza.mahfooz@amd.com,  ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Date: Sun, 18 Aug 2024 01:46:50 +0200
In-Reply-To: <77KAHS.13UUH2XVHQQF1@gmail.com>
References: <77KAHS.13UUH2XVHQQF1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello,

On Sat, 2024-07-27 at 19:52 +0300, serg.partizan@gmail.com wrote:
> Hello,
>=20
> After updating from 6.8.9 to 6.9.1 I noticed a bug on my HP Envy x360=20
> with AMD Ryzen 5 4500U.
>=20
> #regzbot introduced: v6.8.9..v6.9.1
>=20
> After waking up from sleep brightness is set to max level, ignoring=20
> previous value.

This issue is tracked here:
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/3474


> With the help of Arch Linux team, we was able to track bad commit to=20
> this:=20
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/63d0b87213a0ba241b3fc=
fba3fe7b0aed0cd1cc5
>=20
> [...]

This commit does not introduce the bug, it only makes it possible to
set the ABM level without requiring support from the compositor. It's
very likely that the bug has existed for a long time, it just hasn't
surfaced because no compositor enabled the ABM power savings featue.
Now that power-profiles-daemon can enable it through sysfs, the bug has
been exposed.

So I think this actually might not be a regression, just a new feature
that exposed an old bug.

--
Filip

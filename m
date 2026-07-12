Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086A23EAB4
	for <regressions@lists.linux.dev>; Sun, 12 Jul 2026 17:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878277; cv=none; b=s8/ELbrZhAqWBFWaP30gO714GzrHRohFYExkYxsKqe3XcnR72oY7JHQOLoMSJj7QUK/Wze5mGKdcUx7x0990QtH8Bgpj9vGbOxkqW8wRzfzzM6KJTWN1A/gaMI+tdhlhDwHCC8ISlZG7Jnbc6Z2Ukrz7YBGor2AzGly7L3gyemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878277; c=relaxed/simple;
	bh=+0bc/VZdk9GSVjX+x28hTP2x4I3f+xKasOc4EQiHypo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eaIcFhL/SNtgcDL/ZbA2Z5Ih7JdBa9d39OM0cBE8vNMjKQxMjuHFuhH0MKr7/uDyi9k9NbV/OFXNmGemPsAdt1f+wOAkWIoaL9NGn6CBhdpawSVR9S+QuwmpUSNn0vNQaM1AVXod7mQmWOb0k66aJTDXE0WfhyUaW0dzwv4AVHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlA1xIXO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlA1xIXO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f60208a5so19422855e9.3
        for <regressions@lists.linux.dev>; Sun, 12 Jul 2026 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783878274; x=1784483074; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ts2/Ui2RA7r5jQzEKYw0O8Cs+J08h0WmcXc6RVOw9DI=;
        b=BlA1xIXOawnhJprCluk4Vhz0+EqOZyrYlaJdlK/DQd1lo+gUR0wTD62wbdd2r5MbAL
         6yIzNqNCQym8qEljfgpDsEzYtgsFUBdOjNn4o4VTjVShtBUgcqyho9vKv8OdNdRAzX/1
         qVn+oBckqaEk6cv/vlKXDbVWw9/qTzCj8nOc2fRmxR8kZPV2dNN+Wwv26TccC4axaN56
         C0c1Y0VSMoAkvKPAup4WLw4OchP/ExxF2pA1Q8y9zd9c/K0dRD8NeFXfG9AMxlE9vbT/
         ByoZFu/hcA0g2rlqBOnhz8nOUuSRhPOANcnoAWV+1XUpAk5CF4gbVFUAYewu6IVWW+F3
         Yd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783878274; x=1784483074;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ts2/Ui2RA7r5jQzEKYw0O8Cs+J08h0WmcXc6RVOw9DI=;
        b=DUvleMI8qfeUURx5WPQh2mBOYAdVm59PDj//L8sx5l0GrWafvwkQyWHrJYon9gLpJD
         EPzfdMIELacjeyMGdcZvbkUd3x9VNPTto24qhczu4h+8L7TJY3NpTmNa2hgQJ0G7gISX
         Ho4VT87qRC0KdjOfZP9hlLUHErxbeuqN5tWUemVs2PqFht3jxbDjh3fYu21ccfazA8XI
         ZgGlakAeVkUM+D1B6LnrWlDgdhyPp86Mo4eb/JPQWLGi8AhjGJ72EY0+TcwXvzttrcx/
         6O6FyZeli3QDguCcaH8NmgD9B2ELt1NnjxXWlv1WeLe7/WQ9bLStVBxQ1zVzrGBxCVtH
         fJgg==
X-Forwarded-Encrypted: i=1; AHgh+RrS2xCJfwh7SW2g/FwMDJu3pNlX78v0PgZb3ajwv0v+u+NeCcCpRNiqiRBWO79jP75+TY8IdOOWi0DGcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJJOsgNX23AUI3+DxGtkAIVNk6ZqQyeqZDbMLqw/GxYDjYtOTK
	SejneWIxWWxlWRl1YtetyTTDFR344R0EFcIJuRiRXkx6pJKUO7cKR/Mv
X-Gm-Gg: AfdE7clKoltfHZH2EF8/ycZ7iHnyszfzuh7lSa70ng51IyEPl7Yu+8AgbIMsN+Y9fZF
	dMWb7u6Plhq9GRg2cwUv6n9tnuTtUWTeBN2/mWaFtL4KuQIBM7CKE8AG0i8X1XsMAd+yXUN5euH
	57gpE4hbklR9Ni/r9cBI5QY/NWZHlfZ8mveVgCw5Y8MTRYpexYjkPZl+sUOopJtjE2r3IalwVQF
	9F0elGkfaBSyUjj7WfxJc1beJaOkq3dQrJK1FPaFI2Kcfk0bBrwNXDZCztjEKXYaps79QgS1m4/
	XpGGqxU8aMx2jrV2F5fvr/wWiVQo4DERSYy5Lwq/tYmnGXWR8NZm0JvLvd6SyFgIOf1RQbSOGBB
	mUkYOcpxzc1Xd88oGn3XrmlHYE0s97EGtnWIhzmSTRNzrFbST5hdvwE2L9VMMk7FRhN3wHAIbG0
	9Hwe2T38sF9xK3m2DtBnZjoA6Ab2hpNtGW5aMFfT7/YObcImeyZCKtGoi2o5yXib1PQ3yp1SYVx
	kPZgs2qVIwZ1jO0
X-Received: by 2002:a05:600c:190c:b0:493:b91c:6bf with SMTP id 5b1f17b1804b1-493f8818dedmr62779825e9.18.1783878273785;
        Sun, 12 Jul 2026 10:44:33 -0700 (PDT)
Received: from timur-max.localnet (20014C4E24E4950000951480CE1AD54B.dsl.pool.telekom.hu. [2001:4c4e:24e4:9500:95:1480:ce1a:d54b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm288828895e9.0.2026.07.12.10.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 10:44:33 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Lionso Alejandro Pacheco Vacacela <lionso@murena.io>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Chuanyu Tseng <Chuanyu.Tseng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Fix preferred link rate for NUTMEG
Date: Sun, 12 Jul 2026 19:44:31 +0200
Message-ID: <2230825.9o76ZdvQCi@timur-max>
In-Reply-To: <178379850751.8410.12007342378134020217@murena.io>
References:
 <20260529090909.13206-1-timur.kristof@gmail.com>
 <178379850751.8410.12007342378134020217@murena.io>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On 2026. j=C3=BAlius 11., szombat 21:35:07 k=C3=B6z=C3=A9p-eur=C3=B3pai ny=
=C3=A1ri id=C5=91 Lionso Alejandro=20
Pacheco Vacacela wrote:
> Hi,
>=20
> I independently hit this regression on a desktop Kaveri system and can
> confirm this patch fixes it:
>=20
>   - AMD A10-7850K (Kaveri, DCE 8.1), MSI A68HM-E33, VGA monitor on the
>     onboard output (NUTMEG DP-to-VGA bridge)
>   - Debian kernel 7.1.3 (amdgpu.cik_support=3D1): VGA monitor receives no
>     signal from KMS takeover on; dmesg shows
>     "[drm] enabling link 2 failed: 15" (DC_FAIL_DP_LINK_TRAINING).
>   - Applying just this patch (1/2) on top of v7.1.3 restores VGA output
>     with DC enabled: the link trains, the CRTC comes up at 1360x768@60,
>     and the fix survived three consecutive reboots.
>=20
> Tested-by: Lionso Alejandro Pacheco Vacacela <lionso@murena.io>

Thank you for the testing!
I would appreciate if you could verify that the second patch also works wel=
l.

>=20
> Two notes:
>=20
> 1. The Fixes: tag references b74322eea36b, but that hash does not exist
>    in mainline =E2=80=94 it looks like an amd-staging-internal id. In Lin=
us'
>    tree the offending commit is:
>=20
>      a62346043a89 ("drm/amd/display: Fix coding style issue")
>=20
>    It would be good to correct this before the patch is pushed so the
>    stable tooling can resolve the dependency.

As far as I remember the regression hasn't made it upstream yet when I made=
=20
the fix, so the hash didn't exist in Linus's tree yet.

>=20
> 2. Since the offending commit shipped in v7.1, could this be annotated
>    Cc: stable@vger.kernel.org # 7.1.x (or nominated for 7.1.y once it
>    lands in mainline)? Every Kaveri/Kabini/Mullins system with a VGA
>    monitor loses display output on release kernels.

Agreed. Alex can you please backport this to 7.1?

Thanks & best regards,
Timur






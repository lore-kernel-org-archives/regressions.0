Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A51E495026
	for <regressions@lists.linux.dev>; Thu,  8 Oct 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467312; cv=pass; b=Tbz6XGlssNHeuXACD0pNVld66o2CF7t6QLp6We0SX3cffDV06x48z2ruabiRs/jVWPVnGwMhSPytn68NrJG1xBq4uKF0M6gxKl9omOLQrYTOFslIB7JXxi4cyB2MyVdWKgx5IKCq3eD/8dcNDyVzIWOYFR6Liwn0iMBorfx0jGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467312; c=relaxed/simple;
	bh=GxYaZEmMSfj5cqopxpHkz12DEhpzIPayu+f2kBBrl7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxAq/qOAf+p8ahItXP+jWQyqNdGTyL5EYrDRlSZweah3W9vTsRxSDgmD6iBY7UnFVNQaMtcbZO2YFcmZ2/tLNLo2NFyJ1A2HAtHjhtTgdbxaDzuUUwHilDCwF17esB4yTt1zfaU0tSD0/WvDSzS9B39LMNCQYoo7o3fz0tz7Lvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=hGFCpZU8; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="hGFCpZU8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1621188a12.3
        for <regressions@lists.linux.dev>; Thu, 08 Oct 2026 06:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791467310; cv=none;
        d=google.com; s=arc-20260327;
        b=TvAMo9wDIncxhvdD2UH2xF8IUQbC+/Nr88YWcjlAj+KeTaQEBhBzyo+Azq/SPFPG9q
         NUCvDS9epGaFAA3oqHs6YIFw221kLNDrh3hnJNJv4iJMn/UiHh8+wYhmr0Y6ptm/d90C
         q968D4KppGCzbSjSFJn1eNrwgbXax/3rbsJEpiDSQyFOkcaVuZSESPyULQ1/H0/+LGf1
         FPzD4MaduRN+OXZAx3wzSdeu5AjEm/cVOBuht1Bi5q0oEmHyuitKgRuA4suzpkvJHHp+
         J1M2aD4kDf+WQjbqjuI1b6Uf7jM4YF4k4Akda2mVMKnPFY2XOyaSgOw7T1fIL1kjixc+
         QnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GxYaZEmMSfj5cqopxpHkz12DEhpzIPayu+f2kBBrl7o=;
        fh=4W89ARxqhQgm5pYvDkkAjBmQG3Gy9VkXHcZI+GLC+Lo=;
        b=gz6XCM2XHCNB1ZGlt8rAco7ApHDf9qo4EjE5AfdNV/74lr188w074n0vFdS5SpHOZg
         b/DWdIhMPLRhbJj+uycdwDXtNdybm32eJPnbomlwJNa26D1MLZKQQ9BIStrAH/KPfF2/
         tMFXRv8sseHY8IRLOtWG4fmV+MtGj9/NGW3taZHDIwU7yDb6fX2HPL9KzKN/hQlmzyN4
         VK+liRz28H8M5lZaKrFh4YmrCaVPXa4Z0xFogbbJjjABFEowhfJZ4032Me0IVdaYOw+b
         42Ct10VLPtTxxNBJkKZjoKBlFWXj7hkx6rO3Db/4KlUHhzNxqWy88MQuUsEBxjdED6GL
         E6Tg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1791467310; x=1792072110; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxYaZEmMSfj5cqopxpHkz12DEhpzIPayu+f2kBBrl7o=;
        b=hGFCpZU8GAeOpiD0gg2CZMM6V2/dL973US0+LDgC3bMB9XXHPx/Gkmpgv9CPYakgYT
         S/uBVng0IJ94g4JECQFruZKjOXjlxgI0iR9LDfg1d95hVPx6T7un2GLuAYTyx0Ew61yi
         ctx2rU7m4/d1nqmsDriAH6wnY4wryfZhGqwAlo7G6Z+woempM1tSusmpTsKH4Z5ndMH7
         GM+bOgjpE8PN2Pqo/Z2751bnCl1W/pdtwYHBACbkJIvAtIcyY2TQxM2qazgBr4sg7kQA
         ZqazlV6YNc5PjbKzXz1r3aGXTs5yFQvW9i5/wPqwPg4yc4we2+mAPyLBMPjyLcUoRr5l
         eS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467310; x=1792072110;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GxYaZEmMSfj5cqopxpHkz12DEhpzIPayu+f2kBBrl7o=;
        b=sGDrr5mNtd08/ZcOAs+RbZHR8Fab/pG5+u+Tlv7AF8Xp8aOjMPjp6JF4z13I5LJhq3
         kbFVMSIcmuzNWyVc8oqa3IGxz/Jl6c2ZsMmaFA3tA5LN1k5L/XPp49NSna3r03ZGFpUM
         YPX7XcVHK9T10cAyH8b4SfPyh9KzC9GI//nMoVwFyIoNHVE2Z4plZRb1A1pz8zjiQz3H
         q5tb0Shb4NPX5z7f8rgw2hZEYNtE7wwUxRDFx8fKTYVbeltvKJ5tBtIf8qSJWG7ufSrJ
         GcI2grpgTYqWkO0Bm7RzqluXRNbKx+fcHha0iKrIHJOxb85L42J6xor91UgX/ER3VgOI
         sIng==
X-Forwarded-Encrypted: i=1; AKwUvBzKkiv4FwoIIs4qIbO6TELreMC9JSJ58BvopBfr1niJukzsmBnJy53hy9XBnqZgBcWRDS+dIwND4qKNNQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l/Cdt6vnEFwYITuQSsSW4GnQOsH47KEFWFiW5cjhZDAVdEq6vh
	cBdGGg9NOVYAY+8rG4ZABrCgasmF/xMZOvewMOZvjIy1wipsTJSNIEQNV1gtcVbILzG9tHRdnNi
	8strh9kOcT4Vu3uj+ovvaQKIxQqCH9voCpvxz6sI12INoJN3VT3PJqj4=
X-Gm-Gg: AYBFou3oG6XuA7C6KP+K8VzWMPDlKeYFR9LBF0lxJZygI39WFLDAQ3mPE/O2vSZEzsb
	RULInoVf8X7c3s6nJg9TPV2WljUxA8KeRQ9IsZZRMeiaq/WDVWMZ4XEQvy+4owVYdltgm6QLT+6
	hfdMdzOl7e9SZ1cQH9/eVjLOAuZSoi3WKQLjb91U/EXksvQ83Qe5bRLTmnF2olEJ69kEY42qlfq
	j+qDIRet3u6XhsihehWIh4kfyeQJFp/zTzX+JQfV6+8zS3E5ZKLeYGnE1+QrPPz+gOEElntNuck
	qlS8mR68paLbN8Z35M+a/BiMCFpF6JDJFD0iU1sQVxbxTfei8KhndiKhd6X3vyjrNmkSj2Mz1UQ
	CTApuwzn9VbdS8ao/qFGF5vL6CcdroJbJqKffCiLdbIdh108mVukc2gnf2QeiXp/ux1mFbiJCKW
	9VQc/rSHOmuA==
X-Received: by 2002:a05:6a21:e58c:b0:3de:5a00:e248 with SMTP id
 adf61e73a8af0-3e134154c00mr4172366637.76.1791467310506; Thu, 08 Oct 2026
 06:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
 <a6193df2-98f3-409f-b73f-5b91835a0107@kernel.org> <CAL4WiirwF6bZwocErCthJ+TUu7wipRfSibRBoKWjjkA2nVSrqQ@mail.gmail.com>
 <CAL4WiiqSmW093PDngLrUNiNA5GVKeM3+tAO7KMDJeyjYZ7GRzg@mail.gmail.com>
 <4c98eff5-c8c7-43ee-b59a-adb833978816@kernel.org> <CAPa5EdDk+HuVP0H1+iqOcHDHZnfdika5WOQcgSaMtfRFWzqZ+Q@mail.gmail.com>
 <CAL4WiipSpufpdo-AWoNEJta-puLQ5hMyPn2xcjwg4vg67PNoyA@mail.gmail.com>
In-Reply-To: <CAL4WiipSpufpdo-AWoNEJta-puLQ5hMyPn2xcjwg4vg67PNoyA@mail.gmail.com>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Date: Thu, 8 Oct 2026 15:48:03 +0200
X-Gm-Features: AclHuK_9cv-O-41xZVfpN6e8qZHktULAqfmGyDPNmDuHK5rePS-wDUMv3tjDuuI
Message-ID: <CAPa5EdC5+JiLCHdCt4m-sqM1pUs=fG8T7zsmVcheHCG8FFF8Fg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] r8169: TX stall with checksum offload on
 VLAN frames with inline tag (REORDER_HDR off) since 1517d1996b52
To: Eric Dumazet <edumazet@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, nic_swsd@realtek.com, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 at 14:48, Eric Dumazet <edumazet@kernel.org> wrote:
> This is the current patch under review :
> https://lore.kernel.org/netdev/20261008123812.554729-1-edumazet@kernel.org/T/#u
>
> Thanks.

Oh, I missed that, as GitHub "protected my privacy" and I ended up in
CC with its noreply address (which really leads to /dev/null). I've
applied that patch to our tree and started the build, I'll ask in the
issue tracker for testing once the build finishes and reply in the
patch thread if I get any feedback.

I've disabled the "privacy protection" on GitHub so I hope next time
it shouldn't happen - but just in case you'll be updating the patch,
please use my real address I use here.

Thanks,
Jan

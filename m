Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA07186284
	for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720314; cv=none; b=PIQAen0cd3v1t/HWTLzrOclA1mgGMCbAiojAkDzbfewpUNARNAVo2PhtOoGpWmO4VKmsItYlapIBc8x/EsWBkAVUdgihn1NAfnwo0/wzRn1l3P1Hg/VLab8oEICGv+H5xGSu5F8MSW6FLeRf4wea+EcLr+/z4X433msQq83MCIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720314; c=relaxed/simple;
	bh=DMT8gQy8g4ulSR+tilKyVevzgFxmeh4E1XZfeU97xY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfrqTF4gOkQZkRZSuvAg2lS+dnfUm55enAYBZWiIZM9h6xFaGsnocJevP7AmUe5xNR8y0lF6A4zK5UPiYyUXqwNx/eqJMeKGNhALkIpvtcd2s6RvrbTe3fxpblYmPdJVNpwXn4D682LGQgJvEHSFAJJQSjxEMaJmbT7orufqk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVKO9qKR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVKO9qKR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32326e09f58so372865a91.2
        for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 13:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720312; x=1756325112; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMT8gQy8g4ulSR+tilKyVevzgFxmeh4E1XZfeU97xY8=;
        b=gVKO9qKRnWnZCkRKnbi4rRtv739s2hPifZo44+iKYaon/Ci3Jq+DFR0i0k+lQxL0Dm
         TyEVTupKt2BzIBMwCKKrccPn9+TckxPjAn3F2cbX0B/m3TgWPVWYkJtgsaZhakPRWOP8
         qkF141C77psLe+Uo5xRwsNchpPSxonI6YlTO+AssB6u7dqWa18MVq3THu9s87XP4hDj0
         sT86tL3Rsn7xQhkHER0lKLXGODpHiXIJDVEIO4LjKi7b0aHXZtZ6iIpJinof48kbLdBB
         6e6Ou6eEUbnGQ8bpnp9/wjt5+pXRDxm+N2swbrYu7db8tGZA/YjpnbsP+dGK0lD/P9gp
         6VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720312; x=1756325112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMT8gQy8g4ulSR+tilKyVevzgFxmeh4E1XZfeU97xY8=;
        b=Q53A5FDiZwpspNRROKmqmEcpK/xcgnZ7bVJfzg+OD92c7UYYL922Sp+viwoOnIqukL
         JdaiJ2mbnihhVwkRhIqC/RokEaVFdau56C0kN+uIH7fZ1yjuxa4tlRtam/NQAR08hoqW
         T0MdDXksi6k6CbGRq/0Wq6E2ZWraTvHaA6Reb2gmlefQlSjjKYl2iGr1gxvR4zKGvnA5
         lNQ7QRJON2GZsSZknD5+dyhVZsZW25scwhghhQznWfD8A0n7umCFOWhLbHDMS4FHmThv
         CIlwFWYPP/dAfK7Ik0ltKKeEn0aOT5tsUAfXWpzN15IpAxt3+bWk7XYq02xWtGBHJTIM
         tgdw==
X-Forwarded-Encrypted: i=1; AJvYcCXS5foed+trhFmgGDp3FSbPtWrZDHH5PZG9oadCaxofpQa7FOo42OWYNc6Cd7D4eJTyOviShrbQ45rjlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwIVVOF4izqb7YoEIvUPlKkJuehBdkIquijNVQKQd3yxSV6gM+
	3L5zJ62HWnbmO5SIhFc8CB3bPuRRZoh8yJHizWYQ2svUIyW3Er3Al9a8bOukxtJkretKiBgbkfm
	QCV0ikobb7LYP6M9G4BVhDAzQTKTjenQ=
X-Gm-Gg: ASbGnctidM8/7rzaDuPrjyMTJZpCrmRxwsVMM/sNsKBFQO3JTtUze8NUJNjh8j2qaJY
	vv7S0vY9RO1d39cO+3Hf7DYEiVGfycn6g2zidT8UFQFW+6W2E4ZGUFmh04Xy/x0HKaJasN3SM90
	sruRweaF/v/40jluAPgQnsWU3c/iNS1i+NoRegHQsJWcpasKr6DP7lH9OJe++gGmGF/gNMt2dJy
	7Tuloc=
X-Google-Smtp-Source: AGHT+IH1Qq+bzYkRz1Cnps2zoGvMW0iVPgJd3Hpn9od4rUSylQIwnGGuSVnds0b9IhrA2E8NXaxvzNjI4YmB0N7B2Z4=
X-Received: by 2002:a17:90b:578b:b0:31e:b77c:1f09 with SMTP id
 98e67ed59e1d1-324ed195634mr144806a91.19.1755720312413; Wed, 20 Aug 2025
 13:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsO+EmR0QgFGjCbq74gzwbQbb76wjt1vOOOJnsCqj9hAhg@mail.gmail.com>
 <CADnq5_PdzYSzFL7KDsPV7zqX2avwn-NhSJqyVVPYF9LOMEyhWg@mail.gmail.com>
In-Reply-To: <CADnq5_PdzYSzFL7KDsPV7zqX2avwn-NhSJqyVVPYF9LOMEyhWg@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 21 Aug 2025 01:05:00 +0500
X-Gm-Features: Ac12FXx31T4QTbPwCQYmR0dHjxWtSJ0tOEBShMpNL4ncHjKi4hfVUoS4MlpvRRE
Message-ID: <CABXGCsMYpMXEFeycCXp6yJV8jUekOEtSpk0RV_==1x2bdJxVxQ@mail.gmail.com>
Subject: Re: REGRESSION drm/amdgpu: Radeon 7900 XTX hang & gpu_sched "Trying
 to push to a killed entity" since 1f02f2044bda (6.17-rc)
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Gang.Ba@amd.com, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:41=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
> Should be fixed in:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Daa5fc4362fac9351557eb27c745579159a2e4520

Thanks.

Confirming the fix: v6.17-rc2 already includes aa5fc4362fac and the
hang is gone on my system with vanilla -rc2 (no local reverts).
My earlier test of -rc2 mistakenly kept a local revert of 1f02f2044bda
- sorry for the noise.

For the record:
v6.17-rc1 (d7ee5bdce789): regression present; cherry-picking
aa5fc4362fac fixes it.
v6.17-rc2: fixed as the commit is merged.

Introduced-by: 1f02f2044bda (=E2=80=9Cdrm/amdgpu: Avoid extra evict-restore=
 process=E2=80=9D)
Fixed-by: aa5fc4362fac
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.

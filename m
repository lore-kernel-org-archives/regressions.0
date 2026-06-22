Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F4824BBEB
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113222; cv=pass; b=ZSXfcVUTARwCYUldMpTCmHmRSyENYio8HGmyFzZtCuBmOAfIGst0BM/rXvY50uGf7ytrsyZ3lN7Dygty33ZVp46Zy4kARG26Ggsr0MgMRrqSHFVHTeeFepcXEYs4upN93AolnVyEHtZTx0j9Cb7KZ2mHn+Ti/CMKTznVPtrLp7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113222; c=relaxed/simple;
	bh=oXwlQ4YdLFj3+t4xX23sSp0+z3dvUlQuSXprlsPnsSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ud8kURdlDFimTYEM/dtZejJZIuoZkSmrfyrycnfRPEt7nEN7KNjEdy3vMG747DFcajR9DAITpirLn/gcX7sRnKqgvsSAyDIgAMRj9O2N1auvAMo3h4+4tMtLVzB4sci6C4rOcYvD2n+zTdRxjHygcWZJUG0bf3Mj1isxji362S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7RG9qDR; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7RG9qDR"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e92cb77209so2091874a34.3
        for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 00:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782113220; cv=none;
        d=google.com; s=arc-20240605;
        b=JEkBIm34OBnpVSZyO1B8vTPo5Qn77YPSlmowIJi25gmwJJE2EOltArlYMOV9qlmhKw
         5x2FKljKLztL7MeElJj2+pZ/xBoffkDEDFYKvHlPfllaBHX2Rp3vIhSk1BCZcQn7mwsn
         zToSZ3mQvHvBCkzVNRKsA8EGUkY2bL5/rByaDNkqF7YHcT4WW9Y/TnVb9RGNMeudvp8q
         bGC/AaOUOsam5lesFu7wdMQMLS9hs6RO6aVE43TEbxWsbc3cRX4mRZxbH380yfxiFN2x
         AsgWTW49/qKS7ZWHTLUlKpNDoVrOQXIvkQON8VVbwVjLTU/29eA+Y5tZqXthnizG97i8
         0SLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b7FQ1aR5OdpNqu3r0SBRqrV7xGbQqLLo0aQcbDX73CQ=;
        fh=zbHY3D43mWmFOkUwR9Yjra+ea+txJuz9AI2FJN6mV6g=;
        b=YG/o3i5I2Q1lZYF4PFbautjm+cwU+UFsIEL55TJy8tP9Ghisc37J0JUlGaRjaEqx/2
         yoe4AaQEORftmLuK7hQQFQNWwtqZJIZiopV7wlo13hRyE+GLv8eF5A380lNH0W32x3cp
         F84LiRlA9hZIfZ5XEDKbTPuwRiN2qrljP9Q96qeybhaj7wmfiTTUq7OPFF5klfDahU8C
         mnqtdU4OnQdE/NzuABCLQMnkK5c8TyWaMSiHxsKaHJf3D8m+ZkbvO2TMTiGywwkBW9qW
         8fXefsiqPz7vLK6AH1CIwkGQhtY21Fo+QkHm+Q9RVPIWv9G09aNQXIsCI1gciPWtI35n
         asvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782113220; x=1782718020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7FQ1aR5OdpNqu3r0SBRqrV7xGbQqLLo0aQcbDX73CQ=;
        b=e7RG9qDRJeNmxup4YHmT8wrM74PckIn5ju+Gsd0vgNiOq2NdEs0mNn6Q5f7PdwKVyy
         17nDkBwj/+4ac4h/LqXtzSeF07CYvzTj7rO2Hug2+EYUnRiVyxNb2PSoS2yH6n485y/z
         3fq+ToAwH496dLg+YO/rEeF2Pq6vbd/kYkVKzyzg0VmCzrEV0li5gDRoy+W8dA5uZhNs
         cMw2TEye2YSSmItM/Tqe1EEySkFPmr1CYfKojnjXlTN8IKaCJ1U9brk2KYmQAXmZLX7G
         hTHO8O956VFjGYS9s9uo10mHFw/pPGiRw0gL90nst+q1GYfK/WdQkt1Kj/MN4CALmaUu
         am0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782113220; x=1782718020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7FQ1aR5OdpNqu3r0SBRqrV7xGbQqLLo0aQcbDX73CQ=;
        b=OdPuXgA7kx/bsqklObWfgQpmUMQDmZ0WIvAiXz4KLRAA0XtMhDMUPsSXVM49QraO0X
         7UlJOha7TuJMS6qM5Ui00tGG8sQ2Zqy7FeTHKnH8NFYLag1f6kb/uFDml4QCE0dIW1Jp
         eiyiUX+DXDBWsTX7YIzlOjDTiuAc5bSd59biPR5LUE7ibMrJFEtUI6HsTIaObpF0Pazo
         NxoCZVZ2ieEmKz3+QgvSxLQzZUIAnZCYL5N7BOOSmLxejJqOndJcmHvGaFFf9UhjIEfH
         dP7KcJOBGCOsuECr6Hlq0UPfXHjdhFlsEjv+eM9RFjUXtQbytFPLwoy4b+3nDW9Gdoa6
         d9ZA==
X-Forwarded-Encrypted: i=1; AFNElJ9aGO20+esvnygWUFiJyUD+dR5YmZfmD5WR3V/LKKLtTdSAe91dwQ2XGYTlhI9I4O9HSPw5F9Q+KJYTCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoHt9/KlIUs9Xs2vGkoznPHykmWx5grVhX3Bre6oZKkeKmkNAF
	KYXJxy+gdW/k4FztnGQcafBSUntgAh0R3E7LE8QFyC5EzAFt4D8aijfTkfmJVJ+7cOfGy6eEnUv
	ybMCE/zSAhLW2/e2mjlRqmRR67jc2zXE=
X-Gm-Gg: AfdE7cnQn+hvy1KaDeP0TDYvx7VHljklwJkbD9HmnnTT2OOBilQnWexxO4KA4FQAUKX
	yO8ShSphUcrWbM91ApTkTzCsx138oKdK5UefVqOvXchKG+Y5+HS1fi8+JLWDwtE6dO7fD8taoyB
	NcbabKv3u0zChStNViV/yDdACgnjhPisTD+1Zzfr0awVbi9/YP1TSCh6OykUkwrcKR/XN/3GP/n
	1m9yBtrnCzH6ImKc4Y/Q2z/+EJkEcb2P+++ZlaA3gIFDzEhRdsOZT6SiphD/x0oYvZ05iz4aCA=
X-Received: by 2002:a05:6830:3493:b0:7e1:f7e9:327e with SMTP id
 46e09a7af769-7e9323e5412mr11396887a34.22.1782113219802; Mon, 22 Jun 2026
 00:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsOuCXr4R+WW60KNuWNS2MqzE9w6iv-t_ykbwmhqDSABAQ@mail.gmail.com>
 <c084c555-e4f4-48a6-9fad-175932acda01@gmx.de>
In-Reply-To: <c084c555-e4f4-48a6-9fad-175932acda01@gmx.de>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 22 Jun 2026 12:26:48 +0500
X-Gm-Features: AVVi8CdL5HCS6SzL7JevAxlu8t7MCcOBjE3b4wSUAQVcGGIU9Sqd3fb5ZlnE_Hw
Message-ID: <CABXGCsNAEapxA3gZis6XCg_KWxzRGsxiwR9-A7Dh-+iDNGpaNQ@mail.gmail.com>
Subject: Re: [REGRESSION 7.2] drm/amdgpu: ~275 SDMA jobs per sparse VA bind
 since 4cdbba5a (RE Requiem 90->4 fps)
To: Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 10:44=E2=80=AFAM Natalie Vock <natalie.vock@gmx.de>=
 wrote:
>
> On 6/21/26 22:55, Mikhail Gavrilov wrote:
> > Hi Christian, Alex,
> >
> > git bisect points to
> >
> >    4cdbba5a16aa ("drm/amdgpu: restructure VM state machine v4")
> >
> > as the first bad commit (its parent tests fine) for a severe
> > interactivity regression.
> >
> > It was merged during the current 7.2 merge window; it is not in any
> > released kernel yet and will first appear in 7.2-rc1.
> >
> > Symptom: Resident Evil Requiem (re9.exe under VKD3D-Proton, RADV, RX
> > 7900 XTX / Navi31, gfx11) drops from ~90 to 3-4 fps the instant the
> > camera moves; still scenes are fine. The previous bisect point
> > d352990bcaab is smooth.
>
> I already fixed this in a patchset[1] that should be on its way - seems
> like it didn't make it into rc1 at least?
>
> Christian, Alex, can you make sure that the first patch from that set,
> "drm/amdgpu: Only set bo->moved when the BO was actually moved", is
> included in a -fixes PR for 7.2?
>
> For the record, I intentionally did not include a Fixes: tag in this
> patchset, because the commit was not merged anywhere but
> amd-staging-drm-next at the point of writing, and the same commits in
> amd-staging-drm-next and upstream have different SHAs. AFAIU, this also
> prevents me from telling regzbot that a proper fix is underway for now.
> Not sure if there's a workaround for this?
>
> Best,
> Natalie
>
> [1]
> https://lore.kernel.org/amd-gfx/20260529153051.973261-1-natalie.vock@gmx.=
de/

Thanks, Natalie. I applied that first patch ("drm/amdgpu: Only set
bo->moved when the BO was actually moved") on top of ef0c9f75a195 and
the regression is gone -- camera movement is back to ~90 fps.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Re regzbot: since I opened the regression, I can link your fix from
here without a Fixes: tag or a matching SHA -- monitor just takes the
thread URL:

#regzbot monitor:
https://lore.kernel.org/amd-gfx/20260529153051.973261-1-natalie.vock@gmx.de=
/

Later, once the fix lands upstream, the entry can be closed with a
regzbot "fixed-by" on that commit's SHA.

--=20
Thanks,
Mikhail.

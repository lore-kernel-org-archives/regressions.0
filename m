Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D2382F1D
	for <regressions@lists.linux.dev>; Tue,  2 Jun 2026 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399450; cv=none; b=WAMMUCpCVj0NAXMa4EDB/GWZOTiCvpQcP/YuJDLbXgzKcLLBzQ4ejJd4WKvpyNN9RpYIBcc3sFH6pXBwdBTCTHRTT/J+SMNWuv0bO2Y0JMDs4olq76OTd2fdSAL8IO+40jVT7ueGiw6eZ+LT0tquR2C7rOxhWYwJi8KJ8dD8i1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399450; c=relaxed/simple;
	bh=A5Y6PN1bspB+29ZXobNqASvZtb7ARzqH/4rIDMEU9eU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILYi4hANid5vn+afJs+R6RovaTxhCfD1HlQWd9hPUO5XwC0OrikPLKWFPAd5sIjTWkhBxx8UicMtxC65EPpdVuRKto0tK51KDV80pS/J75Xtei3Q/cVnNHHHNDPgq7jpKbpRU7iVBJo4dCCkHR4Wzh6B6pPrku6fv2ekT38/na0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=d05zKxK4; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d05zKxK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1780399442; x=1780658642;
	bh=a9fgN7nmhBc6vLl3TBFAXIuSjCzaskI50tzfoiuYcAQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=d05zKxK4I6mNSuKZe5/9uDirCkpaxM+npMK7dGREn0n2wIRn1cXCk9XgK7fPSCRty
	 uejEtqudYvCl6R34paU5naihVnqGNAyBoJbfaUzkHHuXSkNNiPYm7G5iC2M/3ShEtc
	 MbYsOosEDt0DSC03PgYA3C4eft9Nxk6M7xgV/PQT7DBouQV5g4SATcRCVleWTEDCHQ
	 qStpqHvIf5JnFZMUYQRFGhcvoCOZxUZUdHXugzJaUtfkquW4BkFKR8QBqXX6dqEM7L
	 jZ4rw6HFY7jlzNvR5lplsLdfHYFzk169tUhZtCQLV0lu+83yycLxmXtMq+SvrXlv36
	 FZMDJR+d/zl3w==
Date: Tue, 02 Jun 2026 11:23:57 +0000
To: Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev
From: Tj <tj.iam.tj@proton.me>
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [REGRESSION] RIP: 0010:vce_v1_0_set_powergating_state+0x5b8/0x600 [amdgpu]
Message-ID: <43123501-2119-4ac6-b1cd-e59dfe6dca89@proton.me>
In-Reply-To: <59f38ae7-2d5a-4dcf-bff9-7e58c36f36d4@leemhuis.info>
References: <ah6q-k5wvRbW6k6e@mail.iam.tj> <59f38ae7-2d5a-4dcf-bff9-7e58c36f36d4@leemhuis.info>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 39e7211d699ec92de7dbeb1ae2dd89066f898786
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

v7.1-rc6 +=C2=A0 "drm/amdgpu: Align amdgpu_gtt_mgr entries to TLB size on a=
ll=20
SI" and confirmed resolves this issue. Thank-you.
On 02/06/2026 10:22, Thorsten Leemhuis wrote:
> On 6/2/26 12:06, Tj wrote:
>> Repeatedly hit this with 7.1-rc6. I haven't yet got time to do a bisect.
>>
>> $ lspci -nnk -d ::0300
>> 0a:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [=
AMD/ATI] Cape Verde GL [FirePro W4100] [1002:682c]
>>          Subsystem: Dell Device [1028:2b1e]
>>          Kernel driver in use: amdgpu
>>          Kernel modules: radeon, amdgpu
>>
>> $ journalctl --boot 5e39a2d49af2432c8f14f2a866a6b275 --priority=3Dwarnin=
g
>> ...
>> Jun 02 09:25:11 sunny kernel: Linux version 7.1.0-rc6+debian+tj (linux@i=
am.tj) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.4=
4) #446 SMP PREEMPT_DYNAMIC Mon Jun  1 07:32:2>
>> ...
>> Jun 02 09:25:11 sunny kernel: WARNING: drivers/gpu/drm/amd/amdgpu/vce_v1=
_0.c:329 at vce_v1_0_set_powergating_state+0x5b8/0x600 [amdgpu], CPU#8: (ud=
ev-worker)/251
> Thx for reporting this. This is not my area of expertise, but from a
> very quick look that seems to be the issue
> https://gitlab.freedesktop.org/drm/amd/-/work_items/5336
> for which Timur sent a fix:
>
> drm/amdgpu: Align amdgpu_gtt_mgr entries to TLB size on all SI
> https://lore.kernel.org/all/20260525112204.12604-1-timur.kristof@gmail.co=
m/
>
> According to Alex it's making it's way through the ranks. Consider
> testing it to ensure it really is the same problem.


Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FE230CD81;
	Mon, 28 Sep 2026 05:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572571; cv=none; b=OUcvvIXhOh7aaUHYic/twq6hXoVif+geA7xjpsXCQ4Wr1kORpLGnNzOVYCytI8/GJf+I1Fpuw7CZ0d29w5LZa1KOFcO9spFh7yIrkzT9kYYwmCQJg+BKMBOldXA7F9Onqe6mVcVMntMIvfWJSkFocpfmsoGgK+Z7HbftBWYxlBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572571; c=relaxed/simple;
	bh=Joyd9RLxBp7pIIGPGXfU/wZVMyjWdm6zfGvV+tF9WfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hjol6+lvCvbYy78fjkqkxujAjHWqBSlN8tuBr9tBu7WBwqvLROhSxZ4ZydXB8C+P/tPDqxlOrsgZJAGTVnTTu4IV50tjTdfGY1nBWtwNIqht7yAkUyOglg3qLmYESS6JUVYgOYWuBElI1ApmgzIO1judDnFFiFtDl3tSQUiqpyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TdDcSioU; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TdDcSioU"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4htTy92rsFz86XR;
	Mon, 28 Sep 2026 07:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790572481;
	bh=Joyd9RLxBp7pIIGPGXfU/wZVMyjWdm6zfGvV+tF9WfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TdDcSioUaUJnIhoRLbxvN529Pi1e2thjtx5IQM1MTHfCywXnsY85Rl1IQznIN1h2f
	 F0/C1CFkgKcwMliEN6B5dOatLTE0qApSdhm+bgwMKdKxnrIFhqv8xYiAtzzr1kLAeA
	 ah3d/sHnqiM6tlqym/Z1eH15q/LjuDB2OBtcYoDiiG+xqlGL/0aNsZd6ElEGWu8WSM
	 oWusj9WdR8XYlpobyekfh32+SygeBqK8jru1u3BTXZY1ScEQ+alBQEUT8DzNlfrRxe
	 qZmHLE4oBXJHJXna8rH8WJnHx874TBRwugJnWkG7ivw6JJI+uL3KXZRla2Wk52x3pr
	 oqj5yFN6wqzIw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4htTy92827z86Wx;
	Mon, 28 Sep 2026 07:14:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4htTy70cgZz8tgX;
	Mon, 28 Sep 2026 07:14:38 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C92865F9B7;
	Mon, 28 Sep 2026 07:14:29 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <cdd46214-2373-41a2-bb27-62c76a7aaaf6@leemhuis.info>
Date: Mon, 28 Sep 2026 07:14:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build)stack frame size (3096)
 exceeds limit (3072) in 'dml_core_mode_prog...
To: Alex Deucher <alexdeucher@gmail.com>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, Alex Hung <alex.hung@amd.com>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io,
 regressions@lists.linux.dev, broonie@kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <179039514312.597384.1659548947123427650@kernelci.org>
 <8ad00f0f-d924-4b19-986c-8c17dcdade86@leemhuis.info>
 <CADnq5_O7R096UP9mF5RvGSzT+c2p2v2Dm8M243CLxXa=VZvRwQ@mail.gmail.com>
 <CADnq5_Mg-0CjN1hVm58N=jVhFO_abjNU6mAPY3MpfsajsGfUMw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CADnq5_Mg-0CjN1hVm58N=jVhFO_abjNU6mAPY3MpfsajsGfUMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179057247031.3039874.5180145718934966469@mxe9fb.netcup.net>
X-NC-CID: BerssdD3xCyEb8hW7Y0qO5/qL1P8pFU2HXTcOFJPqUB/wqFc92Y=

On 9/27/26 21:33, Alex Deucher wrote:
> On Sun, Sep 27, 2026 at 9:29 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Sat, Sep 26, 2026 at 6:37 AM Thorsten Leemhuis
>> <regressions@leemhuis.info> wrote:
>>> On 9/26/26 05:59, KernelCI bot wrote:
>>>> New build issue found on mainline/master:
>>>>>>>> =====================================================
>>>> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
>>>>  10513 | static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
>>>>        |             ^
>>>> 1 error generated.
>>>
>>> Hmmm, there are known "stack frame size [...] exceeds limit" problems in
>>> -next that should soon be fixed there, see:
>>> https://lore.kernel.org/all/CADnq5_MFMriR-b3eX0mTZShPDgUBgwoObgumEjJ9cJqdmDM6xQ@mail.gmail.com/
>>>
>>> But this error is new -- and happens in mainline. Wondering if this is
>>> caused by a fix for those problems.
>>
>> Looks like some combination of compiler and/or config options explodes
>> the stack even further than the recent changes handled.
> 
> Should be fixed with this patch:
> https://patchwork.freedesktop.org/patch/756590/?series=175063&rev=1

Great, many thx.

#regzbot fix: drm/amd/display: Fix sanitizer check for the DML frame
size limit

Ciao, THorsten

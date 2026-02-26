Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A821B185;
	Thu, 26 Feb 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086561; cv=none; b=OlidqgkYlh7UWPI19FxvsaSLDpzGcIVEgmp1/4sMse4qhvjzOOYxLerZWgh/I0wlK9EB7S428Y4I3xkSGKVHYgvjM3YcJM9m8FkOKwcrfOVe6FSaa5rArsgMSk7tb4TiuhHCtfeRWSb2CWQdaCd45lqVlBl1GvSsMbRA0jS6ztU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086561; c=relaxed/simple;
	bh=YgLF/QZ7DNboUw70vUFZKMnCHyULdhdFZwE/VpZGRVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqqUHT6a7GKygwXe8cLAReIYZ/P1H4tPGdgvn/7CU65H6/TdMKUAqHIEj1mJ0CxejfwHeWHLypubhpfOZVxJwmyrgtwLddbBi7rm5Mo72H4kG5UNEQA45kPS1DSvQaj3t9yyva+zuaAlAcd0g/PsKhanZj0Uzpvrz/7dPhwzd8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Tyr6nIlG; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Tyr6nIlG"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4fM1GP70R9z8g0R;
	Thu, 26 Feb 2026 06:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772086078;
	bh=YgLF/QZ7DNboUw70vUFZKMnCHyULdhdFZwE/VpZGRVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tyr6nIlGF6dLwTPmmV26mzkolNdjJjGfcU6FFexVKVFXJNcD9NwuPOgQfpWAIYghg
	 eamGRo2E02b3N+5P0o7WwpXpSfi/Qassapk4uW0iybEL51v/2CJIXrejxw2WTOkH8m
	 CSwGzwxs4nF1Cus8KYQdsBg54idGFgha09Ku3zfc6oX+LYqjicc2tNWMCcipADE9cO
	 Y1lVRWRU6eLhaPWBb69jD/LeNwbwu0DCtv5Nijc+Zfmo829F7S+H2lXeSQQB4gppK4
	 cNYuojCWZGEpEjAo8tt/WXeJ6puqGsBlsnDGOz/02vWlglDP14u3FeU3UZwoGsvRRS
	 aK+xTan+wQT9g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4fM1GP6FhHz8fy0;
	Thu, 26 Feb 2026 06:07:57 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fM1GN0Ncxz8svL;
	Thu, 26 Feb 2026 07:07:55 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 166946746C;
	Thu, 26 Feb 2026 07:07:55 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ff09cd21-3290-4254-85d3-42966efc4ff5@leemhuis.info>
Date: Thu, 26 Feb 2026 07:07:54 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `__udivmoddi4' in vmlinux.unstripped (drive...
To: Randy Dunlap <rdunlap@infradead.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org, Kees Cook <keescook@chromium.org>
References: <177205314269.2960.1720626770087948602@d14e337afe00>
 <469ff3b3-8bb9-44ce-9b08-af49f5c22a5a@infradead.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <469ff3b3-8bb9-44ce-9b08-af49f5c22a5a@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177208607542.761837.14536169702537603704@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 166946746C
X-NC-CID: 2pNAdk141nwAJ0xhYwf4rFmqgMXzu0TqHMGlOX5neVwQHuIvlOo=

On 2/26/26 06:48, Randy Dunlap wrote:
> [adding amd-gfx]

FWIW, from a very quick look this looks to be the same issue that 0day
reported yesterday also that Kees wants to look into:

https://lore.kernel.org/all/202602250926.E587F86@keescook/
https://lore.kernel.org/all/202602251312.pq8yvrww-lkp@intel.com/

Ciao, Thorsten

> On 2/25/26 12:59 PM, KernelCI bot wrote:
>>
>>
>>
>>
>> Hello,
>>
>> New build issue found on next/master:
>>
>> ---
>>  undefined reference to `__udivmoddi4' in vmlinux.unstripped (drivers/gpu/drm/amd/ras/rascore/ras_core.c) [logspec:kbuild,kbuild.compiler.linker_error]
>> ---
>>
>> - dashboard: https://d.kernelci.org/i/maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80
>> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> - commit HEAD:  877552aa875839314afad7154b5a561889e87ea9
>> - tags: next-20260225
>>
>> Please include the KernelCI tag when submitting a fix:
>>
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>>
>>
>> Log excerpt:
>> =====================================================
>>   LD      .tmp_vmlinux1
>> ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
>> ras_core.c:(.text+0x273): undefined reference to `__udivmoddi4'
>>
>> =====================================================
>>
>>
>> # Builds where the incident occurred:
>>
>> ## defconfig+kcidebug+x86-board on (i386):
>> - compiler: gcc-14
>> - config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-699f38921f24bb69463aa0f4/.config
>> - dashboard: https://d.kernelci.org/build/maestro:699f38921f24bb69463aa0f4
>>
>>
>> #kernelci issue maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80
>>
>> --
>> This is an experimental report format. Please send feedback in!
>> Talk to us at kernelci@lists.linux.dev
>>
>> Made with love by the KernelCI team - https://kernelci.org
>>
> 


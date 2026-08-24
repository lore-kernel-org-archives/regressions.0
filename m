Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754AA18DF80
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554934; cv=none; b=ZUrPuQoSQhLs8ZanFBeiUwF0S1nO7AYN0XZ7CoQqpm0Xtzcg3Xqcl4UVWfaEMsEC6B33QLCBQCkROY/XzyUgKW6DpFcRjY0eP4gQbXWMLcSUFcyC9OFBRzs4/tqUO2Yrf1XtYEAGgDez0IWVXrkgYu7M63DWxc9t0AwxCqKbyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554934; c=relaxed/simple;
	bh=9PtxZmdpWJy7tmoPYE5shP6ULjdkq/NSzuHVri4L86I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRq5aGv+/09JawJiP8wBGmEWAalskiCCajmfpe/9IEOCUvjs5wXWm2J2lbrq92MNOMAnNGJJO1LLiai5GOWT13uuC9Nuayes0iI8kiKvq7uFk4dY5D5bGAPUHXeus5uRgbYaykukGk5YHnnzmItopQlCdxenMdfXAGenPNMrNXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AiXSmh3f; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AiXSmh3f"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hT1rY2S87z6Jw6;
	Mon, 24 Aug 2026 08:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787554525;
	bh=9PtxZmdpWJy7tmoPYE5shP6ULjdkq/NSzuHVri4L86I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AiXSmh3fb0UlnPjg1E9FMErnELjf4zmTzqgR1hvnPDc+eli99c9U0CGA9jLvdUGIY
	 TPVpGS7CGfl2uoXszS+UbbkEFjiFpxUd/4OTIdLJM4cLhxkEx78VfuRjP/f0VdoIPW
	 3QfprA+9xv77bPmfveqU8Wjju/ImpgFrak/hPXlFdpCXHfrp/1HUmb8KRtDeHFOKdZ
	 GsUcpGgdfmtCHPAXff/GoFUj2YNIT1hI5U1Dxb1B5oHUZ9jiYAu8FkAjQv542lpAy/
	 +06ZVmeK/GGi/OvsSIT7vsJNTFkkVK7GcxzK7Mrqut9HERJT9QIYYY/oEJdUakkFGR
	 XPMhOShHnwb9A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hT1qR14zbz503d;
	Mon, 24 Aug 2026 08:54:27 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hT1qP0SBnz8sb9;
	Mon, 24 Aug 2026 08:54:25 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0342C5FA57;
	Mon, 24 Aug 2026 08:54:19 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a02b160a-874f-491c-987b-4d7eb0d35a9f@leemhuis.info>
Date: Mon, 24 Aug 2026 08:54:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH REGRESSION] um: Fix cpu_feature_enabled() build breakage
To: Fabian Franz <fabian@isomorphic-ai.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Nikolay Borisov <nik.borisov@suse.com>, "Xin Li (Intel)" <xin@zytor.com>,
 Ingo Molnar <mingo@kernel.org>
Cc: Claude Fable 5 <noreply@anthropic.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260823201521.2576344-1-fabian@isomorphic-ai.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260823201521.2576344-1-fabian@isomorphic-ai.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178755446061.2020125.1851178788437493684@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0342C5FA57
X-NC-CID: 2sHLPueSSbbRMPKfljmTIpQyD99CSG7veHNIoIAIVas3qQu2B9k=

On 8/23/26 22:14, Fabian Franz wrote:
> Since commit 3ed403bbc967 ("treewide: Remove CLOCK_TICK_RATE") deleted
> the (otherwise empty) arch/um/include/asm/timex.h, UML builds resolve
> <asm/timex.h> to arch/x86/include/asm/timex.h via the HEADER_ARCH
> include path.  That pulls <asm/tsc.h>, whose get_cycles() uses
> cpu_feature_enabled(), into virtually every translation unit, starting
> with asm-offsets.c.  This newly expands parts of UML's copy of
> <asm/cpufeature.h> that no longer compile, and "make ARCH=um" now dies
> in prepare0:
> 
>   arch/um/include/asm/cpufeature.h:52:39: error: implicit declaration
>     of function 'DISABLED_MASK_BIT_SET'
>   arch/um/include/asm/cpufeature.h:115:17: error: implicit declaration
>     of function '_static_cpu_has'; did you mean '__static_cpu_has'?

To ensure everyone is aware of it: Thomas Weißschuh (now CCed) a few
days ago already submitted a fix for a problem that to my untrained eyes
looks like the same problem (do not hesitate to correct me!):

https://lore.kernel.org/all/20260819-uml-timex-fix-v1-1-f690b514fc9f@linutronix.de/

Ciao, Thorsten
> Two independent breakages meet here:
> 
>  1. cpu_feature_enabled() and this_cpu_has() still test
>     DISABLED_MASK_BIT_SET()/REQUIRED_MASK_BIT_SET().  Those used to
>     come from <asm/disabled-features.h>/<asm/required-features.h> via
>     <asm/cpufeatures.h>, but since commit 8f97566c8a81
>     ("x86/cpufeatures: Remove {disabled,required}-features.h") they
>     live in the generated <asm/cpufeaturemasks.h>, which only the
>     arch/x86 archprepare rule generates.  ARCH=um never generates nor
>     includes it, so the references have been dangling since then.
> 
>  2. The _static_cpu_has() macro expands to itself.  Commit
>     3eaa50e1e255 ("x86/cpu: Hide and rename static_cpu_has()") renamed
>     the inline function _static_cpu_has() -> __static_cpu_has() and
>     the macro static_cpu_has() -> _static_cpu_has(), but in the UML
>     header the macro's out-of-line branch kept calling
>     _static_cpu_has(), which now names the macro itself and is left
>     unexpanded by the preprocessor.
> 
> Fix the macro to call __static_cpu_has(), as the x86 header does, and
> drop the mask based short-circuits from cpu_feature_enabled() and
> this_cpu_has().  UML has no compile-time feature masking to express:
> capabilities are copied from the host's CPUID at boot, see commit
> d8fb32f4790f ("um: Add support for host CPU flags and alignment"),
> and generating cpufeaturemasks.h from a UML .config would wrongly
> mark features disabled simply because the gating CONFIG_X86_* symbols
> do not exist for ARCH=um.
> 
> Fixes: 3eaa50e1e255 ("x86/cpu: Hide and rename static_cpu_has()")
> Fixes: 8f97566c8a81 ("x86/cpufeatures: Remove {disabled,required}-features.h")
> Signed-off-by: Fabian Franz <fabian@isomorphic-ai.com>
> Assisted-By: Claude Fable 5 <noreply@anthropic.com>
> ---
>  arch/um/include/asm/cpufeature.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/um/include/asm/cpufeature.h b/arch/um/include/asm/cpufeature.h
> index f7770083c0a4..20b2c7ead62e 100644
> --- a/arch/um/include/asm/cpufeature.h
> +++ b/arch/um/include/asm/cpufeature.h
> @@ -37,8 +37,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
>  	 test_cpu_cap(c, bit)
>  
>  #define this_cpu_has(bit)						\
> -	(__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :	\
> -	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability))
> +	 x86_this_cpu_test_bit(bit, cpu_info.x86_capability)
>  
>  /*
>   * This macro is for detection of features which need kernel
> @@ -48,8 +47,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
>   * supporting a possible guest feature where host support for it
>   * is not relevant.
>   */
> -#define cpu_feature_enabled(bit)	\
> -	(__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : _static_cpu_has(bit))
> +#define cpu_feature_enabled(bit)	_static_cpu_has(bit)
>  
>  #define boot_cpu_has(bit)	cpu_has(&boot_cpu_data, bit)
>  
> @@ -112,7 +110,7 @@ static __always_inline bool __static_cpu_has(u16 bit)
>  (								\
>  	__builtin_constant_p(boot_cpu_has(bit)) ?		\
>  		boot_cpu_has(bit) :				\
> -		_static_cpu_has(bit)				\
> +		__static_cpu_has(bit)				\
>  )
>  
>  #define cpu_has_bug(c, bit)		cpu_has(c, (bit))
>
> -- 
> 2.43.0
> 
> Every ARCH=um build has failed since the 7.3 merge window.
> 
> #regzbot introduced: 3ed403bbc967
> 
> Steps to reproduce on master:
> 
> make ARCH=um O=/tmp/um-build defconfig
> make ARCH=um O=/tmp/um-build -j$(nproc)
> 
> fails with:
> 
> /home/ubuntu/projects/linux/arch/x86/include/asm/tsc.h: In function ‘get_cycles’:
> /home/ubuntu/projects/linux/arch/um/include/asm/cpufeature.h:52:39: error: implicit declaration of function ‘DISABLED_MASK_BIT_SET’ [-Werror=implicit-function-declaration]
>    52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : _static_cpu_has(bit))
>       |                                       ^~~~~~~~~~~~~~~~~~~~~
> /home/ubuntu/projects/linux/arch/x86/include/asm/tsc.h:79:14: note: in expansion of macro ‘cpu_feature_enabled’
>    79 |         if (!cpu_feature_enabled(X86_FEATURE_TSC))
>       |              ^~~~~~~~~~~~~~~~~~~
> /home/ubuntu/projects/linux/arch/um/include/asm/cpufeature.h:115:17: error: implicit declaration of function ‘_static_cpu_has’; did you mean ‘__static_cpu_has’? [-Werror=implicit-function-declaration]
>   115 |                 _static_cpu_has(bit)                            \
>       |                 ^~~~~~~~~~~~~~~
> /home/ubuntu/projects/linux/arch/um/include/asm/cpufeature.h:52:72: note: in expansion of macro ‘_static_cpu_has’
>    52 | builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : _static_cpu_has(bit))
>       |                                                             ^~~~~~~~~~~~~~~
> 
> If this is known please disregard. I am also not 100% sure if this is the right fix or if it's better to bring back the macros to um.
> 
> In any case it would be good for um to build again on the master branch out of the box.
> 
> Thanks,
> Fabian


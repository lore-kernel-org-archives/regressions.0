Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98822AE68;
	Thu, 26 Feb 2026 05:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772084928; cv=none; b=AwMG8X2H7D+sgJOq6SeHN96/lP2NdcLT10AFZ4P2JROWnlIzRZ/Cfe/K7/r3EiBNDueKhDnL/awAxA+IOrtD8UFRIY29h6e0/uPVZ6Y505nkG7rVsUsfjvWTH7vjk6fnHbEeY1Sj+2B3ZuLcePaKH9Jcv/ZxrF5/smYIs7wKJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772084928; c=relaxed/simple;
	bh=y1Q2q3ZQTyLf9VrU0KuPAtH1qnuj1ai8RkzLK4NTRsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGIc06FGfj3Uz6T+Rm22TDWRYGdhwCufuS3W9uO+r6nPkTyRx2Fs4M6O5uZpeGxW0STAT6+M5C9BRauwQT4/n9IJbWXz5QuDA4cT1qfnrgVVJYaPixpjVEmQktZ6O89xV0T3hF8NstbaWU0uN8RAHBKY2VYOdyPnEKoDBM635ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J8Rar496; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J8Rar496"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=MSvN9YH1BdPQPqlACYK4QBqGiK4lnmZtlxhkuunVWZ4=; b=J8Rar496D4bAuVaJ8/6YryKier
	vGVPxaPMdrBcL2lJ8mbccaMdi8JlyncDNY/MK9dxRiv/YNQ8AvfpjB+enJJO6qvyKWiJpIoQ2zHbu
	Ak4aJaBYgfQsYAlO1yXGFWMUpzeFm3k1nDNfL60hCYsflj+xe1nFRuF8M1nweMtcXgCBjwFycb1fN
	gUGVlzi3SDp84w3ioRq0hiNAsU1zvxFOJO44CovWu0+G7e6g/8UegjrfHHDy5M9WV7TasD4D2zDrj
	UlXW3aq3DhNrRDS1YQ9fo8IZz0kFSWAjOTOMYq7auJxC0gzkwTyESL+oj74PVIdyuSfVQN4Wc6Iuj
	9ljdvHsg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUEw-00000005Rm0-2xaC;
	Thu, 26 Feb 2026 05:48:46 +0000
Message-ID: <469ff3b3-8bb9-44ce-9b08-af49f5c22a5a@infradead.org>
Date: Wed, 25 Feb 2026 21:48:46 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `__udivmoddi4' in vmlinux.unstripped (drive...
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <177205314269.2960.1720626770087948602@d14e337afe00>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <177205314269.2960.1720626770087948602@d14e337afe00>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[adding amd-gfx]

On 2/25/26 12:59 PM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  undefined reference to `__udivmoddi4' in vmlinux.unstripped (drivers/gpu/drm/amd/ras/rascore/ras_core.c) [logspec:kbuild,kbuild.compiler.linker_error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  877552aa875839314afad7154b5a561889e87ea9
> - tags: next-20260225
> 
> Please include the KernelCI tag when submitting a fix:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> 
> Log excerpt:
> =====================================================
>   LD      .tmp_vmlinux1
> ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
> ras_core.c:(.text+0x273): undefined reference to `__udivmoddi4'
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## defconfig+kcidebug+x86-board on (i386):
> - compiler: gcc-14
> - config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-699f38921f24bb69463aa0f4/.config
> - dashboard: https://d.kernelci.org/build/maestro:699f38921f24bb69463aa0f4
> 
> 
> #kernelci issue maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

-- 
~Randy


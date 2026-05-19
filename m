Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au [45.32.188.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E478F2F
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.32.188.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181518; cv=none; b=FN3PBdfiDPvsYAxzwGWqT5yGXg9ng4VgYS1Sv5K6+hMuZcg957oA4I62FpYn5ULymmlK2LQw8Aoba/jW2aDhUi3iG7KZyHM+CxdTbZL77nkdMSw3lqFKpJ1cxbpP3A21JWTr/iWoRxE0MNFN6PQQr4vXnqFABgbRZmpFYUe4Wp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181518; c=relaxed/simple;
	bh=Q0GIP55qwZ9rlEZ2+GR9NjDYajU0txw3PNQN/gAlEKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXfLPwSiu4VrHkAombXl0lUEdjGH2hLypmPiYGK80eBeJeEdYkmQ1n7XVfzQdHBrO4D6/SxqrgODTgPRSLaMaiQ28y/FxG5i0Aa8Nfuw82xiWJXZltqlN2b3Xe7S/Wxl73BC5Q3VJn29G+/XYjLrmuPBtsfBi+tUnLTGKN67R9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nroach44.id.au; spf=pass smtp.mailfrom=nroach44.id.au; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b=ckywL9tW; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b=ckywL9tW; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b=HI/uWOlG; arc=none smtp.client-ip=45.32.188.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nroach44.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nroach44.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b="ckywL9tW";
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b="ckywL9tW";
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b="HI/uWOlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1779180986;
	bh=Q0GIP55qwZ9rlEZ2+GR9NjDYajU0txw3PNQN/gAlEKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ckywL9tWqjF9PTqPwyN3gFB+4aTxUwRU+1pk3NbLqlaoUJnswCWYuWavgsYOm9wKS
	 WDyVNPW3EF/pZ4+RXw2jmzdtM4aJlyKRX9cTr5muVsu+0OlHtNzdSdr7A7NADDK9H3
	 Q0G6+1CNYhyr7Md5yuEQQETF7kfKj0Qudffr9O5xHznyJvnHdMHq7GDRhd51PNuW0L
	 oypb3CJ12aWKla5kkgV/kjIUI6iCD7ujESjJWj/kMV8uFTBV2U0CaPkiTIgR8dMixf
	 UJD/KabQJ7v4dloBurBL4K5AmDQCyVG2wRG/c28US0vvQ+pMr98jppA0fAD/Twqfx9
	 KVIDBZsGfjYUg==
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPS id 3B50730541
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 16:56:26 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1779180986;
	bh=Q0GIP55qwZ9rlEZ2+GR9NjDYajU0txw3PNQN/gAlEKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ckywL9tWqjF9PTqPwyN3gFB+4aTxUwRU+1pk3NbLqlaoUJnswCWYuWavgsYOm9wKS
	 WDyVNPW3EF/pZ4+RXw2jmzdtM4aJlyKRX9cTr5muVsu+0OlHtNzdSdr7A7NADDK9H3
	 Q0G6+1CNYhyr7Md5yuEQQETF7kfKj0Qudffr9O5xHznyJvnHdMHq7GDRhd51PNuW0L
	 oypb3CJ12aWKla5kkgV/kjIUI6iCD7ujESjJWj/kMV8uFTBV2U0CaPkiTIgR8dMixf
	 UJD/KabQJ7v4dloBurBL4K5AmDQCyVG2wRG/c28US0vvQ+pMr98jppA0fAD/Twqfx9
	 KVIDBZsGfjYUg==
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
	id 1D52F30540; Tue, 19 May 2026 16:56:26 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1779180979;
	bh=Q0GIP55qwZ9rlEZ2+GR9NjDYajU0txw3PNQN/gAlEKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HI/uWOlGyZdpSGymbxes8VBa9PcXF4x9JdztDze4CcaKSwk3Me7AwHLe2C/idogZ5
	 mdD5BVze3wEt7Mz88FxOugZjeCRO5Xub/thAW0Q19QFBwmQPi26avvhU4ZeOJNocJa
	 ms7/7KC9tq3eZdQDwotpouUWNzarPtQaQKP47fugWojxNvSyNZ5oeI8g09LNgHt4u4
	 sPJfAUvhuXIJ/RKGDj2z6j4RI9BshjDf2p/ve5V7YMUP9XQ7f/eu7sjfbHjlLtI9eS
	 8OhjvFDf2TBXwP9PqHshgd/VdpdFRlYTEvYaH2Jz+MYLQShh0zIIuKma6qZCPYrU8t
	 /J3EXfnspOPAA==
Received: from [IPV6:2403:5814:4228:10:3a62:38:7f97:4cc] (unknown [IPv6:2403:5814:4228:10:3a62:38:7f97:4cc])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPSA id 8C97B30532;
	Tue, 19 May 2026 16:56:18 +0800 (AWST)
Message-ID: <331814bc-f68e-4a11-b951-a29fd5b2dffe@nroach44.id.au>
Date: Tue, 19 May 2026 16:56:16 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
To: Tony Rodriguez <unixpro1970@gmail.com>, davem@davemloft.net,
 sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andreas@gaisler.com, thuth@redhat.com,
 regressions@lists.linux.dev, glaubitz@physik.fu-berlin.de
References: <20260519075809.8993-1-unixpro1970@gmail.com>
 <20260519075809.8993-2-unixpro1970@gmail.com>
Content-Language: en-US
From: Nathaniel Roach <nroach44@nroach44.id.au>
In-Reply-To: <20260519075809.8993-2-unixpro1970@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/5/26 15:57, Tony Rodriguez wrote:
> This patch restructures the thread‑stack sizing logic into a single
> if / elif / else chain and introduces an explicit 32KB kernel stack
> for SPARC64. The previous implementation relied on nested conditionals
> and PAGE_SHIFT‑dependent behavior, which produced 8KB or 16KB stacks
> depending on configuration. SPARC64 requires a larger,
> architecture‑specific stack due to its trapframe size, register‑window
> behavior, and deeper call paths.
>
> A reproducible failure case occurs when usbcore is enabled: USB hub
> enumeration (usb_new_device(), hub_port_connect(), PM/QoS helpers)
> allocates large on‑stack structures and recurses through several
> layers of device‑model code. Combined with SPARC64’s trapframe and
> register‑window overhead, this reliably exhausts a 16KB stack and
> results in early‑boot panics.  A 32KB stack eliminates these failures.
>
> The new logic is:
>      SPARC64:
>          THREAD_SIZE = 4 * PAGE_SIZE (32KB)
>          THREAD_SHIFT = PAGE_SHIFT + 2 (log₂(32KB))
>          THREAD_SIZE_ORDER = 2 (4 contiguous pages)
>      Non‑SPARC64 with PAGE_SHIFT == 13:
>          Retains the existing 16KB stack behavior
>      Fallback:
>          Retains the existing 8KB stack behavior
>
> Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au> # SPARC T5-2
> ---
>   arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
> index c8a73dff27f8..6b12a2b66385 100644
> --- a/arch/sparc/include/asm/thread_info_64.h
> +++ b/arch/sparc/include/asm/thread_info_64.h
> @@ -99,13 +99,20 @@ struct thread_info {
>   #define FAULT_CODE_BLKCOMMIT	0x10	/* Use blk-commit ASI in copy_page */
>   #define	FAULT_CODE_BAD_RA	0x20	/* Bad RA for sun4v		   */
>
> -#if PAGE_SHIFT == 13
> -#define THREAD_SIZE (2*PAGE_SIZE)
> -#define THREAD_SHIFT (PAGE_SHIFT + 1)
> -#else /* PAGE_SHIFT == 13 */
> -#define THREAD_SIZE PAGE_SIZE
> -#define THREAD_SHIFT PAGE_SHIFT
> -#endif /* PAGE_SHIFT == 13 */
> +/* thread information allocation */
> +#ifdef CONFIG_SPARC64
> +	#define THREAD_SIZE (4 * PAGE_SIZE)
> +	#define THREAD_SHIFT (PAGE_SHIFT + 2)
> +	#define THREAD_SIZE_ORDER 2
> +#elif PAGE_SHIFT == 13
> +	#define THREAD_SIZE (2 * PAGE_SIZE)
> +	#define THREAD_SHIFT (PAGE_SHIFT + 1)
> +	#define THREAD_SIZE_ORDER 1
> +#else
> +	#define THREAD_SIZE PAGE_SIZE
> +	#define THREAD_SHIFT PAGE_SHIFT
> +	#define THREAD_SIZE_ORDER 0
> +#endif
>
>   /*
>    * macros/functions for gaining access to the thread information structure
> @@ -127,13 +134,6 @@ register struct thread_info *current_thread_info_reg asm("g6");
>   extern struct thread_info *current_thread_info(void);
>   #endif
>
> -/* thread information allocation */
> -#if PAGE_SHIFT == 13
> -#define THREAD_SIZE_ORDER	1
> -#else /* PAGE_SHIFT == 13 */
> -#define THREAD_SIZE_ORDER	0
> -#endif /* PAGE_SHIFT == 13 */
> -
>   #define __thread_flag_byte_ptr(ti)	\
>   	((unsigned char *)(&((ti)->flags)))
>   #define __cur_thread_flag_byte_ptr	__thread_flag_byte_ptr(current_thread_info())
> --
> 2.53.0
>
>

Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3453938C415
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181206; cv=none; b=lRQYLX4dHQq59tw5Lz8T2zHkrBi6Q92TdJZiV4gzHmsLL2ZLWPW2IGst1zkZYnj+dev8P6C8TYI48DQAxDpULHELM7ArQQ+w7cU6iNcDZbvS1oQ1mO2bqgxjM3j5mpz7f43uEeX74S6kPbWP3MoXazqa9pxZYeMo8/QTzvqqQ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181206; c=relaxed/simple;
	bh=67glpMEqmp3cgj1Y882mMOoL/orbcvIp/trxu8TR2Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbRKTVT5EamjOGCWbY2SGIHWd4L4TTL2ehYU2bNedY6h51oRVeSvkxSf37wU2n9HQnHtu7C6uKbF7//O7GKOETf4+QdP0sVNOqfwWrtbuyjwvtbeog5MAhbNtExS+DQTvwTN962OswGh5zNIivjLTte1Xz9CCVL+wW/W6luAvjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHx7XiAL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHx7XiAL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so6462655e9.0
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181199; x=1790785999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMSEiPc5+o34xNJdJ/12oIWCPCor4YVV3MLKdTKKMrI=;
        b=OHx7XiALTrDCQEjTeM4MPTaYFCumVHtN2EbhLfQWS4pn//ZLozGAIXpUYdPdLqqENJ
         cgxovcZixpG2h0oALbxVFErFYb7tVKLLySNm46mfns3odGrqMqNkUGAP9T+wfXh5OCM8
         ONLmpdiJCNwVN11QxJLM/sw7i+Gu48hQRt6b2oX09dhdMjrsky5IVZ3lRpbaC8/LrsYA
         +CrL+vlOTiTRI7TvGVul2RO5ma77SL0JtVkiIs/njT+JhKi25RdqJPevAmnpzmCUfcnV
         hGkIsQY+a3eRMlxgz7luejAIkCwHKWcturOUZ0JUIIYyM11rYJUJxKNOOZgTW18gcs5j
         R6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181199; x=1790785999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMSEiPc5+o34xNJdJ/12oIWCPCor4YVV3MLKdTKKMrI=;
        b=XbZOJv9NXCJbbs6e3JVDnff+X2XRgqn6qESnXO2vOOKJPsOCTreGimzu4Exdjn/Di1
         QIonHwcRcaPjybSxuOIvEw/FDszfLRt40hdlBOl/yfAJXRVULl/dBohFbOvNJiRscAZz
         njjOLHLPZ/Lf3X4r3fRfaLD9LZDaqX7MuF+2kZ9b9zE3tAYbsKZ6RGCYUMJGX6gVStVX
         /bxpvE38st+qTiTQEogOi5JX+Lto/K/Pv6QhnI5w8YCtA4vRDuWIFBzldRX6A4F5Ws7p
         y+wtPhgO0l8W2HhALqASur4j8GHmpNvRGtEzpkAAjwnlAci/a5ugxqQSbtxZUOTvszkN
         Hvig==
X-Forwarded-Encrypted: i=1; AKwUvBw5LYRZvFX7niW/glc5DTSx2TOM8odzOIGpjm1C4wN8awlY/xdioxCB3WVRPpeQptrPngTDcmAQLLTWog==@lists.linux.dev
X-Gm-Message-State: AFuF++n7kNuEPR1hcgIMcdX/WXrHLfFadwxmLnU1ZysB04wp0Y+ydwQq
	LJ1FUBjyLJXFZtzlquQqmxm2ouWROLDCt8dSzhVKtQqIAa6NG4iFAmEA
X-Gm-Gg: AYBFou3JYBsMWBj1op1JWrPIyb+U8iNI6IKm5IauNISB5HXbGmq3ar/P/yaodwVnBKc
	xUm/JMT4Am2eI8Q0X7gk8KneHr85nYyJTS/DTR6sjab560PyVtekLnI6Uf1vSIQ7RQet6LJ8YuZ
	Q15/axO9AuN3a9Llstp/Viyp9FXK1oIZm7cogMuAtRhqHOB5YqNev6fytxWRitwi/ouH/5cjWHA
	66KK1b32WxgXegV6nLvOQa0JjMH/dVMb5CtENGMLwePgQh38cDq0hqXzYvoHnN0uFerlDuqlGXp
	fJ5QmNKdsL3CZH0VtSuc8FOkI7Ff48UsjenqO1vK9kA1IHhNy8Mfv+CFDjleQwuwpF8lMqF6c72
	PLb/TvxLG5FynixYuZavv2cW8j4fr8XDiaQBG3/ozrVHOefKwT5jHp9hfVqlTCrreZdPpioPsaZ
	cBKDnp3ZjOJNwJ9PizY8oBtBqPURmrBpgZZ5zujlMCaEXw7uxuozKWMF4q39Na3Ou5VJd3zML7M
	DAFdnlljg+3ujww8mdfb7ID3ZU0QDN/wl+T3U5JirJFQv6tOtIUNDkeNv1STmSFAoN6/iw=
X-Received: by 2002:a05:600c:1d29:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49fdf12f7a8mr57065555e9.16.1790181199387;
        Wed, 23 Sep 2026 09:33:19 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm78673275e9.1.2026.09.23.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:33:18 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mm: avoid a reclaiming allocation in pud_free_pmd_page()
Date: Wed, 23 Sep 2026 21:33:15 +0500
Message-ID: <20260923163315.275046-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916062222.27347-1-mikhail.v.gavrilov@gmail.com>
References: <20260916062222.27347-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The lock cycle this patch breaks has meanwhile reached released stable
kernels: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on
attribute changes to avoid UAF") went out in 7.2.7 and 6.18.53 on
Sep 21. Both trees already carry 26444eb71465 ("mm/vmalloc: acquire
init_mm lock on huge vmap to avoid ptdump UAF"), and pud_free_pmd_page()
there still allocates with GFP_KERNEL under the init_mm lock, so the
cycle quoted in the patch exists there too, not only in 7.3-rc.

The patch still applies cleanly to current mainline and next-20260922,
and the reproducer below the scissors of the original mail works
unchanged.

Dave, could this go in through x86/urgent for 7.3? Lorenzo, since the
rule it applies comes from your series, a review from you would help.
If either of you would rather fix it differently, I am happy to respin.

-- 
Thanks,
Mikhail

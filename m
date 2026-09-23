Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE5D47426F
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 23:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204638; cv=none; b=M91yrGt46QygcDO3ZCK8r6yLJtFnBm/C0GhGhN4oacMd1DR4svr5aaLjXGyBiYPI+5nm5t3zk3rV/tubUwbdEvSzvrIQJN12MYG97yiiqwiLHQfd393DWb/rNeJ7b1sQbXTg5j0QcHlMl2HaV0t8r4v9Uxiw5gpSqV1xVvXpSTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204638; c=relaxed/simple;
	bh=XgOV2jzBNHsZI4frAsR9/oTXm9YIxk7KkNVPLd2XZuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDkgZvpefv7m5hAZhtkfsjoXPnkQJ9Ziq7mETkOwt5AmUX+brYBFLxQAzBUhsPctgAn59pA4Pzf9CgtHdCJMwR+j8UA+qUUc8O94Wtb7YIfNdHRdc1aM0b7ldLb757Xv6GrML7TwuEK1DnWszNQ66mQ/S/O3G5x+vizzPLen3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lj1Rg91P; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lj1Rg91P"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso956588f8f.0
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790204635; x=1790809435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IT+kPykiDUVKChmVTT4JFPPqjHccYovstoU8+/L1N6I=;
        b=lj1Rg91P/1umrkioZkE79ENZ0uTigh9oGMWGKruOchHjDEwwn5mJ0onckPPdUtco2q
         MLs7I9LWwiXVmxN4Ww3I27iufPwXobLLWnJtuwrujumAajvIXbSDV4+RgKYC9iGftlfY
         qN4T+FxmiRBU2wCITaZeN9OJvOr4TnVPmeYCLjdJf1SgBgJiYd4I9GsM0TDviVnmFeeR
         uo+VPYdVOCMChHLCwysGPbdu7WqxGKGuIDXcDqoFZ94Ox5bhW8PclsQO6wjrRyYeID59
         YBfrcnbEx+WBJGcPwiZ6mnKIJVh6RfgD6miLf6syWbSQsAdD+739kR3jDZvZs74V+pKE
         CviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790204635; x=1790809435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IT+kPykiDUVKChmVTT4JFPPqjHccYovstoU8+/L1N6I=;
        b=LsN/kNmiSGYO5g0cAXuEsUGVSqWXTS0Gay/OcFtDcFsm3x1DIh+qaPUenlDwZADPmt
         qiz+X9SWDW7GVHO8cNpo++gERVCyG5rKMZ7QixDLvK4Sy3xAnL4sfMpwkFrfuQwRC32a
         dllcNPeuzyIK3ojKI6kvjHgU8AIaQ9kx8evqWznStOM3S9AvAGpxEw+jbpIi9U8WmsIW
         bmvmY8zkbnA+xePaYezr3VYodAJW8XIc42qDouoJP3kFsnfCvP8q55lfwSQe1yk/Mt8I
         IsVSulCmCYX+sEzxXqJsb1we1jIkwDwZjRf8uOUeU3XwMDljIyGHFYbS6w2uSvBlaV+N
         c6Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwx7y1ggJO5FCyqrjocQoX5dxzN+roa7CXmiJhSA3DFRDo9HSY9A7SInZRy/0zpEH6b9EBU4z0PXeM3ng==@lists.linux.dev
X-Gm-Message-State: AFuF++mVxV1025jSw4TWu083UHZh1aTlsO1gRImBrEDeGNNmG+ZzGbSw
	1Vbt6neuEtdiRhHP+9WG//y38xuJY7hUZSTB9Pzq/I9qDQ0Nn/3U0EBd
X-Gm-Gg: AYBFou11755eGSpXaTB2Ky3NT7sIEMp3IJvANEUeKBf7KlHSW91ezbZffSTvoXu/5Uf
	yHmecUzWYqL4hiJoShY4NTwZvDB5Vp1AHVtPQVzcIEFkM69HDUrnc/wYxd0PZtpcJWhwoCPQI62
	BhR729qCKDNSCkjq8nwwydqp5jdKaUyNzoWKPD3NmYwz1oRRMDUcn4D6QUS5bXSq4WNxjpZ6coK
	sLWLAHPGPlbc4ePD501bXfmEaRZOebU1dzrnfu/nwNjwt1NQB5YdHXlihlLVlEzh6BAqIbMp7Up
	V2d7fyXxept92Nop9UpGy8jlqvn1rz98W7Wzj7wZO5GaRZ+I41MTio/FJJubjppV1fJJEmSlcIQ
	M5vXSvX8X/WFdcm+hyJhRv0ON5e/s7zOTDawxRioMKW2BVVMZzg6qPJIYWYYQFfjXOyLKv8buCW
	H61UQuUoXruVZK2mMUxCADQEEwUApEt6xmXiw2cbtMt+OadhPEevTRK9qxr05F2s0Z7qfj0ryzu
	LpStJZ/ARAuIHmgmRViaeOo5qRiKHvX4I4bjCTgPzWhKfUZy4MXGepEwnb8h3yitiH/0S9R
X-Received: by 2002:a05:600c:530e:b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-49fe66fbeb9mr10115395e9.25.1790204635318;
        Wed, 23 Sep 2026 16:03:55 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm31259815e9.12.2026.09.23.16.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:03:54 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>,
	Pedro Falcato <pfalcato@suse.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mm: avoid a reclaiming allocation in pud_free_pmd_page()
Date: Thu, 24 Sep 2026 04:03:50 +0500
Message-ID: <20260923230350.365304-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e11449f0-d9ad-4d1b-ab21-2be7d71fe335@intel.com>
References: <e11449f0-d9ad-4d1b-ab21-2be7d71fe335@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/23/26 15:53, Dave Hansen wrote:
> I think that means we can do something like the completely untested
> attached patch.
>
> Looks like Mikhail came to basically the same conclusion.

Yes - v2 does the same thing, and also drops the now-stale NOTE about
the page allocation.  It went out about 20 minutes before your mail:

  https://lore.kernel.org/all/20260923223116.20090-1-mikhail.v.gavrilov@gmail.com/

It was tested on a box that reaches this path at boot without any
instrumentation (from amdgpu_ttm_init()), plus the TTM shrinker
reproducer; the details are below the scissors there.

Two things in the attached sketch, in case it gets picked up as is:

 - The first hunk prepends the patch name to the SPDX line
   ("pud_free_pmd_page-simplify// SPDX-License-Identifier: ..."),
   which will not build.

 - Making it return void conflicts with the prototype in
   include/linux/pgtable.h, and vmap_try_huge_pud() still does
   "if (!pud_free_pmd_page(pud, addr))".  The arm64, riscv and powerpc
   versions also always return 1, so dropping the return value looks
   like a reasonable follow-up across architectures, but I kept v2
   x86-only and returning int so that it stays small for stable.

Your comment above the flush explains it better than the "INVLPG to
clear all paging-structure caches" one-liner.  If you prefer it, I can
send a v3 with it, or feel free to fold it in when applying.

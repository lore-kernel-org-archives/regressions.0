Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217432ABCA
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282363; cv=none; b=jVwSnt0xKAFPVT18F6CrWwEo3dZS32Z8EpY3dabU1C225wa30kcKS7xrQ7boog++fbQlGPOiN5e+bsFLAQqc3gb0lqVDHyzKU9NXzx+F2BGkDP9lUCQGV6C+InUHKEpCwEb8yX90TcUsmGNd4xUv2a2FuyC03Dh7nQxBTxKB9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282363; c=relaxed/simple;
	bh=TSgTzBxTBaErp0Rwm9IWaRiQscwVhgUXab2KvhTnuR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hporBw/UEiwhFVvpDtHciPYhJD9+cqcqpAj+Sr81VXkfb72L16hVV8TAbfPent8uN7Eu+FZcp7/JQKeC/oFzO44g+Svb5Z+XTUy9meKRFgSE1i65B76kWB2LNgZVaNqLiO7AfRDg5eI7sFXPe0dJYDMdb/Igce417ZTEam50RWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jP6MT1U0; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jP6MT1U0"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887d06c669so52075f8f.3
        for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282360; x=1790887160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iop1aYcOw6anN1InXwODk9bRtXPmRstr8biAWMMaEEg=;
        b=jP6MT1U0cmO+laYeJPlIjxFNaN8UVzlTPHUUaxuzc0Yuwzv6zB1IkC92D0QPxOclDn
         EzUNSc9ft5sv/juYN/pvXyTtJAP641Mb7YwpetfOyfCQZXa3PI5TcdBeyKc8pyljfrqz
         qqu5CmmUefo3j1eG4bERa9y3bvfYUD0wUzZHQKLw0MTTdDGpxbQclN8w9Y2xPrFkJF3l
         4I3YNBCvD2C5+GRFyAqQ7nM6tBF1UD0eY4SAd0yH+V0cV1vm8YkLcNtVOqUvIQOWCGA7
         ZwbIak4i744Fx+kyK1jyt2bEHop6AC3nmhI+f1Wz1lo/6bc5Hu4ppXUIBVuhm9e3G8Ta
         eksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282360; x=1790887160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iop1aYcOw6anN1InXwODk9bRtXPmRstr8biAWMMaEEg=;
        b=pfmYBkpiDBC6ZGwNQcRZz1E4poYyiOw9B6eSAyO5W49ruqzqbSIuFpwNKcHmvjpaqO
         rky7dp8OU7I1pnlceusAesXFLxS6KVkm49m1IXibTrmDlehEbUTetsf4t7ZFC9t3yFTV
         WnFr6ryr66w7a8KNwVsOWc/R3zTwlgfiw+ccSk1dcidWeW4G/SsqZBa13yjAChzmHjIR
         /wMLZfiKkABJd2d799qlPOSyfwKR90mfbgrW/rEa9GE+JuEX6G6bmFE2AjHDyXa5rcCd
         5ltnx73pfGqo+JkwmhB5ZAcJx8kMMaQ/D189YectldKHQw4oyRmVuDAc4J0diORUoo2X
         MbXw==
X-Forwarded-Encrypted: i=1; AKwUvBwcv84KotdE0gOnCtNV1PkRFQ9QiGnl1AaqvoDhvUwv9IPUNAxx1VetfHi7IjuU17F2uglgruxfX1pAGw==@lists.linux.dev
X-Gm-Message-State: AFuF++mspPHrpPCZEJC/ycKiVyLZjk6d93z9ma/0ArCuSOzCftyLK/XX
	QaCuYstELTdbI+U5A0LLAzYTpocuwR4rNMNjhmjlnCHfPBpy0W5UXMYt
X-Gm-Gg: AYBFou1t5dkS6wJnnge2i9Nk6uKQbcQcoBqGrAPcH9MzC49I17dG6+QC19mt4WfoVof
	ABUjifjpltXnDzOVt6rnHiJm+bzHb80BFF2RGsXFUM/gjSAMpGOC6ysO1fJMtsLRt+ebK2CX/qj
	hzaMn0sF5UuRqAILFkTPgab4sV/75R68Ds5Fh90IysrK079A0mRTupTg5Pa5sA4fCgY292Kp9yv
	UACaPiGhjjuFG3nWNRL1n+TDxwsoBTw91hBVWGgmsVtSgrqiTVzLeamChq+Ej/boWHXR3ahzD/2
	uiTgJqwxZVIhH++CRe0gu3S/s/MuYEg7u7MCweF8ftF+m3gURiznFyGXjNylxznf3+ajAAk88RE
	gMre2GeXXuhehJJKQQ7ndS/ZA6yIkFUzRst0EZOqH4p5FWKVKmNWl9tl9nmypjzmI3/7p2E6cRW
	w/xYsPjeBxvChTGvUG+C5u4Vap5E1E+BOPLajjuadJS9FVgj+5MnyLS+BnKfGUTQoU4UY+AlVAA
	uTacif3zJ3VVN/fNMxOZe5H7/U405SrcEgDNaRQB2kkVwd/fEqlO04zjTzzJ+FSxVa/J+CYgK2V
	g6A+9g==
X-Received: by 2002:a05:6000:703:b0:486:fb08:2353 with SMTP id ffacd0b85a97d-48872abc9e4mr6181199f8f.31.1790282359492;
        Thu, 24 Sep 2026 13:39:19 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm1408491f8f.5.2026.09.24.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:39:18 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v2] x86/mm: Drop the page allocation from pud_free_pmd_page()
Date: Fri, 25 Sep 2026 01:39:15 +0500
Message-ID: <20260924203915.189167-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d8b502f7-a552-4600-b348-614d1d62afa5@intel.com>
References: <d8b502f7-a552-4600-b348-614d1d62afa5@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/24/26 10:21, Dave Hansen wrote:
> OK, I've got a version of Mikhail's fix with a changelog and comments
> I've munged a bit:
>
>> https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/log/?h=pmdfree
>
> Does that look OK to everyone?

Looks good to me, thanks.  The code is v2 with your comments and the
declarations reordered, so the testing done for v2 still applies.

Two small things, both optional:

 - "The new mmap_read_lock() is held over a GFP_KERNEL allocation":
   the lock held over the allocation is the same init_mm lock, but
   taken in vmap_try_huge_pud(), not the new one in CPA.  Maybe "The
   huge vmap code holds the same lock over a GFP_KERNEL allocation,
   which is a no-no now that reclaim can take it."

 - The kernel-doc lost its "Return:" line while the function still
   returns int, so kernel-doc -Wreturn will complain about it.

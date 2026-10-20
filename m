Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474154;
	b=42DraWKWFPd1Jo6bFE5LdBZKSEbJsr4NwF7vnhu0viMUHta3F0FhKh4TKZVpWRNFGQbV
	 cS9MrMrjR+Y1+xgASLkL80BsLP6vegUqocf51wdYRDDLzAdYQY0tjIedrH05RQdn7BMSZ
	 msQ1CfJmL8lPaenjIK1adAY+piqg9RVsHIvlBLbM/IXVqsAh8DFGgpy2RjyL5jeQm2YLF
	 5d3/tzwayFNsOzHiWrqSz6ZQiEgmGIf4zkvDc8YH2RWr78RVRPvJ+jTpKsdKdd1RUA432
	 0YEsLz3ERCTtbGlt5OFEwTITASHgv5W5ZvS6ymADen2EkFnj6o9edH7XBJBNJ7l6qTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c9R77y7CmEav0rC77XG2mhErQJ4vnSWiNFq8rafLmTg=;
	b=J/Muf35FYg+gNFBbdWXmpzUk1iPSnVY2KsRlFIz/qDU9XiX4bttoun9UGz0fKemn+KTD
	 dtQw59AGCTuoNlim9hXk7KA2XsZj6VRie1g5BNHgnQ5y8LQtKer1UFrmIxGxvyhCPleC0
	 7daRnU8UN7jJDvehSTOYaCRajjzYcBfWZ9yReEmf0/FWvAuEV0ar9oC25vmQao0wblP+D
	 GIwZnxddqYYNS/4uui7Ks992ynDX2l2lWkHmRAQRokX+IVRjpPt5uKSK1snK+3bvhhBsw
	 TbsmiIexAyumnNxo0/AI3NI6jMxamPVD0Dj/1o71ONx36ONYm7Q05VG4qEmn68vZktA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksfOzoy2;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF025606A31C
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 05:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF025606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksfOzoy2
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so196247a12.1
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 22:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474153; x=1793078953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9R77y7CmEav0rC77XG2mhErQJ4vnSWiNFq8rafLmTg=;
        b=ksfOzoy2k4UzkOyBUvHeZUe2GZ+UE6Wm0LpNINPafXxNlAas3hZ22ybR1o2wOflnIH
         uCsoaYEne+eotxVAyUDd3Y7oRqO8tE23aUrXKRWkrzCPmGmINR0SL4HSWjN3/t9xcFH+
         ihRspeJiwWXOf2mSoFGYfxJy3Fo9vyMUGMxdq4npJwZC6eRyJVtBKPAcV1vFVbN0VPWD
         saWc+yxLdOpGt2r5fCD6fH6gvbZYpX4G0IZzigsCIYmOq9gO4SPKNpXYQEcWc7AxpU0u
         CP6s7e6zLOrkJNLinnmWH4ztDnXAybiBNMxXds+OLyD+r84RcI26yK9keRJdK6OrKUCr
         fz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474153; x=1793078953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c9R77y7CmEav0rC77XG2mhErQJ4vnSWiNFq8rafLmTg=;
        b=LOLvuwle9iufGcu5yNL2e74P4vcaFB551IWUNWhwUB8vCqVO/tuv+xO4K6D8QEe0KO
         otV/SGSponhH0KPI7WLHq88qk+VgFL0ONrsvAE+0/riB+8dw8rsImUYN9jT67g5lQsbs
         Y+356Nxzxt9MLq4kfkOgNKotIxV0AlOqwZysG+ZKp6h8LKq71yiT6b190o7MZ2Pg2pOn
         8o4MEK3DGqQYnlA8NFirRm5tMKRm6KVLrPZJ5fPg9Bg122snwhN8BH/gDXbnxXVBcZeh
         0wWcrvsRVej4W3Sk5XyePIel3UIEAGpznEhEc0CxKUiQg/7Qa9/RLLWd++/mkWO362TE
         fmIg==
X-Forwarded-Encrypted: i=1; AKwUvBw5yyXGiTdLXrPs8hK24qpOvpKRmh9uKCshJlPk9H208TpSGoRYbK90km1Cz2GwrdIVOC0XHN2c+5msKQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJeb3pwlqMubjrXcr8cIgT6PaNsOQhzAbkweYjVhxwig75uzdMg
	x3zKmnW+Bg7YEsAmizKzrt7L6QC4dovdu+JUMqfs2g2xBGQQaCAOGISD
X-Gm-Gg: AYBFou2FYk+CSbCfQt6FmtBke6n9x2ijS6FoR7x24nH61F8geLYEKcdDgaRVTnr1Bcj
	wUgd8CquhGDgwAeELGOvz1Do1O60M8T8s7FDI0B/s5uFqGTXSv2+86HPq3A+NojYk6xLSw1K9GS
	JpEEv+cPiWAJdepqfb0MFL/WQ6bODqN2I4GJ2UXq4FHkOMn3XK+BD8tm4TtiKOHR1MSZ9Zn4k+D
	rxqDs7fSZWDo2yILFUpJYLa9yMC/h9sc2vr1Sw3zEibp2ooWALxmEn/wZozNZYsuWZH0PivTkeH
	KcW92lgre+5MQrDPKyGTLcPLvLTpSdZeyu0/pOchcaj7oQMf8VgfvWf6pWNof695qJQdi41rHgZ
	9RBUzrt5NojF2wovQvA9okj/dJfQlRk2P2zu6FQj1Xzj9ZYtmJvOq0377QefMi3i1u/EJa/kq06
	djyA3NIUMBKxEIjrIKcFB1WOW4AwFSMt/1F36WrA9hPabzfrrcisx8SQGvmCWJWpiyfztOJWJpa
	hdo
X-Received: by 2002:a05:6a20:c885:b0:3de:57da:7fa6 with SMTP id adf61e73a8af0-3e26fb93cc3mr773371637.39.1792474152912;
        Mon, 19 Oct 2026 22:29:12 -0700 (PDT)
Received: from hachimi ([101.5.175.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654eaf4e3sm4406759a12.26.2026.10.19.22.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:29:12 -0700 (PDT)
From: Lanfeng Wei <xlfylawarthur@gmail.com>
To: hamzamahfooz@linux.microsoft.com
Cc: airlied@gmail.com,
	decui@microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longli@microsoft.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	regressions@lists.linux.dev,
	simona@ffwll.ch,
	ssengar@linux.microsoft.com,
	stable@vger.kernel.org,
	tzimmermann@suse.de,
	xlfylawarthur@gmail.com
Subject: Re: [PATCH] drm/hyperv: add a parameter to disable the vblank timer
Date: Tue, 20 Oct 2026 13:28:47 +0800
Message-ID: <20261020052849.9241-1-xlfylawarthur@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <atZjtSlZAocUWYBS@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <atZjtSlZAocUWYBS@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 14:38:45 -0400, Hamza Mahfooz wrote:
> I actually have been working on cursor plane support for hyperv-drm.
> I'll post a patch soon.

That will be great. When the patch is ready I'll validate that the
problem at hand is settled.

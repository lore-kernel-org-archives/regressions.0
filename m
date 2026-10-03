Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42138F65D
	for <regressions@lists.linux.dev>; Sat,  3 Oct 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050554; cv=none; b=js1q9L8E8X5VPA73gOgoN09rjdKzhpgXJhXOj4ZPezez9cw5H06etxwxTBZBVRMVg8XmXgktdz9i6lhBIuYBpUJRBYHln3lgefirEVpvehXwVWS+CaK9I4S4eFOCFFPxO2H82OKYl8L0UDcWluT3MmLRG41x3iUpn28TJQmUOFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050554; c=relaxed/simple;
	bh=1fA35AzLMLI8IsjeYb5yaRW8LrQiraBlfHGAy9JiyXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNaGrIyhqwhk1lEHhdskRqkMdNcG6cSnHhFbPrIXRkMXs99slJv1F1vHszNxo8ziNJBkKi/lNWhsfmcY1CST/nbU//n6gW5kIefA58X92SNa1e25BBJyS+SoTp6wPg7yv+TyOn21ZUnzM9zGAWEHFxYbR0eFVd/xkHmT+x1qw5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com; spf=pass smtp.mailfrom=truenas.com; dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b=GBXOXpG7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b="GBXOXpG7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4391615e9.0
        for <regressions@lists.linux.dev>; Sat, 03 Oct 2026 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1791050550; x=1791655350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fA35AzLMLI8IsjeYb5yaRW8LrQiraBlfHGAy9JiyXU=;
        b=GBXOXpG73CWiDd6IF1FLdB+Lvu72uRWB+GXJJOq9SrUIJlvyYFd4ZBUO8GXOI6Dv1o
         aoMU4d38snJR3aPUKKaFhS+ziedsCBWBlGQKRHi16Ubzo0MX5v73kUmSl1czJr8Ab4bK
         oDqorDCvUSSSZ1WGzO3s/zv0eNuVOqwqDzjQpQG9gh1G9/zs8nfiX/ZJkatsU9HkRgK1
         rgjKjQLE/Oi58qALy1m+WIDue1yKoi2R8Esdy/xkEsDXZMTP11nAQAkz9jeSYEWEY1dy
         dPGwDwt6Wgzt/c0+SLXfK9zz0evXSyFC2WM1Y4Aa3arZiAUe3mOQSN34YNCh6kkbiwW8
         bCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050550; x=1791655350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fA35AzLMLI8IsjeYb5yaRW8LrQiraBlfHGAy9JiyXU=;
        b=KPYqgSdnFRHRbFVSuIRvbbWmATt1p1odyD56x4rorARU0I6PQjLZAEcaabfE6Brqhc
         /OaTiEPw+s4J7Ypzbo5ymNjuetzt6uVyJHpfAprbe3pUC2sgcMyiptly+nhPZRZa1wpL
         jDIXDLTliI2J9XXtEW3RLaleoQwAqO4AIbrYChCkSQW3JmxI61ECyRGwMnPA8WGv/oaU
         r/r2ILCFFQIigzgNzor/mCTgx/n0BlxfYe3wuf9Q16OZFxVf6vYC1vdR6ZN6OT8wv0ls
         8cApszsVtIRYwUVtaAs8uBiWwB/6JTX6mJCWVaKTWhdBBRHVRuJcx8oEmBwbBYTOfUUl
         Xn3A==
X-Forwarded-Encrypted: i=1; AKwUvBwR6NdM5EVQpydQmrb2dE3TYBzTCstSGzUAYJaULeoMh1TtDsza05DkFzoTa7om6ZBMkBAxIpynJ9ZOTQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mFPddmveKUzYstamq1/GfcXeAXApM96tcQwZor9H+pHmERaNCg
	oFNlPuKBKrSN+RzClPGKxwIMQdDFldVBWe1J/ZEdUIUV8Mhksa4yXZNWTW0i4pOkIg==
X-Gm-Gg: AYBFou1noLLhy8/EN573RDAP1rJ9qonbwRP/mANsUkC0g3QXoljVH3TKhX+kYVjF3eR
	tC37K3Wu+doi5JP6+hSqjyl7N71OuOmoE41pcM9BAi8huinO4pcYRduvCPzTewv9CSgCD+5wlxt
	RNuE44TlWLeVxbwpSYyuuwKfwP83dqhOup8qmiewQri6AV4gXizfcxILIvArDz940o30PBDdwjA
	q+mGJDHtM8xRuZOAs2uENPKdx5JyNzRW7ErliYfo2TwUyL2KrImBEVUKqhYs7iQXukrjbFuo5C/
	+/MlBEUhSnQRVHFLHt3lGSIXommvAWudFHaqA1fZ10GCwD7QadAjOhSrSCQVvAuTV1spJD2l4E4
	KKnUimYoWv/U3HOFW2gYCBxEO/lB5b25N/ZHJQNWVeL6QO7jjycKPSG4QnWhT+Au1HHcPKRUmZB
	RtyS5hfW/K74RuqCUFPwWmhRyfQoAMDshoRhpS2lWX3U8ylI5QOQ==
X-Received: by 2002:a05:600c:4e55:b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-4a0274e9c4amr107646605e9.3.1791050550421;
        Sat, 03 Oct 2026 11:02:30 -0700 (PDT)
Received: from hamza-PC ([2400:adc1:158:c700::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm12646948f8f.34.2026.10.03.11.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 11:02:29 -0700 (PDT)
Date: Sat, 3 Oct 2026 23:02:24 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: rppt@kernel.org, peterz@infradead.org, akpm@linux-foundation.org, 
	david@kernel.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 4ncienth@gmail.com, sashal@kernel.org, 
	alexander.motin@truenas.com, caleb.stjohn@truenas.com
Subject: Re: [REGRESSION] secretmem: SIGBUS on memfd_secret() pages while
 perf record runs
Message-ID: <asFC2Oryo2-9ww5r@hamza-PC>
References: <20261002175651.811343-1-ameer.hamza@truenas.com>
 <asEllR7if-J3wteg@gremlin>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asEllR7if-J3wteg@gremlin>

On Sat, Oct 03, 2026 at 04:56:32PM +0100, Lorenzo Stoakes (ARM) wrote:
> So this is a bug in perf, which should use its own counter for this,
> AFAICT.

Agreed, and the report's closing question pointed the same way, since
the commit itself closes a real hole. Glad the longstanding perf bug is
getting fixed as a result. Thanks for the analysis and for turning the
fix around so quickly.

Thanks,
Ameer Hamza

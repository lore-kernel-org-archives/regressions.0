Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA70488204
	for <regressions@lists.linux.dev>; Sat,  3 Oct 2026 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791047124; cv=none; b=so64FYjpLkrmrEQC5vQwIAxNDjxNX/LnEjiMknsPGjCRctOwTMe4GGn0S6t0EgFfVRLFaE15a5P8nypRSrTe7vQbcBiA3yRgJb6MnT5P/xBnIOE606gx9cAvpZY5pU+95GcY2hrcyF61MIslt4FLmY0rtC5DWxGKK94zLbMtSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791047124; c=relaxed/simple;
	bh=GkuLv8sohC6Q/26XJMwu4gBJyw5znkiBZUe3IXWF3xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyiFieYlSuDeekIHKX6kC414oE9cAUCFioXeQXwXihCmX8s0z9E+BymbckpFsTleiQpDfaZ9Ykb2EFgVQmAsGV5ED807wId+kbTIR3Xlrd9oXCLDa8OioSQej1uFGpxLvLR1Z5xOcu73zW4fkO2xZ8RkQ3jbQaD8cXz4loB5e5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com; spf=pass smtp.mailfrom=truenas.com; dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b=en8UiUoV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b="en8UiUoV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so6443975e9.3
        for <regressions@lists.linux.dev>; Sat, 03 Oct 2026 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1791047120; x=1791651920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9/myqvD+Wu7dUPpez/fB+sxDbuYQxQUAR18f1smsBQ=;
        b=en8UiUoVm8TldGHtm6g/onN6GOXTHpU3h4dJGk87hOQj3m/QDaqJFYJuc8nbkvJpMQ
         0yEla0YTwS6FhAi39dZ2Um/rRCRMp57l5ZKTRiAJZXMUFQ1p2ufVVu76/+YWn/WdRzvH
         c6f7kNHtSK4nVW5VuwNpHXQ78LPMva0r/VZHb2jddh2f1jvc5AFPsaPIlSTX8ZvheLsW
         gdWWo3hgyc/uIJoYVTzhSMsvijrTstZ+Ra3W20kRnR37q1/RMeQ9WJQERIQa4ZLBPMuw
         yjYcSEXP2C0BMtk0fZPo91XCNb5NZW+c/80BBKN9372TnEQF0A97+X0rWHLaaIE/wNa/
         oGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791047120; x=1791651920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9/myqvD+Wu7dUPpez/fB+sxDbuYQxQUAR18f1smsBQ=;
        b=tU06Tk48rQeImT5BQXWdTNKa02A51r1V61vsCqS79XM4QgsAGNr2EpAYiiGwMSKQOw
         dncwBvlp35LUlEOJOLeFbgaFB9DYP6DlTFPWhGt/pneehzsnKl/R94xfgaTxNsiLiJ3J
         KKH6kVmqBX4eBbUMs5n1hjK6Qb/CdC0HieHkOL9FC82mFxb7iVTxKb13pZHzCFAEE+VK
         bvGUNkE/tO1tac01QfavrDnYkLzwj9gycooqlM2t1bwaOKZXhAi/Ror/7jiuy9Bpif5Y
         oNavqr21e9c3NjgVytGpbNriwa4jX+UHAVGwH1gfmJDxS7eycyB0SJRgqkwnnpMlGtic
         /pGg==
X-Forwarded-Encrypted: i=1; AKwUvBzEHJCKYWl0hMNOfZPazChCfrs+EOFmnnRqph9AZf3APOAblFzUKQg2ek+KE6cmVWFt12llF2enu/58lg==@lists.linux.dev
X-Gm-Message-State: AFuF++k3sAwJi7+6IO6TV4JbbIDDccVSHzoegK5plCT35wyzRmnC7zLC
	Ao3OX98v3XtnyEM2XLvG9cGi0X/El/pSoGZu8EE6lk4RHMkjbN8idQvyodE0pFijkw==
X-Gm-Gg: AYBFou0Sqd1YY9eI/h+dpOx0SuPuGouGWOwbu/Ry7eCo4qYl9pmrA1LrUqM71IT1ToM
	aaKiVUurFtc+mpFofYvDZebgReybMmgU9aiCy9Bne8TarPk1zL5Wu+HPN6DpqT/CxMXB5YK/7RL
	tE2LdB4N71lWcPC78h3I+qCahHo+YLgDWmDHUtAAjBGAFVT+/2QFJ+ZuQGbeIdBaz6/VYuEq72h
	EW1fha4JUIYkgGLxtmLv0P4+uW1jwHwOqP5fqrhUUXcjNCK/0t6WbtfDD5/hhH6dE1HfdhHUZeL
	i7PcysL86y7WvRl3yxMYulNg7805G+Hs5Mf5ImVFwSBb3WblidwRQdN0Y47DxYS2B4cFmovl2hz
	LnFwVSNy97b4zdIc+XvniZyzGZW3xNuAJaQc+Lg+7VM7nW5AMdpAWpeX/JayTMNMdQwR3WVRTDd
	gxaedot+zcYSQuhMcBHxmDY5x+7uKCoFShkjDoH16Flwi1kP+pFw==
X-Received: by 2002:a05:600c:c16f:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-4a027594557mr93542555e9.19.1791047119916;
        Sat, 03 Oct 2026 10:05:19 -0700 (PDT)
Received: from hamza-PC ([2400:adc1:158:c700::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm177013365e9.4.2026.10.03.10.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:05:19 -0700 (PDT)
Date: Sat, 3 Oct 2026 22:05:11 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: ljs@kernel.org, rppt@kernel.org, peterz@infradead.org, 
	akpm@linux-foundation.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 4ncienth@gmail.com, sashal@kernel.org, 
	alexander.motin@truenas.com, caleb.stjohn@truenas.com
Subject: Re: [REGRESSION] secretmem: SIGBUS on memfd_secret() pages while
 perf record runs
Message-ID: <asE0ctESLO306qYs@hamza-PC>
References: <20261002175651.811343-1-ameer.hamza@truenas.com>
 <3c5b9d1e-5ed4-4bd1-b532-39f2d4612965@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c5b9d1e-5ed4-4bd1-b532-39f2d4612965@kernel.org>

On Sat, Oct 03, 2026 at 04:14:49PM +0200, David Hildenbrand (Arm) wrote:
> May I know whether this problem was found by
> 
> (a) A real workload
> 
> (b) A test case
> 
> (c) Complains by some tooling

(a). A root userspace process that keeps secrets in memfd_secret()
failed while perf record ran on the same machine. I reduced it to the
snippet in the report.

Thanks,
Ameer Hamza

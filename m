Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D929A9DC
	for <regressions@lists.linux.dev>; Thu, 15 May 2025 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314763; cv=none; b=dBhJZgYt1uOpbwV0oebRAB/cGELykGsMS6Ba5fFAPUS4EBvXE6S32MxoaMiExVMx5E2sz/g7CJMRVWzTRAu60DoXQQ0NBsTXws8AyXMVnY+3DpHeIM3jSPhcUEtOOkSZ74K6NfA2Ch+WB66Ogr0t7N0UpsCdt8yDCKHeVFP29J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314763; c=relaxed/simple;
	bh=h3rS68HIKc08d7AKcI8nLqC7n+gNjlA+jVgKmtRSPnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tAP8MjflW4fgBH7D6XPFI4kanQkou3tKuP3LeMcz0q/wa8RMzHgUPz9VJ+Ieo/EydoClNilbZPP1mJDXAja+eJJN3kD7jfYO3p8y6kzGyd6Ufp0XoXnPRVzOmyzPEoj+ttmEK4nnJFzrVzttEU/mtpbfr6WAk+JQXHkcmOCgSwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RdO7aUnz; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RdO7aUnz"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so749641f8f.1
        for <regressions@lists.linux.dev>; Thu, 15 May 2025 06:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747314759; x=1747919559; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Sc7s4zPug7QCBZMgJvj3UJe25bWXU+WVGJNmLlNHLU=;
        b=RdO7aUnz3qm3juGcY0aSfaNWW6fNk6rlnHDps1qfmn5xTDNDbS0GxFZLCzyIkMTuNR
         WKW6x1XwH39BB00WanVSmq1o4efFlXY9r9N4KPHgQ/aSoNXsIy3Sajf1zpn739sEHfUK
         eacHBbjrWRTBI00wE/e9u8Y9M6SpcHqHkgcI/C+ZnJzRmol0Q9fCQuROs9fFS1Gz90Ub
         Hj3cvOWaDF5LQHiR8rM35ODUjKjS+IwfRIAPvc+DFFzOLE2Cpppqi3DVqiciB7UEDAt2
         zdF9wBOtd9EfATzBoSq0bk7qeohsl5HsZskHcs5UE528zNouwHvu0TflDzgFQlgTC5Wq
         7FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314759; x=1747919559;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Sc7s4zPug7QCBZMgJvj3UJe25bWXU+WVGJNmLlNHLU=;
        b=bsLIXhwHqpFdU3duUqnR2QHlk7XJ+VUg8EAzb6TeAcH81mf0v2DP6Ms7pnsJVeHNMO
         Uz5q26uUnX9q52dWodnte/JqO4t+bXhC9GA6dL9cDYpmyC28EWvJii3g/WjFKyeGGWnO
         UEZ6UAFUtStylP9AzAvJemI7WSMsfvUnBshusVvarCvaojZnPLa+F5oy1ojtYq6R5pb/
         WonLaAwLkGU2UUUwxnakakATl54Z3baVf8bzprAtav9xzWMRmarJGs12jpKZGWQXYP8x
         d/qS1qNRP6b4ATV3fPZPVYUsQYUASVKMbDbdKtr+S/Rtn9Ez/hxYlC5nMW8E2DVtoOYe
         Gzrg==
X-Forwarded-Encrypted: i=1; AJvYcCUEGWjvcNqG4J/TjlU2Tbuyk7VU2E/O9b6jtydwbiICVsIuCbhzB/3adaR2eijC+8+h4BCvzqjhP6+tmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZUY2op8Zp3I76bhOExgzDhv0LJJEcKtu+DEnIK0ea9627PgEo
	BGq1V9FxsXWLPzNlUN4+qsemRsb0sRNs3aN5RMFBDEJTgHIFcOw7MQGf0y/nMKU=
X-Gm-Gg: ASbGncsv8zrRzDKcyf2NYU3jC5IbqU9NPBMru7gHnUK2e6agFhP17YjuxQKxEgW0Dfm
	9aQq87hOMTYkFoij1XQNZjL4n/zb7owCdGEA0+MxucLfYP/isi9VITZ2qN00CV8exHM4EPyqUaA
	wjxWSnalhgFZhvpHxVtwxtJh28yjCwsY5eePh0cbZ2m02Y4QRtEzmy8Kz9F7XsMVqvZfLNamDLA
	U125+JKeIvm8cbpgi5eLgWn6JUK2keW/dKIjKdoDLsIEb0dc45ECiSahX6UUf7iEVAQlbWxqILs
	rhIFCojHMR4L2YtPBjLcywabaFQk8uiegbsWqYyC6B4pYlBJ0YbfWxn30JPU46dGc5BhQz2pMXE
	=
X-Google-Smtp-Source: AGHT+IGU57xOouQYJOoHXSv7L1CzbOeG1YaSFTyHO9EqbI2SUzbIwPqP+E+vwOTbyIhTtUlFo0TsXw==
X-Received: by 2002:a05:6000:2506:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a3496a71b3mr6559388f8f.20.1747314759305;
        Thu, 15 May 2025 06:12:39 -0700 (PDT)
Received: from u94a (1-174-3-124.dynamic-ip.hinet.net. [1.174.3.124])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4df8299e6dbsm2404387137.14.2025.05.15.06.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:12:38 -0700 (PDT)
Date: Thu, 15 May 2025 21:12:25 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: bpf@vger.kernel.org, linux-mm@kvack.org, Kees Cook <kees@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Eduard Zingerman <eddyz87@gmail.com>
Subject: [REGRESSION] bpf verifier slowdown due to vrealloc() change since
 6.15-rc6
Message-ID: <20250515-bpf-verifier-slowdown-vwo2meju4cgp2su5ckj@6gi6ssxbnfqg>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

There is an observable slowdown when running BPF selftests on 6.15-rc6
kernel[1] built with tools/testing/selftests/bpf/{config,config.x86_64}.
Overall the BPF selftests now takes 2x time to run (from ~25m to ~50m),
and for the verif_scale_loop3_fail it went from single digit seconds to
6 minutes.

Bisect was done by Pawan and got to commit a0309faf1cb0 "mm: vmalloc:
support more granular vrealloc() sizing"[2]. To further zoom in the
issue, I tried removing the only kvrealloc() call in kernel/bpf/ by
reverting commit 96a30e469ca1 "bpf: use common instruction history
across all states", so _krealloc()_ was used instead of kvrealloc(), and
observe that there is _no_ slowdown[3]. While the bisect and the revert
is done on 6.14.7-rc2, I think it should stll be pretty representitive.

In short, the follow were tested:
- 6.15-rc6 (has a0309faf1cb0) -> slowdown
- 6.14.7-rc2 (has a0309faf1cb0) -> slowdown
- 6.14.7-rc2 (has a0309faf1cb0, call to kvrealloc in
  kernel/bpf/verifier.c replaced with krealloc) -> _no_ slowdown

And the vrealloc() change is causing slowdown in kvrealloc() call within
push_insn_history().

  /* for any branch, call, exit record the history of jmps in the given state */
  static int push_insn_history(struct bpf_verifier_env *env, struct bpf_verifier_state *cur,
  			     int insn_flags, u64 linked_regs)
  {
  	struct bpf_insn_hist_entry *p;
  	size_t alloc_size;
  	...
  	if (cur->insn_hist_end + 1 > env->insn_hist_cap) {
  		alloc_size = size_mul(cur->insn_hist_end + 1, sizeof(*p));
  		p = kvrealloc(env->insn_hist, alloc_size, GFP_USER);
  		if (!p)
  			return -ENOMEM;
  		env->insn_hist = p;
  		env->insn_hist_cap = alloc_size / sizeof(*p);
  	}
  
  	p = &env->insn_hist[cur->insn_hist_end];
  	p->idx = env->insn_idx;
  	p->prev_idx = env->prev_insn_idx;
  	p->flags = insn_flags;
  	p->linked_regs = linked_regs;
  
  	cur->insn_hist_end++;
  	env->cur_hist_ent = p;
  
  	return 0;
  }

BPF CI probably hasn't hit this yet because bpf-next have only got to
6.15-rc4.

Shung-Hsi

#regzbot introduced: a0309faf1cb0622cac7c820150b7abf2024acff5

1: https://github.com/shunghsiyu/libbpf/actions/runs/15038992168/job/42266125686
2: https://lore.kernel.org/stable/20250515041659.smhllyarxdwp7cav@desk/
3: https://github.com/shunghsiyu/libbpf/actions/runs/15043433548/job/42280277024

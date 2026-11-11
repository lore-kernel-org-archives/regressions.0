Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355521;
	b=fcc0ZBr1ue0klWN0uDqbVZ1TyQW5Jb7acoMQsS9x2Xk0Oz3NTAzV6ZnLpw7Qjw9LJKbj
	 CRsUith9rawLub8ceWFl7zGlZJTuqODGRYuU76S+pVs+KEH8gAZjo1A4a4P6iNja1ObdR
	 Q/c3q3gRa5dj+EvcJn423Itk5Y/LexD/txp+/q1qbeE1GqZL639FHXK1Mer0c9h3T3y4d
	 W/Gke7uInhw5ta1uCZlGf7O4QvsAdDWC73xhMs/GwMuz1AR7OaVQMI8GFQmsJXddWwnlp
	 gaymHDYN6btw+BVi6dSX5VBEyynOPiUlhzrbVr0LsvQ3+nssMd8iJjHCmO6gJP1lG1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355521;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lXPGOnD2xoKZFTFfUqDx4bSUVEQWrQ7xV1CJ8oeKg+8=;
	b=Bq410E01uqAmX83MQ5a7e97jNyZMCiQzT+pvcMh4gIQF5Na5vydGQy7qGVFEvQTAEQzJ
	 4TyR4qU6erukLNXe9z/nHPzaJMonOz/F+QnP0jEzE/WW6gX4C2cFWvX2BAvU3Xko3n+aM
	 tblQHWcoMMsYFKtJyp2BqWuCLQ0t9fHYxJ35XUoP/N6Bm+iiQaF8nH7tyPln3nJzt3gRl
	 2/7J1oI7TCAP4DwoSP7IRNyOH+FAySy8khhS2E/O+P7o3uk7syLL4k66zh5sK0ueozvMI
	 f5sZVpEbh5xYekYPzwIEJBJu1PEKKJGkwS1XkEndg5LgJng5ivOZnxZiOiqazihkAeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ctOH3hn0;
	arc=none smtp.remote-ip=91.218.175.237
Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35DC606A327
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 00:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35DC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ctOH3hn0
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=lxTQMWQoOBuUMzQsVGk0y2VzRKADUwBbP6Tg7Ined9Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794355518; v=1; x=1794960318;
 b=ctOH3hn0PUbQLLpTbGcEA4wf9tdSFP6RIfOn0jurA7nMbS+cK+K0q1rriYMpzp4JRkVNmbB4
 jtay3mH6UZPP1Rwd30+tN/SOVBzlvdlmFDVoiSFADLF/2swukYOleRAPemwaD/bysqvxpcj7xAJ
 Igi9SVRZA1aOHX/ta5Xur8x0=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id fcc7bf95561a02ce;
	Wed, 11 Nov 2026 00:05:16 +0000
X-Mizu-Trace-ID: fcc7bf95561a02ce
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 16:05:14 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Noah Feldt <noah@feldt.systems>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Karl Erik Hofseth <karl.e.hofseth@opoint.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] mm/memcg: list_del corruption on memcg LRU on
 7.2.11 despite bf4ade7dbd76 (single NUMA node machines)
Message-ID: <avOxF0yKfZ0Wv1gb@linux.dev>
References: <20261110132853.71228-1-noah@feldt.systems>
 <avOsiy7kGWpehKJn@linux.dev>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avOsiy7kGWpehKJn@linux.dev>

On Tue, Nov 10, 2026 at 03:46:07PM -0800, Shakeel Butt wrote:
> Hi Noah, thanks for the report. Can you please first test without MGLRU and see
> if you are still seeing crashes?
> 

Never mind, I think I have a reproducer and the fix. I will post it soon.

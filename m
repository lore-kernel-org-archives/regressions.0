Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354373;
	b=5XGGUaN7N+YiLIuM+CVd9fYpNtL8ILCrdEqYtHcvJG6aiDEYkymFsst9E6yDr6kuoCQc
	 sqtDx2TbpfnkwMfrILiW9MmUtWw7qykbzoaP1RtLbW7STUHME58rxQ8FEiCXe2zbVCCob
	 oz+TLsL869ruYs/nMuYqsy8IPK39FNP6y3wxDMqVlMlHywU2NW3CErc31WKBZcssLsiFB
	 xEskT3ZwUBFrB1HyZhMskpiUKfqGZ5lvSEy0Qqz3FPwn/7lX7yYruKGkBQ3rAXgv74wnE
	 aKGUdXtLBwI63vX7lQ7d9rjoBP+IfQe2HZLUVfp7SNAWI4J4vjVP+Q0N/A8U6gmenyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354373;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bV6upzA5StR1b1wyNZFKOklGx4ha7k0DQuLrcpokU8o=;
	b=M+VBcLlpwDF5iMfvizOPtbBVrre+12q+/IFF189MmCNe22uW4IP8GVzwCoVIrzlTqXq/
	 E3+kflyDDEAfL/UqXigufuiY+xIFhdCQnRZ34V6+h85IF5i5znrKnxnb6m3LasJixZAhg
	 9sR39LV+53KkpBQPvc/WvYCTpPwIISjdRSp+eJMrXupxpNrbBE/9r+8w9X31JDIQsUjDZ
	 7M+ZBIXtC9PQuhNYskplkgRfUWalokg1toPFfYchjIhYtln3RJdoxwjzYjnHzPwq72XlT
	 cn3H2YHPlWaoLppr+RTPLQHsSJx7A1XmMf6PB4LBHDdhRY15uvMfhRnJul3fDApyzlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iY8KHlhx;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (unknown [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30F0606A320
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 23:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30F0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iY8KHlhx
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=bV6upzA5StR1b1wyNZFKOklGx4ha7k0DQuLrcpokU8o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794354369; v=1; x=1794959169;
 b=iY8KHlhxHAGrs3qH58ofiN470cF1KdSVutOe7C6fCq4lJChwUZ2UGV6ybT44OovBxCBR8QGD
 wGJH3G17G8JmKCGR4BQpkXJ81F1ldIXm4IXalSaAKAw1suM8hQWFBqQUEugyhCH3cH0kztOpi4r
 P4bXuooTIpIQ4I0IonLP7vkI=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id da08650cc9e97235;
	Tue, 10 Nov 2026 23:46:09 +0000
X-Mizu-Trace-ID: da08650cc9e97235
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 15:46:07 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Noah Feldt <noah@feldt.systems>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Karl Erik Hofseth <karl.e.hofseth@opoint.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] mm/memcg: list_del corruption on memcg LRU on
 7.2.11 despite bf4ade7dbd76 (single NUMA node machines)
Message-ID: <avOsiy7kGWpehKJn@linux.dev>
References: <20261110132853.71228-1-noah@feldt.systems>
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
In-Reply-To: <20261110132853.71228-1-noah@feldt.systems>

Hi Noah, thanks for the report. Can you please first test without MGLRU and see
if you are still seeing crashes?

Shakeel

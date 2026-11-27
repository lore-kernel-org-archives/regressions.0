Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801543;
	b=l5wFXCLIjlAaaAHYkohjCB+kfNaSH/Qonk0Z7K8lXaC/gLwmjdEdwWqIGw3Kzf4oBwYS
	 B5qz+UO2qHz8vDIr1f7Fz33tON5ANUSH+txvl5jVDm/wT43hItdIuRYKB1b4CDDpUxkGL
	 9elYEdmtZ6sBNoOKrUH3oZvsEkwT8oSjPhwTTlZEsNSFdXemo/TEEx+OOxTe4ak6ZvazH
	 6lvqcgnHotKt49wcMAnn43sof5upUv/66IREq0pDQHEeQppBlwS8zv0AzGlqbS/NzIgM3
	 VItxDGzG0QWeQ2NL6zccybOpaWUrOHl11+NH3XYZVDq2MvCDT1ut92Kj9MQBxwwKvsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801543;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3tIZGzZp9XED1eYsjC7AojoBXQ/Rujhkgy0uNyPbeEw=;
	b=Jt1T8B3ueTtynDLey+M9uTPivqr8YUt1SRn4EI6QjEo3hw9zShtcJ/WTnyWBtyv7pPoN
	 +v7RYiYtxj4zx0yqFs+lyVQEpvKnC8kl99/d0QM8Varpb3gHoAh2DQ0/XDF9jBFQwALt5
	 mi9P3wMOYvqjXtzYUYEhpJU3lq7dqR4HInRYxIb+wkdGN74FDNRVzfwvFgzzDl9uJr62n
	 CQ3b8RRq+JIjwLZRptCDjminznnEkAcdTfHUHMXNksEC1+JAkuxt4QhhqhBnPiHBBFNl9
	 S+ZdunZTKBPTd80hYRwtsJDwljhI1KDloo3FG/0/5znOpH1771Rb1tZUpsFbtnap8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uW6sUxPu;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2383E606A31E
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 17:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2383E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uW6sUxPu
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3tIZGzZp9XED1eYsjC7AojoBXQ/Rujhkgy0uNyPbeEw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795801540; v=1; x=1796406340;
 b=uW6sUxPusHYXxL1n7RbsyImfjuRZtOucfzvlLg2Au9CK+TtjL7RGU7uCv3AbGHlH+NFCBOBu
 r/qv++sQCU68oogFTLYxyLEnfysQCq58mtBLGZAiO95xDdMvMFqI80T2hg8CI9iV24jW5q+hoRN
 e3avGhDmoA66Vaskl+ueb3fw=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c4796adf2f73c32f;
	Fri, 27 Nov 2026 17:45:39 +0000
X-Mizu-Trace-ID: c4796adf2f73c32f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 17:45:35 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Zhang Yi <yi.zhang@huaweicloud.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>, Baokun Li <libaokun@linux.alibaba.com>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	guolingxing <guolingxing@tju.edu.cn>, Josef Bacik <josef@toxicpanda.com>, 
	Chris Mason <mason@kernel.org>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ext4: silent data loss when a split at I/O
 completion gets ENOSPC
Message-ID: <20261127-jf-ext4-enospc-reply-zhangyi-r4-3-59ba31e6e023@linux.dev>
References: <d400205a-0d3d-4ec3-a916-6c0a085841b4@linux.dev>
 <d8ac3185-44c8-41e7-9cbf-3d1baa27f272@huaweicloud.com>
 <20261117-jf-ext4-enospc-reply-zhangyi-v9-b19eeb966ad0@linux.dev>
 <10712329-a587-496d-babf-620ebfd0e60e@huaweicloud.com>
 <20261118-jf-ext4-enospc-reply-zhangyi-v13-3886a3248c32@linux.dev>
 <9be1cb3e-4417-4609-bc0d-67dcfa24aa10@huaweicloud.com>
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
In-Reply-To: <9be1cb3e-4417-4609-bc0d-67dcfa24aa10@huaweicloud.com>

On Tue, Nov 24, 2026 Zhang Yi wrote:
> My idea is to make this a real reservation of currently allocatable
> clusters rather than just a counter check. We can subtract
> sbi->s_mb_free_pending from free_clusters in ext4_has_free_clusters().

This makes sense to me.

> However, the probability of returning ENOSPC for pure append writes
> increases by about 10%.

Our agents tried a close variant of it on mainline, with an exception
for EXT4_MB_USE_RESERVED. The reproducer lost 0 of 72 files instead of
32 of 72. But write() got ENOSPC on 54 of 540 delalloc files, against
none without it, with the filesystem at most about half full. The
writers ran as root. Is your 10% before or after
ext4_should_retry_alloc() gives up? Ours is after.

We can test the patch once it is posted.

- Jose

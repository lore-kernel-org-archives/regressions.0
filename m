Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010777;
	b=Ht00xkWeF+gSa/vqP6A0dKp+Hctk7IO+1HKH4O7ZFY3klTeaFqbaqSCXctZL8/Za5DSO
	 cewT8rt3q645cGBtUULaQTy7iGr2gvokC5JmzwQ+KGWgkPeQS8gx3KtKSWjMXwuiKyJYr
	 fjlNs0aROjU45TF9Cddp4yq2TKKCWr3JxDQFWDijLXgXgDmPIemFzKILFugSzzvXbQ3/H
	 uGVXpGL5zqt27jIL4zXB4BAP0GvHHRJ2qb8FjmvGYYpP2k+UO/j1hsrBi5j+F3tSx5JhH
	 nm+jAa4Wo8ULT6hQQdanM1sQQd/p+A8TpsClTMQ/NInN7oMi0wF+4VUPHp5RNXtkrlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010777;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zDdHU1Mp/qEVnnzvJCrNaX1Z+NluRq2vfZr6YiBJ/FM=;
	b=iCeOmJKP0aong7GVhY3XAobxbsv2RxyMFi9FJJwh9+E82NUvSvaJnLX7L7acOTyFadYK
	 hLBjnZz0UwvZvGpZdMZPUPN69RCwhcDvtbZdmR9Xx1isO9CzNm6NBMcYlwoS7Yzm+pm/L
	 iW7l5+wYCTzwctjOCTsgDLndjQc/43sutSCV0eKGFhRaM4AArBCRyj5gxmnP0oJ8qh/cJ
	 ggfyAEbXM6plwjAlTXbgm7asB50+vIPp5wEB4+G+HqRZNVFSqBBBL0Wb6qie1hbYPKKYf
	 rpFlRPnezvHb4SHECypBrUAocAllVV/iKcMckZ23OehMcsVY3hTBgz1VjS0/5q4uxGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RPBTyxN5;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF4606A31C
	for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 14:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14EF4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RPBTyxN5
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=zDdHU1Mp/qEVnnzvJCrNaX1Z+NluRq2vfZr6YiBJ/FM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795010774; v=1; x=1795615574;
 b=RPBTyxN5I9/5DUMxX7kWUlulbiqTWvooAOtDgIkV/VcY49qaagrx36PoX9i6Lp75iX5gn2i5
 uQtfcMuZGpTuIX+ABE4H20KE3sk4P+NtpTrchLdHEHV2jOXfMalZsT0xgzNP4p0Z/WI0HchJ4Tf
 ZUF9ikc8YjrjAQ7WXctKJwVk=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id aa0702a36d5e3080;
	Wed, 18 Nov 2026 14:06:13 +0000
X-Mizu-Trace-ID: aa0702a36d5e3080
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 14:06:06 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Zhang Yi <yi.zhang@huaweicloud.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>, Baokun Li <libaokun@linux.alibaba.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, guolingxing <guolingxing@tju.edu.cn>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] ext4: silent data loss when a split at I/O
 completion gets ENOSPC
Message-ID: <20261118-jf-ext4-enospc-reply-zhangyi-v13-3886a3248c32@linux.dev>
References: <d400205a-0d3d-4ec3-a916-6c0a085841b4@linux.dev>
 <d8ac3185-44c8-41e7-9cbf-3d1baa27f272@huaweicloud.com>
 <20261117-jf-ext4-enospc-reply-zhangyi-v9-b19eeb966ad0@linux.dev>
 <10712329-a587-496d-babf-620ebfd0e60e@huaweicloud.com>
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
In-Reply-To: <10712329-a587-496d-babf-620ebfd0e60e@huaweicloud.com>

On Wed, Nov 18, 2026 Zhang Yi wrote:
> Could you provide a reproducer? My guess is that high concurrency causes
> the blocks freed by my current process to be taken by I/O issued by
> other processes

That fits our runs. I'll send you the script off-list.

- Jose

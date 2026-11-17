Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925433;
	b=zOcJRhSMH/Lky5Wxu53iO6vTNr09M3n0tyeYcFJlcFv8nTzWcrvfuYKUzkKM3sYYYLyH
	 2WTR+P/zwwKAFiuK6pmrRWmuy0HL2DdsrSpx0g6D87xEkCAzKucSiEheUjTWcUVdeYQR5
	 HpPWzSr+oq6N+MIbttpL9j3t94GTCQOx1TyysKL45XElynCAJpGGd54ZNKlcryT5Ajot8
	 6xD2IOdRXZjSYBE0eXAx81p43F4yy5r548FHAPevbUY/qnGswnVrpa1/NAv4NJWukuDot
	 DqaEDlgSFrCMnuxOZOf93SzWvZiat8NBPt+omKf/3pYtwTA4D3Kclwf3Si4PHjP5TNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925433;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+guh6iE7xYHMDxDlAuP+z2BJ/SuqIHLRli0tfKpcKSA=;
	b=JvLXRjwqCmziojbjxBgQZ5j0XwQca/LGt2+xqfX4pNYccBsK/0wlMNmSl3afQP8nyTB5
	 /JOu/IRyqZvHkd4QlfKMlfF0QC2f3Mhi6HiEaUnwQZYnM/anrKrbfEMO05UZd1qOt5Tq/
	 NrzdBrUMRRpjqeicTyuYpJJgOxmMM6yyxyRsxphqKtR/f9qOjHpxEGDAPfhqhRJRbQIlH
	 CGKe//AWxGMkjI15z5YFyp6FfQa5Yf4ec7gCAFFkM951NyUmRVn9fJDBZAD5X+V/q/NTi
	 0FfU0esGTYIAB8rydVuzA64zWr8pENLcjdbyAvZSoOAtqLTj6Y9aq/5JvDAIuUKSaVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n8EjsBSG;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BF1606A331
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 14:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BF1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n8EjsBSG
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=vVEQh/xrnvg3iNH7ktwVr6B+e0axcBBg8VcjYROWAzs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794925431; v=1; x=1795530231;
 b=n8EjsBSG+Ee9ykzmSLTJnG/Cibj9X7WjI++nFAR8yngKRKtOUu4zPtZ9VUsIDASylbFGOavJ
 rijtRk+aSB2JzY4FQj48ufPfHyh8k3PlppMcvn+eIEh11MHpRQok1gVO0kWoiHyxS/RN/ZWSTaq
 EkFxlUv8TIAqaNTBxkwL46XM=
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 08b26d05a708a200;
	Tue, 17 Nov 2026 14:23:50 +0000
X-Mizu-Trace-ID: 08b26d05a708a200
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 14:23:46 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Zhang Yi <yi.zhang@huaweicloud.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>, Baokun Li <libaokun@linux.alibaba.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, guolingxing <guolingxing@tju.edu.cn>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] ext4: silent data loss when a split at I/O
 completion gets ENOSPC
Message-ID: <20261117-jf-ext4-enospc-reply-zhangyi-v9-b19eeb966ad0@linux.dev>
References: <d400205a-0d3d-4ec3-a916-6c0a085841b4@linux.dev>
 <d8ac3185-44c8-41e7-9cbf-3d1baa27f272@huaweicloud.com>
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
In-Reply-To: <d8ac3185-44c8-41e7-9cbf-3d1baa27f272@huaweicloud.com>

On Tue, Nov 17, 2026 Zhang Yi wrote:
> I think the solution should be based on Ojaswin's counting approach in
> [1] or the PENDING_CONVERSION solution we discussed, and then, after
> extent splitting fails, try to flush the journal and retry.

Thanks for the quick POC. Our agents ran it on [1] rebased on
23c62304dde2 with the report's reproducer, in two separate setups (QEMU
without KVM). None of 72 files lost data in either, against 42 and 53 of
72 with [1] alone.

They found two gaps:

- The new branch in ext4_ext_handle_unwritten_extents() skips both
  ext4_update_inode_fsync_trans() calls, so fdatasync() and O_DSYNC can
  return before the commit. On a full filesystem mounted with
  commit=3600, a shutdown test lost the write in all 13 buffered
  fdatasync() and O_DSYNC cases that reach the zeroout. They pass with
  [1] alone and with that call added.

- Direct writes into preallocated files can still get ENOSPC with the
  POC, on a few percent of files in both setups, with no data lost.

The POC tries the zeroout before the commit and retry. Should it be the
other way around? And will you take guolingxing's patch ([2] in my
report) as well?

- Jose

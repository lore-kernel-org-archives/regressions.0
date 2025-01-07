Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C391F63E3;
	Tue,  7 Jan 2025 19:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278876; cv=none; b=hvYLiCczOsRIvEkC2yZEqN0ErU8P8E4gTJcY009H9QQRLnY6pHm9XKAJzT/0+Dmlv5zmYGRdtd/Ga1YPGKLnL6sRrGgxclcRHWv0zlLeSFW8VnMExci6k3jjbyJgfpJjHCa3gG2se+9HhzkzCywhzu2dZrsEn9HVvnNPyy45QNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278876; c=relaxed/simple;
	bh=xmy9g+W8nLPe44dP17iJzo1hA6W4jFgTgsFHJpxrqq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzWBHXQP69vGRIcGMlp6DCXGMcYZLMfMj7kkjsHBxRkvWjAylR4SuOjLT87cIP3QYHY2QwHVpULRfGWBxvtoefQOZefgrDvjzMGxe0M6qw/V8UMkW2tBIk7/DMNc6dC4vyoM2Rh2s9yW430GwC8F2e7EaYRuMMahxmgvLw9dYXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRS0tOk1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRS0tOk1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DDAC4CED6;
	Tue,  7 Jan 2025 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736278875;
	bh=xmy9g+W8nLPe44dP17iJzo1hA6W4jFgTgsFHJpxrqq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRS0tOk19ItRNt1cFR/fJJItYWpph8E3Ny4QKYSDyaDShIyqJZOY5yiAfdc9H3B25
	 lL93RQiqYXzPQadv/BynIkSfxudgC5Rpt3r5mxG/4GZS0z321OcaCnL7ujc5+AsSXL
	 8XHklDaU0g/BSOvgV2b9Dc1h4eKu7mRMIDZxj3Ij3M8XducwCZmK60cN9YUsI632AK
	 G8iFsQNGI+vEwxwoYpDRJTHPqBbzD595hw+fOKFjjUptlGKdBpHwDKi1YaO4/Jkkwy
	 UYmr5jH7VEQ3mzdfPKujqZhURIIsCNQP0JycXRgXXk1mOlvZaAfrRGdbi1loDyW8Mb
	 3K2O03bW/X+Xg==
Date: Tue, 7 Jan 2025 09:41:14 -1000
From: Tejun Heo <tj@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-mm <linux-mm@kvack.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:4317 enable_work
 (kernel/workqueue.c:4317 (discriminator 1) kernel/workqueue.c:4488
 (discriminator 1))
Message-ID: <Z32DWiVJr2tr-a0x@slm.duckdns.org>
References: <CA+G9fYsQmFT3m1J0uGfWGJjci8MQoB7BNcmhBR175PAbxx9fBg@mail.gmail.com>
 <CA+G9fYt3KUxWNkUbYaDtEL+Nj7fwKRq2eWj-KdVi7+AWFzrJ2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt3KUxWNkUbYaDtEL+Nj7fwKRq2eWj-KdVi7+AWFzrJ2Q@mail.gmail.com>

On Tue, Jan 07, 2025 at 05:11:02PM +0530, Naresh Kamboju wrote:
> # first bad commit: [adcfb264c3ed51fbbf5068ddf10d309a63683868] vmstat:
> disable vmstat_work on vmstat_cpu_down_prep()

Looks like it added unbalanced enable/disable (maybe in the error path?).
Linus already reverted it. I suppose Koichiro will try again soon.

Thanks.

-- 
tejun

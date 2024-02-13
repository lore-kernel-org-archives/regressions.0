Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53D3B290;
	Tue, 13 Feb 2024 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707826848; cv=none; b=dHnpsX3jSEc/fo2LF9NwvD/9xPoqlmI3rqvznvLwoF/74igbXObHrUpQT3j9VpAO1j9PLS6cvlFJvyMkbqN3VokUfq4MdTC1vVsCeOj7Pgg+N1J6x6Z17IGPwy7YQPEm3/dpuUy9n/nyzQnwnunHkO32l5cgUOhuQ6utRU5rJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707826848; c=relaxed/simple;
	bh=OiY1tg+rp5p4VnA6O+alBRjPUgonckFtmecDW5BLEQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2Z2P+D0o0oaYMiCQR30WEwjqYS9FdvFFvFn/kYZqqIb70vPlrnqHaFSL6fIMs1ESvZOrIYOXqIYNuc44eow4+1LwgM5PZgktEp4V8ViTG1H7GiFUoyL3yhsFIxmIEX1LBbW0MB0ahRV8nZSi4jVN/u3WJqGN1qDuvzA6l8LsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXXs+IoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXXs+IoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF99C433C7;
	Tue, 13 Feb 2024 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707826847;
	bh=OiY1tg+rp5p4VnA6O+alBRjPUgonckFtmecDW5BLEQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXXs+IoJuH54pdmfur/LwUJFjsdG2nkQCHkHV6be9I/wFaE5J6gUnILJ+o01NmE2n
	 K3GEs1CAwy8R6EONenYJCk5PZ+8xOkbGgYVwo9IH6RqASnT68Cr3Ge5jL/vudD17lL
	 DtohObBRb8yl9NjrgJuPj3nylD58nwLvEmh3TIn42kgHw1ehxGr9N3wvIrb0aYGiiW
	 htAePP7ILTce1aVMKUDu+Wq+ukiJpL52VVNgcLrVto0HDa1F6+kXbXvoJ8SaM8kPsm
	 o2cCDCMB+7zbG+tpzoXVYbb2Js8l+s1n7VSey9dWXcMxvP7gjkn+z3wvKytU9tHdxy
	 JocNMs+/qGI8w==
Date: Tue, 13 Feb 2024 07:20:45 -0500
From: Sasha Levin <sashal@kernel.org>
To: Leo M <lmartinho03l@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: af_iucv kernel module fails to load on bootup / manual start via
 modprobe
Message-ID: <ZctenWfjE_rpQxAX@sashalap>
References: <CAJbWX8JREQs7wFtFOfkhXTNhP1wPg2qTUQAJVnUMDkMDFmNBFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJbWX8JREQs7wFtFOfkhXTNhP1wPg2qTUQAJVnUMDkMDFmNBFg@mail.gmail.com>

On Mon, Feb 12, 2024 at 04:28:02PM +0100, Leo M wrote:
>Hello,
>
>* update to 5.10.197 included upstream changes from 6.x kernel.
>* in particular this:
>  * https://lore.kernel.org/all/20230917191101.257176910@linuxfoundation.org/
>  * this isn't an issue with the upstream state in the 6.x kernel as
>the problems this change might cause are alleviated by this commit
>that altered the way the iucv_if symbol was loaded:
>     * https://github.com/torvalds/linux/commit/4eb9eda6ba64114d98827e2870e024d5ab7cd35b
>
>In the current state the symbol is not loaded correctly and the
>feature is not working properly.
>
>This issue hasn't been resolved still and is in a broken state up to
>the current 5.10.x version. Is it possible to include this fix in the
>next 5.10.x version?

I'll queue it up, thanks!

-- 
Thanks,
Sasha

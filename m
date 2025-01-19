Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968DD531;
	Sun, 19 Jan 2025 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297110; cv=none; b=JgfxhXM2UoCSfuOWLOcXipAa4tkCD7qbj4IYkBw4rYlI6Ll1oDKPkEolxqg6wd1JNYzb2sLxuqzgplqa2Af+NFjWGOkTq9k2jm30CJMy8+LkXjPEnB9yIczCrtbp3/keWMWsmTG+vR2nk9FwH9EWj1g4TcTTVPOYLolOHSsH+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297110; c=relaxed/simple;
	bh=0T7ca5d3pUTOCen1LNkWu+uVCuuBduNA5en5mQf99T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8PRJc/b0mcjuxUbmOTwhG8g99BVpgjpWV0w13v70AaWUw2Orza6fCo5W7m3kZUdt1tiAScPFyZSHR8nNJHHIqbvK2DH0nn6S/0lFddLkcFKr6z605gVmb0W1FMjAXX0qOu6fPC/B/vuulm6k2G8MtDIJek0CoOXyx6OPwaUeaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TY+821ZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TY+821ZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730BFC4CED6;
	Sun, 19 Jan 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737297109;
	bh=0T7ca5d3pUTOCen1LNkWu+uVCuuBduNA5en5mQf99T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TY+821ZTLPM8ASEKGQR5Z8dGZIeXtYT/0l0bj6/rTo4R8o8GT1U+sgxtfAMhdxmBk
	 f5288vV24rPqJ62/9AK6OAQgRVzrTh/E5oxQdoHfRgZ8H++UgnwZgmx/BXMJYlMJZ9
	 j2hUvKT6rjKc/RIVISgel40I8uB3cSWvPmb4G3K0=
Date: Sun, 19 Jan 2025 15:31:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ffhgfv <744439878@qq.com>
Cc: stable <stable@vger.kernel.org>,
	regressions <regressions@lists.linux.dev>
Subject: Re: Kernel bug found in linux6.9-rc7
Message-ID: <2025011928-aspire-unloving-a9ff@gregkh>
References: <tencent_A3FB116603B2596D123C55CCC8DC2E6E1F07@qq.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_A3FB116603B2596D123C55CCC8DC2E6E1F07@qq.com>

On Sun, Jan 19, 2025 at 09:49:08PM +0800, ffhgfv wrote:
> Hello, I found a bug titled “&nbsp;kernel BUG in ocfs2_refcount_cal_cow_clusters” with modified syzkaller in the Linux6.9-rc7 relegated to oracle cluster file system.
> If you fix this issue, please add the following tag to the commit:
> Reported-by:jianzhou zhao <xnxc22xnxc22@qq.com&gt; , xingwei lee <&nbsp;xrivendell7@gmail.com&gt;

Also, 6.9-rc7 is very old, please try the latest kernel release.

thanks,

greg k-h

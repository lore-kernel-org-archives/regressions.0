Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152027715
	for <regressions@lists.linux.dev>; Wed,  2 Nov 2022 21:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497DBC433C1;
	Wed,  2 Nov 2022 21:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667424252;
	bh=Z1YWUCPn+WkW4MoZOxjloV2tgHKo8RmJvg5EBSyhhZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0lq44JGCcfCvU5VVUQz4jM8QPWDC2fa48WJ4RYxUeQ9VDSnQMaqHGkCcnvLViUX5Q
	 SzAR997mkOM0Rn/ttdwXj/s0ANdMVCR79YEpzoiaC+h1qd9sKBA7ubfUCJWlvS3COD
	 FxdvxS6erxZT7oE2WiXsWDoCmRY9w0wjvrgm4GBY=
Date: Wed, 2 Nov 2022 22:25:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-perf-users@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, regressions@lists.linux.dev,
	lkft-triage@lists.linaro.org, Marco Elver <elver@google.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: qemu-i386: perf: BUG: kernel NULL pointer dereference, address:
 00000148
Message-ID: <Y2LgMYsgj8c7Aj1U@kroah.com>
References: <CA+G9fYsGFoC5TciCuijZXLx48TZnoTSkq=iUgb+vFdi9EYTucw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsGFoC5TciCuijZXLx48TZnoTSkq=iUgb+vFdi9EYTucw@mail.gmail.com>

On Wed, Nov 02, 2022 at 06:42:52PM +0530, Naresh Kamboju wrote:
> Following kernel BUG: noticed on qemu-i386 while running perf test suite
> on stable-rc 6.0.7-rc1 the image was built with gcc-11.
> 
> The System did not recover after the crash.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

What is this a regression from?  Does this happen on older stable
kernels?  Linus's tree?

How about 'git bisect'?

thanks,

greg k-h
